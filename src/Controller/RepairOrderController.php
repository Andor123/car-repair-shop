<?php
require_once __DIR__ . '/../Model/RepairOrderModel.php';
require_once __DIR__ . '/../Helper/Response.php';
require_once __DIR__ . '/../Helper/Validator.php';

class RepairOrderController {
    private RepairOrderModel $model;

    public function __construct() {
        $this->model = new RepairOrderModel();
    }

    public function create(array $data): array {
        Validator::validate($data, [
            "appointment_id" => "required",
            "employee_id" => "required",
            "start_date" => "required",
            "total_labor_cost" => "required"
        ]);
        $ok = $this->model->create(
            $data['appointment_id'],
            $data['employee_id'],
            $data['start_date'],
            $data['total_labor_cost']
        );
        if (!$ok) {
            return Response::json(500, "Failed to create repair order");
        }
        return Response::json(201, "Repair order created");
    }

    public function getAll(): array {
        return Response::json(200, "Repair orders list", $this->model->getAll());
    }

    public function getOne(int $id) {
        $repairOrder = $this->model->getOne($id);
        if (!$repairOrder) {
            return Response::json(404, "Repair order not found");
        }
        return Response::json(200, "Repair order data", $repairOrder);
    }

    public function updateStatus(
        int $repairOrderId,
        string $status
    ): array {
        $ok = $this->model->updateStatus(
            $repairOrderId,
            $status
        );
        if (!$ok) {
            return Response::json(404, "Repair order not found");
        }
        return Response::json(200, "Status updated");
    }
}