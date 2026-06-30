<?php
require_once __DIR__ . '/../Model/RepairOrderPartModel.php';
require_once __DIR__ . '/../Helper/Response.php';
require_once __DIR__ . '/../Helper/Validator.php';

class RepairOrderPartController {
    private RepairOrderPartModel $model;

    public function __construct() {
        $this->model = new RepairOrderPartModel();
    }

    public function add(array $data): array {
        Validator::validate($data, [
            "repair_order_id" => "required",
            "part_id" => "required",
            "quantity" => "required"
        ]);
        $ok = $this->model->addPart(
            $data['repair_order_id'],
            $data['part_id'],
            $data['quantity']
        );
        if (!$ok) {
            return Response::json(400, "Failed to add part");
        }
        return Response::json(201, "Part added");
    }

    public function get(int $repairOrderId): array {
        return Response::json(200, "Repair order part data", 
            $this->model->getPartsByRepairOrder($repairOrderId)
        );
    }

    public function delete(
        int $repairOrderId,
        int $partId
    ): array {
        $ok = $this->model->deletePart(
            $repairOrderId,
            $partId
        );
        if (!$ok) {
            return Response::json(404, "Record not found");
        }
        return Response::json(200, "Part removed");
    }
}
?>