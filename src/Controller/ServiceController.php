<?php
require_once __DIR__ . '/../Model/ServiceModel.php';
require_once __DIR__ . '/../Helper/Response.php';
require_once __DIR__ . '/../Helper/Validator.php';

class ServiceController {
    private ServiceModel $model;

    public function __construct() {
        $this->model = new ServiceModel();
    }

    public function getAll(): array {
        return Response::json(200, "Services list", $this->model->getAll());
    }

    public function getOne(int $id): array {
        $service = $this->model->getById($id);
        if (!$service) {
            return Response::json(404, "Service not found");
        }
        return Response::json(200, "Service data", $service);
    }

    public function create(array $data): array {
        Validator::validate($data, [
            "service_name" => "required",
            "base_price" => "required"
        ]);
        $ok = $this->model->create($data);
        if (!$ok) {
            return Response::json(400, "Failed to create service");
        }
        return Response::json(201, "Service created");
    }

    public function update(int $id, array $data): array {
        Validator::validate($data, [
            "service_name" => "required",
            "base_price" => "required"
        ]);
        $ok = $this->model->update($id, $data);
        if (!$ok) {
            return Response::json(404, "Service not found");
        }
        return Response::json(200, "Service updated");
    }

    public function delete(int $id): array {
        $ok = $this->model->delete($id);
        if (!$ok) {
            return Response::json(404, "Service not found");
        }
        return Response::json(200, "Service deleted");
    }
}
?>