<?php
require_once __DIR__ . '/../Model/PartModel.php';
require_once __DIR__ . '/../Helper/Response.php';
require_once __DIR__ . '/../Helper/Validator.php';

class PartController {
    private PartModel $model;

    public function __construct() {
        $this->model = new PartModel();
    }

    public function getAll(): array {
        return Response::json(200, "Parts list", $this->model->getAll());
    }

    public function getOne(int $id): array {
        $part = $this->model->getById($id);
        if (!$part) {
            return Response::json(404, "Part not found");
        }
        return Response::json(200, "Part data", $part);
    }

    public function create(array $data): array {
        Validator::validate($data, [
            "part_name" => "required",
            "part_number" => "required",
            "stock_quantity" => "required",
            "unit_price" => "required"
        ]);
        $ok = $this->model->create($data);
        if (!$ok) {
            return Response::json(400, "Failed to create part");
        }
        return Response::json(201, "Part created");
    }

    public function update(int $id, array $data): array {
        Validator::validate($data, [
            "part_name" => "required",
            "part_number" => "required",
            "stock_quantity" => "required",
            "unit_price" => "required"
        ]);
        $ok = $this->model->update($id, $data);
        if (!$ok) {
            return Response::json(404, "Part not found");
        }
        return Response::json(200, "Part updated");
    }

    public function delete(int $id): array {
        $ok = $this->model->delete($id);
        if (!$ok) {
            return Response::json(404, "Part not found");
        }
        return Response::json(200, "Part deleted");
    }
}
?>