<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

date_default_timezone_set('Europe/Belgrade');

require_once __DIR__ . '/../vendor/autoload.php';
require_once __DIR__ . '/../src/Model/CustomerModel.php';
require_once __DIR__ . '/../src/Helper/Response.php';
require_once __DIR__ . '/../src/Helper/ErrorHandler.php';
require_once __DIR__ . '/../src/Security/JwtMiddleware.php';
require_once __DIR__ . '/../src/Security/RoleMiddleware.php';
require_once __DIR__ . '/../src/Controller/AuthController.php';
require_once __DIR__ . '/../src/Controller/VehicleController.php';
require_once __DIR__ . '/../src/Controller/AppointmentController.php';
require_once __DIR__ . '/../src/Controller/RepairOrderController.php';
require_once __DIR__ . '/../src/Controller/EmployeeController.php';
require_once __DIR__ . '/../src/Controller/PartController.php';
require_once __DIR__ . '/../src/Controller/ServiceController.php';
require_once __DIR__ . '/../src/Controller/RepairOrderPartController.php';
require_once __DIR__ . '/../src/Controller/RepairOrderServiceController.php';
require_once __DIR__ . '/../src/Controller/InvoiceController.php';

header("Content-Type: application/json");
header("Content-Security-Policy: default-src 'self'");

ErrorHandler::register();

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__ . '/..');
$dotenv->load();

$authController = new AuthController();
$vehicleController = new VehicleController();
$appointmentController = new AppointmentController();
$repairOrderController = new RepairOrderController();
$employeeController = new EmployeeController();
$partController = new PartController();
$serviceController = new ServiceController();
$repairOrderPartController = new RepairOrderPartController();
$repairOrderServiceController = new RepairOrderServiceController();
$invoiceController = new InvoiceController();

$data = json_decode(file_get_contents("php://input"), true);

$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);

$scriptName = dirname($_SERVER['SCRIPT_NAME']);
$uri = str_replace($scriptName, '', $uri);

$uri = rtrim($uri, '/');

$method = $_SERVER['REQUEST_METHOD'];

$authUser = function () {
    return JwtMiddleware::handle();
};

//
// Authentication
//
if ($uri === "/api/auth/register" && $method === "POST") {
    echo json_encode($authController->register(
        $data
    ));
    exit;
}

if ($uri === "/api/auth/login" && $method === "POST") {
    echo json_encode($authController->login(
        $data['email'],
        $data['password']
    ));
    exit;
}

if ($uri === "/api/auth/logout" && $method === "POST") {
    $user = $authUser();
    echo json_encode(
        $authController->logout($user)
    );
    exit;
}

if ($uri === "/api/auth/forgot-password" && $method === "POST") {
    echo json_encode($authController->forgotPassword(
        $data['email']
    ));
    exit;
}

if ($uri === "/api/auth/reset-password"  && $method === "POST") {
    echo json_encode($authController->resetPassword(
        $data['token'],
        $data['new_password']
    ));
    exit;
}

//
// Vehicles
//
if ($uri === "/api/vehicles" && $method === "GET") {
    $user = $authUser();
    $customerModel = new CustomerModel();
    $customer = $customerModel->findByUserId(
        $user->user_id
    );

    if (!$customer) {
        Response::json(404, "Customer profile not found");
        exit;
    }

    $customerId = $customer['customer_id'];

    echo json_encode(
        $vehicleController->getAll($customerId)
    );
    exit;
}
    
if (preg_match("#^/api/vehicles/(\d+)$#", $uri, $matches) && $method === "GET") {
    $user = $authUser();
    $customerModel = new CustomerModel();
    $customer = $customerModel->findByUserId(
        $user->user_id
    );

    if (!$customer) {
        Response::json(404, "Customer profile not found");
        exit;
    }

    $customerId = $customer['customer_id'];
    $vehicleId = $matches[1];

    echo json_encode(
        $vehicleController->getOne($vehicleId, $customerId)
    );
    exit;
}

if ($uri === "/api/vehicles" && $method === "POST") {
    $user = $authUser();
    $customerModel = new CustomerModel();
    $customer = $customerModel->findByUserId(
        $user->user_id
    );

    if (!$customer) {
        Response::json(404, "Customer profile not found");
        exit;
    }

    $customerId = $customer['customer_id'];

    echo json_encode(
        $vehicleController->create($data, $customerId)
    );
    exit;
}

if (preg_match("#^/api/vehicles/(\d+)$#", $uri, $matches) && $method === "PUT") {
    $user = $authUser();
    $customerModel = new CustomerModel();
    $customer = $customerModel->findByUserId(
        $user->user_id
    );

    if (!$customer) {
        Response::json(404, "Customer profile not found");
        exit;
    }

    $customerId = $customer['customer_id'];
    $vehicleId = $matches[1];

    echo json_encode(
        $vehicleController->update($vehicleId, $data, $customerId)
    );
    exit;
}

