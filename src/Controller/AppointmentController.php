<?php
require_once __DIR__ . '/../Model/AppointmentModel.php';
require_once __DIR__ . '/../Model/CustomerModel.php';
require_once __DIR__ . '/../Model/VehicleModel.php';
require_once __DIR__ . '/../Helper/Response.php';
require_once __DIR__ . '/../Helper/Validator.php';

class AppointmentController {
    private $model;
    private $customerModel;
    private $vehicleModel;

    public function __construct() {
        $this->model = new AppointmentModel();
        $this->customerModel = new CustomerModel();
        $this->vehicleModel = new VehicleModel();
    }

    private function getCustomerId($userId) {
        $customer = $this->customerModel->findByUserId($userId);
        if (!$customer) {
            return null;
        }
        return $customer['customer_id'];
    }

    private function getVehicleIds($customerId) {
        $vehicles = $this->vehicleModel->getAllByCustomer($customerId);
        return array_column($vehicles, 'vehicle_id');
    }

    public function create($userId, $data) {
        Validator::validate($data, [
            "vehicle_id" => "required",
            "appointment_date" => "required",
            "problem_description" => "required"
        ]);
        $customerId = $this->getCustomerId($userId);
        if (!$customerId) {
            return Response::json(404, "Customer not found");
        }
        $vehicle = $this->vehicleModel->getById(
            $data['vehicle_id'],
            $customerId
        );
        if (!$vehicle) {
            return Response::json(403, "Invalid vehicle");
        }
        $ok = $this->model->create(
            $data['vehicle_id'],
            $data['appointment_date'],
            $data['problem_description']
        );
        if (!$ok) {
            return Response::json(400, "Error creating appointment");
        }
        return Response::json(201, "Appointment created");
    }

    public function getAll($userId) {
        $customerId = $this->getCustomerId($userId);
        if (!$customerId) {
            return Response::json(404, "Customer not found");
        }
        $vehicles = $this->getVehicleIds($customerId);
        $all = [];
        foreach ($vehicles as $vid) {
            $all = array_merge(
                $all,
                $this->model->getByVehicle($vid)
            );
        }
        return Response::json(200, "Appointments list", $all);
    }

    public function updateStatus($userId, $id, $status) {
        $customerId = $this->getCustomerId($userId);
        $vehicles = $this->getVehicleIds($customerId);
        $vehicleIds = implode(",", $vehicles);
        $ok = $this->model->updateStatus($id, $status, $vehicleIds);
        if (!$ok) {
            return Response::json(400, "Update failed");
        }
        return Response::json(200, "Status updated");
    }
}
?>