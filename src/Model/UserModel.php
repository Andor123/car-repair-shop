<?php
require_once __DIR__ . '/../../config/database.php';

class UserModel {
    private PDO $pdo;

    public function __construct() {
        $this->pdo = Database::connect();
    }

    public function create(
        string $username,
        string $email,
        string $passwordHash,
        int $roleId
    ): int {
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
            $username,
            $email,
            $passwordHash,
            $roleId
        ]);
        return (int)$this->pdo->lastInsertId();
    }

    public function findByEmail($email) {
        $stmt = $this->pdo->prepare("SELECT * FROM users WHERE email = ?");
        $stmt->execute([$email]);
        return $stmt->fetch();
    }
    
    public function findById($id) {
        $stmt = $this->pdo->prepare("SELECT * FROM users WHERE user_id = ?");
        $stmt->execute([$id]);
        return $stmt->fetch();
    }
}
?>