<?php
require_once __DIR__ . '/../../config/database.php';

class InvoiceModel {
    private PDO $pdo;

    public function __construct() {
        $this->pdo = Database::connect();
    }

    public function create(
        int $repairOrderId,
        float $totalAmount,
        string $paymentMethod
    ): bool {
        $stmt = $this->pdo->prepare("
            INSERT INTO invoices
            (
                repair_order_id,
                invoice_date,
                total_amount,
                payment_method,
                status
            )
            VALUES
            (
                ?,
                NOW(),
                ?,
                ?,
                'pending'
            )
        ");
        return $stmt->execute([
            $repairOrderId,
            $totalAmount,
            $paymentMethod
        ]);
    }

    public function getAll() {
        $stmt = $this->pdo->query("
            SELECT *
            FROM invoices
            ORDER BY invoice_date DESC
        ");
        return $stmt->fetchAll();
    }

    public function getById(int $invoiceId) {
        $stmt = $this->pdo->prepare("
            SELECT *
            FROM invoices
            WHERE invoice_id = ?
        ");
        $stmt->execute([$invoiceId]);
        return $stmt->fetch();
    }

    public function updateStatus(
        int $invoiceId,
        string $status
    ): bool {
        $stmt = $this->pdo->prepare("
            UPDATE invoices
            SET status = ?
            WHERE invoice_id = ?
        ");
        $stmt->execute([
            $status,
            $invoiceId
        ]);
        return $stmt->rowCount() > 0;
    }
}
?>