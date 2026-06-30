<?php
require_once __DIR__ . '/../../config/database.php';

class VehicleModel {
    private PDO $pdo;

    public function __construct() {
        $this->pdo = Database::connect();
    }

    public function getAllByCustomer($customerId) {
        $stmt = $this->pdo->prepare("
            SELECT * FROM vehicles WHERE customer_id = ?
        ");
        $stmt->execute([$customerId]);
        return $stmt->fetchAll();
    }

    public function getById($id, $customerId) {
        $stmt = $this->pdo->prepare("
            SELECT * FROM vehicles 
            WHERE vehicle_id = ? AND customer_id = ?
        ");
        $stmt->execute([$id, $customerId]);
        return $stmt->fetch();
    }

    public function create(array $data, int $customerId): bool {
        $stmt = $this->pdo->prepare("
            INSERT INTO vehicles
            (
                customer_id,
                license_plate,
                vin,
                brand,
                model,
                year,
                engine_type,
                mileage
            )
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        ");
        return $stmt->execute([
            $customerId,
            $data['license_plate'],
            $data['vin'],
            $data['brand'],
            $data['model'],
            $data['year'],
            $data['engine_type'],
            $data['mileage']
        ]);
    }

    public function update($id, $data, $customerId) {
        $stmt = $this->pdo->prepare("
            UPDATE vehicles SET
                license_plate = ?,
                vin = ?,
                brand = ?,
                model = ?,
                year = ?,
                engine_type = ?,
                mileage = ?
            WHERE vehicle_id = ? AND customer_id = ?
        ");
        return $stmt->execute([
            $data['license_plate'],
            $data['vin'],
            $data['brand'],
            $data['model'],
            $data['year'],
            $data['engine_type'],
            $data['mileage'],
            $id,
            $customerId
        ]);
    }

    public function delete($id, $customerId) {
        $stmt = $this->pdo->prepare("
            DELETE FROM vehicles 
            WHERE vehicle_id = ? AND customer_id = ?
        ");
        return $stmt->execute([$id, $customerId]);
    }
}
?>