if (preg_match("#^/api/vehicles/(\d+)$#", $uri, $matches) && $method === "DELETE") {
    $user = $authUser();
    $customerModel = new CustomerModel();
    $customer = $customerModel->findByUserId(
        $user->user_id
    );

    if (!$customer) {
        Response::json(404, "Customer profile not found");
        exit;
    }

    $customerId = $customer['customer_id'];
    $vehicleId = $matches[1];

    echo json_encode(
        $vehicleController->delete($vehicleId, $customerId)
    );
    exit;
}

//
// Appointments
//
if ($uri === "/api/appointments" && $method === "GET") {
    $user = $authUser();

    echo json_encode(
        $appointmentController->getAll($user->user_id)
    );
    exit;
}

if ($uri === "/api/appointments" && $method === "POST") {
    $user = $authUser();

    echo json_encode(
        $appointmentController->create($user->user_id, $data)
    );
    exit;
}

if (preg_match("#^/api/appointments/(\d+)$#", $uri, $matches) && $method === "PATCH") {
    $user = $authUser();
    $appointmentId = $matches[1];

    echo json_encode(
        $appointmentController->updateStatus(
            $user->user_id,
            $appointmentId,
            $data['status']
        )
    );
    exit;
}

//
// Repair orders
//
if ($uri === "/api/repair-orders" && $method === "POST") {
    $user = $authUser();
    RoleMiddleware::allow([1, 2, 3, 4], $user);

    echo json_encode(
        $repairOrderController->create($data)
    );
    exit;
}

if ($uri === "/api/repair-orders" && $method === "GET") {
    $user = $authUser();
    RoleMiddleware::allow([1, 2, 3, 4], $user);

    echo json_encode(
        $repairOrderController->getAll()
    );
    exit;
}

if (preg_match("#^/api/repair-orders/(\d+)$#", $uri, $matches) && $method === "GET") {
    $user = $authUser();
    RoleMiddleware::allow([1, 2, 3, 4], $user);
    $repairOrderId = $matches[1];

    echo json_encode(
        $repairOrderController->getOne(
            $repairOrderId
        )
    );
    exit;
}

if (preg_match("#^/api/repair-orders/(\d+)$#", $uri, $matches) && $method === "PATCH") {
    $user = $authUser();
    RoleMiddleware::allow([1, 2, 3, 4], $user);
    $repairOrderId = $matches[1];

    echo json_encode(
        $repairOrderController->updateStatus(
            $repairOrderId,
            $data['status']
        )
    );
    exit;
}

//
// Employess
//
if ($uri === "/api/employees" && $method === "GET") {
    $user = $authUser();
    RoleMiddleware::allow([1, 4], $user);

    echo json_encode(
        $employeeController->getAll()
    );
    exit;
}

if (preg_match("#^/api/employees/(\d+)$#", $uri, $matches) && $method === "GET") {
    $user = $authUser();
    RoleMiddleware::allow([1, 4], $user);
    $employeeId = $matches[1];

    echo json_encode(
        $employeeController->getOne($employeeId)
    );
    exit;
}

if ($uri === "/api/employees" && $method === "POST") {
    $user = $authUser();
    RoleMiddleware::allow([1, 4], $user);

    echo json_encode(
        $employeeController->create($data)
    );
    exit;
}

if (preg_match("#^/api/employees/(\d+)$#", $uri, $matches) && $method === "PUT") {
    $user = $authUser();
    RoleMiddleware::allow([1, 4], $user);
    $employeeId = $matches[1];

    echo json_encode(
        $employeeController->update($employeeId, $data)
    );
    exit;
}

if (preg_match("#^/api/employees/(\d+)$#", $uri, $matches) && $method === "DELETE") {
    $user = $authUser();
    RoleMiddleware::allow([1, 4], $user);
    $employeeId = $matches[1];

    echo json_encode(
        $employeeController->delete($employeeId)
    );
    exit;
}

//
// Parts
//
if ($uri === "/api/parts" && $method === "GET") {
    $user = $authUser();
    RoleMiddleware::allow([1, 2, 4], $user);

    echo json_encode(
        $partController->getAll()
    );
    exit;
}

if (preg_match("#^/api/parts/(\d+)$#", $uri, $matches) && $method === "GET") {
    $user = $authUser();
    RoleMiddleware::allow([1, 2, 4], $user);
    $partId = $matches[1];

    echo json_encode(
        $partController->getOne(
            $partId
        )
    );
    exit;
}

if ($uri === "/api/parts" && $method === "POST") {
    $user = $authUser();
    RoleMiddleware::allow([1, 2, 4], $user);

    echo json_encode(
        $partController->create($data)
    );
    exit;
}

if (preg_match("#^/api/parts/(\d+)$#", $uri, $matches) && $method === "PUT") {
    $user = $authUser();
    RoleMiddleware::allow([1, 2, 4], $user);
    $partId = $matches[1];    

    echo json_encode(
        $partController->update(
            $partId,
            $data
        )
    );
    exit;
}

if (preg_match("#^/api/parts/(\d+)$#", $uri, $matches) && $method === "DELETE") {
    $user = $authUser();
    RoleMiddleware::allow([1, 2, 4], $user);
    $partId = $matches[1];

    echo json_encode(
        $partController->delete(
            $partId
        )
    );
    exit;
}

