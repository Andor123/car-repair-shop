<?php
require_once __DIR__ . '/../../config/database.php';

class EmployeeModel {
    private PDO $pdo;

    public function __construct() {
        $this->pdo = Database::connect();
    }

    public function create(array $data): bool {
        $this->pdo->beginTransaction();
        try {
            $stmt = $this->pdo->prepare("
                INSERT INTO users
                (
                    username,
                    email,
                    password_hash,
                    role_id
                )
                VALUES (?, ?, ?, ?)
            ");
            $stmt->execute([
                $data['username'],
                $data['email'],
                password_hash($data['password'], PASSWORD_BCRYPT),
                $data['role_id']
            ]);
            $userId = $this->pdo->lastInsertId();
            $stmt = $this->pdo->prepare("
                INSERT INTO employees
                (
                    user_id,
                    first_name,
                    last_name,
                    phone,
                    email
                )
                VALUES (?, ?, ?, ?, ?)
            ");
            $stmt->execute([
                $userId,
                $data['first_name'],
                $data['last_name'],
                $data['phone'],
                $data['email']
            ]);
            $this->pdo->commit();
            return true;

        } catch (Exception $e) {
            $this->pdo->rollBack();
            return false;
        }
    }

    public function getAll() {
        $stmt = $this->pdo->query("
            SELECT
                e.employee_id,
                e.first_name,
                e.last_name,
                e.phone,
                e.email,
                r.role_name
            FROM employees e
            JOIN users u ON e.user_id = u.user_id
            JOIN roles r ON u.role_id = r.role_id
            ORDER BY e.last_name
        ");
        return $stmt->fetchAll();
    }

    public function getById(int $id) {
        $stmt = $this->pdo->prepare("
            SELECT
                e.employee_id,
                e.first_name,
                e.last_name,
                e.phone,
                e.email,
                r.role_name
            FROM employees e
            JOIN users u ON e.user_id = u.user_id
            JOIN roles r ON u.role_id = r.role_id
            WHERE e.employee_id = ?
        ");
        $stmt->execute([$id]);
        return $stmt->fetch();
    }

    public function update(int $id, array $data): bool {
        $stmt = $this->pdo->prepare("
            UPDATE employees
            SET
                first_name = ?,
                last_name = ?,
                phone = ?,
                email = ?
            WHERE employee_id = ?
        ");

        $stmt->execute([
            $data['first_name'],
            $data['last_name'],
            $data['phone'],
            $data['email'],
            $id
        ]);

        return $stmt->rowCount() > 0;
    }

    public function deactivate(int $id): bool {
        $stmt = $this->pdo->prepare("
            UPDATE users
            SET is_active = 0
            WHERE user_id = (
                SELECT user_id
                FROM employees
                WHERE employee_id = ?
            )
        ");
        $stmt->execute([$id]);
        return $stmt->rowCount() > 0;
    }
}
?>