<?php
require_once __DIR__ . '/../../config/database.php';

class RepairOrderPartModel {
    private PDO $pdo;

    public function __construct() {
        $this->pdo = Database::connect();
    }

    public function addPart(
        int $repairOrderId,
        int $partId,
        int $quantity
    ): bool {
        $this->pdo->beginTransaction();
        try {
            $stmt = $this->pdo->prepare("
                SELECT
                    stock_quantity,
                    unit_price
                FROM parts
                WHERE part_id = ?
            ");
            $stmt->execute([$partId]);
            $part = $stmt->fetch();
            if (!$part) {
                throw new Exception("Part not found");
            }
            if ($part['stock_quantity'] < $quantity) {
                throw new Exception("Not enough stock");
            }
            $stmt = $this->pdo->prepare("
                INSERT INTO repair_order_parts
                (
                    repair_order_id,
                    part_id,
                    quantity,
                    unit_price
                )
                VALUES (?, ?, ?, ?)
            ");
            $stmt->execute([
                $repairOrderId,
                $partId,
                $quantity,
                $part['unit_price']
            ]);
            $stmt = $this->pdo->prepare("
                UPDATE parts
                SET stock_quantity =
                    stock_quantity - ?
                WHERE part_id = ?
            ");
            $stmt->execute([
                $quantity,
                $partId
            ]);
            $this->pdo->commit();
            return true;

        } catch (Exception $e) {
            $this->pdo->rollBack();
            return false;
        }
    }

    public function getPartsByRepairOrder(int $repairOrderId) {
        $stmt = $this->pdo->prepare("
            SELECT
                p.part_name,
                rp.quantity,
                rp.unit_price
            FROM repair_order_parts rp
            JOIN parts p
                ON rp.part_id = p.part_id
            WHERE rp.repair_order_id = ?
        ");
        $stmt->execute([$repairOrderId]);
        return $stmt->fetchAll();
    }

    public function deletePart(
        int $repairOrderId,
        int $partId
    ): bool {
        $stmt = $this->pdo->prepare("
            DELETE FROM repair_order_parts
            WHERE repair_order_id = ?
            AND part_id = ?
        ");
        $stmt->execute([
            $repairOrderId,
            $partId
        ]);
        return $stmt->rowCount() > 0;
    }
}
?>