//
// Services
//
if ($uri === "/api/services" && $method === "GET") {
    $user = $authUser();
    RoleMiddleware::allow([1, 2, 4], $user);

    echo json_encode(
        $serviceController->getAll()
    );
    exit;
}

if (preg_match("#^/api/services/(\d+)$#", $uri, $matches) && $method === "GET") {
    $user = $authUser();
    RoleMiddleware::allow([1, 2, 4], $user);
    $serviceId = $matches[1];

    echo json_encode(
        $serviceController->getOne(
            $serviceId
        )
    );
    exit;
}

if ($uri === "/api/services" && $method === "POST") {
    $user = $authUser();
    RoleMiddleware::allow([1, 2, 4], $user);

    echo json_encode(
        $serviceController->create($data)
    );
    exit;
}

if (preg_match("#^/api/services/(\d+)$#", $uri, $matches) && $method === "PUT") {
    $user = $authUser();
    RoleMiddleware::allow([1, 2, 4], $user);
    $serviceId = $matches[1];

    echo json_encode(
        $serviceController->update(
            $serviceId,
            $data
        )
    );
    exit;
}

if (preg_match("#^/api/services/(\d+)$#", $uri, $matches) && $method === "DELETE") {
    $user = $authUser();
    RoleMiddleware::allow([1, 2, 4], $user);
    $serviceId = $matches[1];

    echo json_encode(
        $serviceController->delete(
            $serviceId
        )
    );
    exit;
}

//
// Repair order parts
//
if (preg_match("#^/api/repair-orders/(\d+)/parts$#", $uri, $matches) && $method === "POST") {
    $user = $authUser();
    RoleMiddleware::allow([1, 2, 3, 4], $user);

    echo json_encode(
        $repairOrderPartController->add($data)
    );
    exit;
}

if (preg_match("#^/api/repair-orders/(\d+)/parts$#", $uri, $matches) && $method === "GET") {
    $user = $authUser();
    RoleMiddleware::allow([1, 2, 3, 4], $user);
    $repairOrderId = $matches[1];

    echo json_encode(
        $repairOrderPartController->get(
            $repairOrderId
        )
    );
    exit;
}

if (preg_match("#^/api/repair-orders/(\d+)/parts/(\d+)$#", $uri, $matches) && $method === "DELETE") {
    $user = $authUser();
    RoleMiddleware::allow([1, 2, 3, 4], $user);
    $repairOrderId = $matches[1];
    $partId = $matches[2];

    echo json_encode(
        $repairOrderPartController->delete(
            $repairOrderId,
            $partId
        )
    );
    exit;
}

//
// Repair order services
//
if (preg_match("#^/api/repair-orders/(\d+)/services$#", $uri, $matches) && $method === "POST") {
    $user = $authUser();
    RoleMiddleware::allow([1, 2, 3, 4], $user);

    echo json_encode(
        $repairOrderServiceController->add($data)
    );
    exit;
}

if (preg_match("#^/api/repair-orders/(\d+)/services$#", $uri, $matches) && $method === "GET") {
    $user = $authUser();
    RoleMiddleware::allow([1, 2, 3, 4], $user);
    $repairOrderId = $matches[1];

    echo json_encode(
        $repairOrderServiceController->get(
            $repairOrderId
        )
    );
    exit;
}

if (preg_match("#^/api/repair-orders/(\d+)/services/(\d+)$#", $uri, $matches) && $method === "DELETE") {
    $user = $authUser();
    RoleMiddleware::allow([1, 2, 3, 4], $user);
    $repairOrderId = $matches[1];
    $serviceId = $matches[2];

    echo json_encode(
        $repairOrderServiceController->delete(
            $repairOrderId,
            $serviceId
        )
    );
    exit;
}

//
// Invoices
//
if ($uri === "/api/invoices" && $method === "GET") {
    $user = $authUser();
    RoleMiddleware::allow([1, 2, 4], $user);

    echo json_encode(
        $invoiceController->getAll()
    );
    exit;
}

if (preg_match("#^/api/invoices/(\d+)$#", $uri, $matches) && $method === "GET") {
    $user = $authUser();
    RoleMiddleware::allow([1, 2, 4], $user);
    $invoiceId = $matches[1];

    echo json_encode(
        $invoiceController->getOne(
            $invoiceId
        )
    );
    exit;
}

if ($uri === "/api/invoices" && $method === "POST") {
    $user = $authUser();
    RoleMiddleware::allow([1, 2, 4], $user);

    echo json_encode(
        $invoiceController->create($data)
    );
    exit;
}

if (preg_match("#^/api/invoices/(\d+)$#", $uri, $matches) && $method === "PUT") {
    $user = $authUser();
    RoleMiddleware::allow([1, 2, 4], $user);
    $invoiceId = $matches[1];

    echo json_encode(
        $invoiceController->updateStatus(
            $invoiceId,
            $data
        )
    );
    exit;
}
?>