<?php
require_once __DIR__ . '/../Model/RepairOrderServiceModel.php';
require_once __DIR__ . '/../Helper/Response.php';
require_once __DIR__ . '/../Helper/Validator.php';

class RepairOrderServiceController {
    private RepairOrderServiceModel $model;

    public function __construct() {
        $this->model = new RepairOrderServiceModel();
    }

    public function add(array $data): array {
        Validator::validate($data, [
            "repair_order_id" => "required",
            "service_id" => "required",
            "quantity" => "required"
        ]);
        $ok = $this->model->addService(
            $data['repair_order_id'],
            $data['service_id'],
            $data['quantity']
        );
        if (!$ok) {
            return Response::json(400, "Failed to add service");
        }
        return Response::json(201, "Service added");
    }

    public function get(int $repairOrderId): array {
        return Response::json(200, "Repair order service data", 
            $this->model->getServicesByRepairOrder($repairOrderId)
        );
    }

    public function delete(
        int $repairOrderId,
        int $serviceId
    ): array {
        $ok = $this->model->deleteService(
            $repairOrderId,
            $serviceId
        );
        if (!$ok) {
            return Response::json(404, "Record not found");
        }
        return Response::json(200, "Service removed");
    }
}