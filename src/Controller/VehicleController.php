<?php
require_once __DIR__ . '/../Model/VehicleModel.php';
require_once __DIR__ . '/../Model/CustomerModel.php';
require_once __DIR__ . '/../Helper/Response.php';
require_once __DIR__ . '/../Helper/Validator.php';

class VehicleController {
    private $model;

    public function __construct() {
        $this->model = new VehicleModel();
    }

    public function getAll($customerId) {
        return Response::json(200, "Vehicles list", 
            $this->model->getAllByCustomer($customerId)
        );
    }

    public function getOne($id, $customerId) {
        $vehicle = $this->model->getById($id, $customerId);
        if (!$vehicle) {
            return Response::json(404, "Vehicle not found");
        }
        return Response::json(200, "Vehicle data", $vehicle);
    }

    public function create($data, $customerId) {
        Validator::validate($data, [
            "license_plate" => "required",
            "vin" => "required",
            "brand" => "required",
            "model" => "required",
            "year" => "required",
            "engine_type" => "required",
            "mileage" => "required"
        ]);
        $ok = $this->model->create($data, $customerId);
        if (!$ok) {
            return Response::json(400, "Error creating vehicle");
        }
        return Response::json(201, "Vehicle created");
    }

    public function update($id, $data, $customerId) {
        Validator::validate($data, [
            "license_plate" => "required",
            "vin" => "required",
            "brand" => "required",
            "model" => "required",
            "year" => "required",
            "engine_type" => "required",
            "mileage" => "required"
        ]);
        $ok = $this->model->update($id, $data, $customerId);
        if (!$ok) {
            return Response::json(400, "Update failed");
        }
        return Response::json(200, "Vehicle updated");
    }

    public function delete($id, $customerId) {
        $ok = $this->model->delete($id, $customerId);
        if (!$ok) {
            return Response::json(400, "Delete failed");
        }
        return Response::json(200, "Vehicle deleted");
    }
}
?>