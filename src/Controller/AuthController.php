<?php
require_once __DIR__ . '/../../config/database.php';
require_once __DIR__ . '/../Model/UserModel.php';
require_once __DIR__ . '/../Model/CustomerModel.php';
require_once __DIR__ . '/../Model/PasswordResetModel.php';
require_once __DIR__ . '/../Model/RoleModel.php';
require_once __DIR__ . '/../Model/SessionModel.php';
require_once __DIR__ . '/../Service/JwtService.php';
require_once __DIR__ . '/../Service/DeviceDetectionService.php';
require_once __DIR__ . '/../Service/BrowserService.php';
require_once __DIR__ . '/../Service/OperatingSystemService.php';
require_once __DIR__ . '/../Service/GeoLocationService.php';
require_once __DIR__ . '/../Service/EmailService.php';
require_once __DIR__ . '/../Helper/Response.php';
require_once __DIR__ . '/../Helper/Validator.php';

class AuthController {
    private UserModel $userModel;
    private CustomerModel $customerModel;
    private RoleModel $roleModel;
    private PDO $pdo;

    public function __construct() {
        $this->pdo = Database::connect();
        $this->userModel = new UserModel();
        $this->customerModel = new CustomerModel();
        $this->roleModel = new RoleModel();
    }

    public function register(array $data): array {
        try {
            Validator::validate($data, [
                "username" => "required",
                "email" => "required|email",
                "password" => "required",
                "first_name" => "required",
                "last_name" => "required",
                "phone" => "required",
                "address" => "required"
            ]);
            $this->pdo->beginTransaction();
            $roleId = $this->roleModel->getRoleIdByName('customer');
            if (!$roleId) {
                throw new Exception("Customer role not found");
            }
            $passwordHash = password_hash(
                $data['password'],
                PASSWORD_BCRYPT
            );
            $userId = $this->userModel->create(
                $data['username'],
                $data['email'],
                $passwordHash,
                $roleId
            );
            $this->customerModel->create(
                $userId,
                $data['first_name'],
                $data['last_name'],
                $data['phone'],
                $data['email'],
                $data['address']
            );
            $this->pdo->commit();
            return Response::json(201, "Registration successful");
        } catch (Exception $e) {
            $this->pdo->rollBack();
            return Response::json(500, $e->getMessage());
        }
    }

    public function login($email, $password) {
        $user = $this->userModel->findByEmail($email);
        if (!$user) {
            return Response::json(404, "User not found");
        }
        if (!password_verify($password, $user['password_hash'])) {
            return Response::json(401, "Invalid credentials");
        }
        $ip = $_SERVER['REMOTE_ADDR'] ?? '0.0.0.0';
        
        if ($ip === '::1' || $ip === '127.0.0.1') {
            $ipForGeo = '8.8.8.8';
        } else {
            $ipForGeo = $ip;
        }

        $device = DeviceDetectionService::detect();
        $browser = BrowserService::detect();
        $os = OperatingSystemService::detect();

        $sessionModel = new SessionModel();
        $sessionId = $sessionModel->create(
            $user['user_id'],
            $ip,
            $device['device_type'],
            $browser,
            $os
        );
    
        $geo = GeoLocationService::lookup($ipForGeo);
        if ($geo) {
            $sessionModel->saveLocation(
                $sessionId,
                $geo
            );
        }
        $token = JwtService::generate($user['user_id'], $user['role_id'], $sessionId);
        return Response::json(200, "Login successful", $token);
    }

    public function logout($user): array {
        $sessionModel = new SessionModel();
        $ok = $sessionModel->logout(
            $user->session_id
        );
        if (!$ok) {
            return Response::json(400, "Logout failed");
        }
        return Response::json(200, "Logged out successfully");
    }
    
    public function forgotPassword($email) {
        $user = $this->userModel->findByEmail($email);
        if (!$user) {
            return Response::json(404, "User not found");
        }
        $token = bin2hex(random_bytes(32));
        $hash = hash('sha256', $token);
        $expires = date("Y-m-d H:i:s", time() + 3600);
        $resetModel = new PasswordResetModel();
        $resetModel->create($user['user_id'], $hash, $expires);
        $sent = EmailService::sendPasswordReset($user['email'], $hash);
        if (!$sent) {
            return Response::json(400, "Email failed to send");
        }
        return Response::json(200, "Reset link generated", $hash);
    }

    public function resetPassword($token, $newPassword) {
        $resetModel = new PasswordResetModel();
        $record = $resetModel->findValidToken($token);
        if (!$record) {
            return Response::json(400, "Invalid or expired token");
        }
        $hash = password_hash($newPassword, PASSWORD_BCRYPT);
        $stmt = Database::connect()->prepare("
            UPDATE users SET password_hash = ? WHERE user_id = ?
        ");
        $stmt->execute([$hash, $record['user_id']]);
        $resetModel->markUsed($token);
        return Response::json(200, "Password updated successfully");
    }
}