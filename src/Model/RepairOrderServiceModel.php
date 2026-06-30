<?php
require_once __DIR__ . '/../../config/database.php';

class RepairOrderServiceModel {
    private PDO $pdo;

    public function __construct() {
        $this->pdo = Database::connect();
    }

    public function addService(
        int $repairOrderId,
        int $serviceId,
        int $quantity
    ): bool {
        $stmt = $this->pdo->prepare("
            SELECT base_price
            FROM services
            WHERE service_id = ?
        ");
        $stmt->execute([$serviceId]);
        $service = $stmt->fetch();
        if (!$service) {
            return false;
        }
        $stmt = $this->pdo->prepare("
            INSERT INTO repair_order_services
            (
                repair_order_id,
                service_id,
                quantity,
                price
            )
            VALUES (?, ?, ?, ?)
        ");
        return $stmt->execute([
            $repairOrderId,
            $serviceId,
            $quantity,
            $service['base_price']
        ]);
    }

    public function getServicesByRepairOrder(int $repairOrderId) {
        $stmt = $this->pdo->prepare("
            SELECT
                s.service_name,
                ros.quantity,
                ros.price
            FROM repair_order_services ros
            JOIN services s
                ON ros.service_id = s.service_id
            WHERE ros.repair_order_id = ?
        ");
        $stmt->execute([$repairOrderId]);
        return $stmt->fetchAll();
    }

    public function deleteService(
        int $repairOrderId,
        int $serviceId
    ): bool {
        $stmt = $this->pdo->prepare("
            DELETE FROM repair_order_services
            WHERE repair_order_id = ?
            AND service_id = ?
        ");
        $stmt->execute([
            $repairOrderId,
            $serviceId
        ]);
        return $stmt->rowCount() > 0;
    }
}
?>