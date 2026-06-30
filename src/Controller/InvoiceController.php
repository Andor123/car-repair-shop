<?php
require_once __DIR__ . '/../Model/InvoiceModel.php';
require_once __DIR__ . '/../Model/RepairOrderModel.php';
require_once __DIR__ . '/../Helper/Response.php';
require_once __DIR__ . '/../Helper/Validator.php';

class InvoiceController {
    private InvoiceModel $invoiceModel;
    private RepairOrderModel $repairModel;

    public function __construct() {
        $this->invoiceModel = new InvoiceModel();
        $this->repairModel = new RepairOrderModel();
    }

    public function create(array $data): array {
        Validator::validate($data, [
            "repair_order_id" => "required",
            "payment_method" => "required"
        ]);
        $total = $this->repairModel->calculateTotalCost(
            $data['repair_order_id']
        );
        $ok = $this->invoiceModel->create(
            $data['repair_order_id'],
            $total,
            $data['payment_method']
        );
        if (!$ok) {
            return Response::json(400, "Failed to create invoice");
        }
        return Response::json(201, "Invoice created", $total);
    }

    public function getAll(): array {
        return Response::json(200, "Invoices list", $this->invoiceModel->getAll());
    }

    public function getOne(int $id): array {
        $invoice = $this->invoiceModel->getById($id);
        if (!$invoice) {
            return Response::json(404, "Invoice not found");
        }
        return Response::json(200, "Invoice data", $invoice);
    }

    public function updateStatus(
        int $id,
        array $data
    ): array {
        Validator::validate($data, [
            "status" => "required",
        ]);
        $ok = $this->invoiceModel->updateStatus(
            $id,
            $data['status']
        );
        if (!$ok) {
            return Response::json(404, "Invoice not found");
        }
        return Response::json(200, "Invoice updated");
    }
}
?>