<?php
require_once __DIR__ . '/../../config/database.php';

class PasswordResetModel {
    private PDO $pdo;

    public function __construct() {
        $this->pdo = Database::connect();
    }

    public function create($userId, $token, $expiresAt) {
        $stmt = $this->pdo->prepare("
            INSERT INTO password_resets (user_id, token, expires_at, used)
            VALUES (?, ?, ?, 0)
        ");
        return $stmt->execute([$userId, $token, $expiresAt]);
    }

    public function findValidToken($token) {
        $stmt = $this->pdo->prepare("
            SELECT * FROM password_resets
            WHERE token = ? AND used = 0 AND expires_at > NOW()
        ");
        $stmt->execute([$token]);
        return $stmt->fetch();
    }

    public function markUsed($token) {
        $stmt = $this->pdo->prepare("
            UPDATE password_resets SET used = 1 WHERE token = ?
        ");
        return $stmt->execute([$token]);
    }
}
?>