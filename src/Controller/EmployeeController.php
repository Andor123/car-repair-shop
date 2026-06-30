<?php
require_once __DIR__ . '/../Model/EmployeeModel.php';
require_once __DIR__ . '/../Helper/Response.php';
require_once __DIR__ . '/../Helper/Validator.php';

class EmployeeController {
    private EmployeeModel $model;

    public function __construct() {
        $this->model = new EmployeeModel();
    }

    public function getAll(): array {
        return Response::json(200, "Employees list", $this->model->getAll());
    }

    public function getOne(int $id): array {
        $employee = $this->model->getById($id);
        if (!$employee) {
            return Response::json(404, "Employee not found");
        }
        return Response::json(200, "Employee data", $employee);
    }

    public function create(array $data): array {
        Validator::validate($data, [
            "username" => "required",
            "email" => "required|email",
            "password" => "required",
            "role_id" => "required",
            "first_name" => "required",
            "last_name" => "required",
            "phone" => "required"
        ]);
        $ok = $this->model->create($data);
        if (!$ok) {
            return Response::json(500, "Failed to create employee");
        }
        return Response::json(201, "Employee created");
    }

    public function update(int $id, array $data): array {
        Validator::validate($data, [
            "username" => "required",
            "email" => "required|email",
            "password" => "required",
            "role" => "required",
            "first_name" => "required",
            "last_name" => "required",
            "phone" => "required"
        ]);
        $ok = $this->model->update($id, $data);
        if (!$ok) {
            return Response::json(404, "Employee not found");
        }
        return Response::json(200, "Employee updated");
    }

    public function delete(int $id): array {
        $ok = $this->model->deactivate($id);
        if (!$ok) {
            return Response::json(404, "Employee not found");
        }
        return Response::json(200, "Employee deactivated");
    }
}