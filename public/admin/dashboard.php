<!DOCTYPE html>
<html lang="hu">
    <head>
        <meta charset="UTF-8">
        <title>Dashboard</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <?php require_once 'partials/navbar.php'; ?>
        <div class="container mt-4">
            <div class="alert alert-info">
                Welcome to Car Repair Shop Management System
            </div>
            <h2 class="mb-4">
                Dashboard
            </h2>
            <div class="row">
                <div class="col-md-3 mb-3">
                    <div class="card text-center">
                        <div class="card-body">
                            <h5>Vehicles</h5>
                            <h2 id="vehicleCount">0</h2>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <div class="card text-center">
                        <div class="card-body">
                            <h5>Appointments</h5>
                            <h2 id="appointmentCount">0</h2>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <div class="card text-center">
                        <div class="card-body">
                            <h5>Repair Orders</h5>
                            <h2 id="repairOrderCount">0</h2>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <div class="card text-center">
                        <div class="card-body">
                            <h5>Invoices</h5>
                            <h2 id="invoiceCount">0</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="assets/js/auth-check.js"></script>
        <script src="assets/js/api.js"></script>
        <script src="assets/js/dashboard.js"></script>
    </body>
</html>