<?php
require_once __DIR__ . '/../../config/database.php';

class RepairOrderModel {
    private PDO $pdo;

    public function __construct() {
        $this->pdo = Database::connect();
    }

    public function create(
        int $appointmentId,
        int $employeeId,
        string $startDate,
        float $laborCost
    ): bool {
        $stmt = $this->pdo->prepare("
            INSERT INTO repair_orders
            (
                appointment_id,
                employee_id,
                start_date,
                status,
                total_labor_cost
            )
            VALUES
            (
                ?, ?, ?, 'reported', ?
            )
        ");
        return $stmt->execute([
            $appointmentId,
            $employeeId,
            $startDate,
            $laborCost
        ]);
    }

    public function getAll() {
        $stmt = $this->pdo->query("
            SELECT *
            FROM repair_orders
            ORDER BY repair_order_id DESC
        ");
        return $stmt->fetchAll();
    }

    public function getOne(int $id) {
        $stmt = $this->pdo->prepare("
            SELECT *
            FROM repair_orders
            WHERE repair_order_id = ?
        ");
        $stmt->execute([$id]);
        return $stmt->fetch();
    }

    public function getByAppointment(int $appointmentId) {
        $stmt = $this->pdo->prepare("
            SELECT *
            FROM repair_orders
            WHERE appointment_id = ?
        ");
        $stmt->execute([$appointmentId]);
        return $stmt->fetch();
    }

    public function updateStatus(
        int $repairOrderId,
        string $status
    ): bool {
        $stmt = $this->pdo->prepare("
            UPDATE repair_orders
            SET status = ?
            WHERE repair_order_id = ?
        ");
        $stmt->execute([
            $status,
            $repairOrderId
        ]);
        return $stmt->rowCount() > 0;
    }

    public function calculateTotalCost(int $repairOrderId): float {
        $stmt = $this->pdo->prepare("
            SELECT total_labor_cost
            FROM repair_orders
            WHERE repair_order_id = ?
        ");
        $stmt->execute([$repairOrderId]);
        $repairOrder = $stmt->fetch();
        if (!$repairOrder) {
            return 0;
        }
        $laborCost = $repairOrder['total_labor_cost'];
        $stmt = $this->pdo->prepare("
            SELECT
                SUM(quantity * unit_price) AS total
            FROM repair_order_parts
            WHERE repair_order_id = ?
        ");
        $stmt->execute([$repairOrderId]);
        $parts = ($stmt->fetch()['total'] ?? 0);
        $stmt = $this->pdo->prepare("
            SELECT
                SUM(quantity * price) AS total
            FROM repair_order_services
            WHERE repair_order_id = ?
        ");
        $stmt->execute([$repairOrderId]);
        $services =
            ($stmt->fetch()['total'] ?? 0);
        return
            $laborCost +
            $parts +
            $services;
    }
}
?>