<?php
require_once __DIR__ . '/../../config/database.php';

class ServiceModel {
    private PDO $pdo;

    public function __construct() {
        $this->pdo = Database::connect();
    }

    public function getAll() {
        $stmt = $this->pdo->query("
            SELECT *
            FROM services
            ORDER BY service_name
        ");
        return $stmt->fetchAll();
    }

    public function getById(int $id) {
        $stmt = $this->pdo->prepare("
            SELECT *
            FROM services
            WHERE service_id = ?
        ");
        $stmt->execute([$id]);
        return $stmt->fetch();
    }

    public function create(array $data): bool {
        $stmt = $this->pdo->prepare("
            INSERT INTO services
            (
                service_name,
                base_price
            )
            VALUES (?, ?)
        ");
        return $stmt->execute([
            $data['service_name'],
            $data['base_price']
        ]);
    }

    public function update(int $id, array $data): bool {
        $stmt = $this->pdo->prepare("
            UPDATE services
            SET
                service_name = ?,
                base_price = ?
            WHERE service_id = ?
        ");
        $stmt->execute([
            $data['service_name'],
            $data['base_price'],
            $id
        ]);
        return $stmt->rowCount() > 0;
    }

    public function delete(int $id): bool {
        $stmt = $this->pdo->prepare("
            DELETE FROM services
            WHERE service_id = ?
        ");
        $stmt->execute([$id]);
        return $stmt->rowCount() > 0;
    }
}
?>