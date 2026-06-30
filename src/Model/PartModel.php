<?php
require_once __DIR__ . '/../../config/database.php';

class PartModel {
    private PDO $pdo;

    public function __construct() {
        $this->pdo = Database::connect();
    }

    public function getAll() {
        $stmt = $this->pdo->query("
            SELECT *
            FROM parts
            ORDER BY part_name
        ");
        return $stmt->fetchAll();
    }

    public function getById(int $id) {
        $stmt = $this->pdo->prepare("
            SELECT *
            FROM parts
            WHERE part_id = ?
        ");
        $stmt->execute([$id]);
        return $stmt->fetch();
    }

    public function create(array $data): bool {
        $stmt = $this->pdo->prepare("
            INSERT INTO parts
            (
                part_name,
                part_number,
                stock_quantity,
                unit_price
            )
            VALUES (?, ?, ?, ?)
        ");
        return $stmt->execute([
            $data['part_name'],
            $data['part_number'],
            $data['stock_quantity'],
            $data['unit_price']
        ]);
    }

    public function update(int $id, array $data): bool {
        $stmt = $this->pdo->prepare("
            UPDATE parts
            SET
                part_name = ?,
                part_number = ?,
                stock_quantity = ?,
                unit_price = ?
            WHERE part_id = ?
        ");
        $stmt->execute([
            $data['part_name'],
            $data['part_number'],
            $data['stock_quantity'],
            $data['unit_price'],
            $id
        ]);
        return $stmt->rowCount() > 0;
    }

    public function delete(int $id): bool {
        $stmt = $this->pdo->prepare("
            DELETE FROM parts
            WHERE part_id = ?
        ");
        $stmt->execute([$id]);
        return $stmt->rowCount() > 0;
    }
}
?>