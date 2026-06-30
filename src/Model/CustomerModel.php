<?php
require_once __DIR__ . '/../../config/database.php';

class CustomerModel {
    private PDO $pdo;

    public function __construct() {
        $this->pdo = Database::connect();
    }

    public function create(
        int $userId,
        string $firstName,
        string $lastName,
        string $phone,
        string $email,
        string $address
    ): bool {
        $stmt = $this->pdo->prepare("
            INSERT INTO customers
            (
                user_id,
                first_name,
                last_name,
                phone,
                email,
                address
            )
            VALUES (?, ?, ?, ?, ?, ?)
        ");
        return $stmt->execute([
            $userId,
            $firstName,
            $lastName,
            $phone,
            $email,
            $address
        ]);
    }

    public function findByUserId(int $userId) {
        $stmt = $this->pdo->prepare("SELECT * FROM customers WHERE user_id = ?");
        $stmt->execute([$userId]);
        return $stmt->fetch();
    }
}
?>