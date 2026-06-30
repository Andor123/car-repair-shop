<!DOCTYPE html>
<html lang="hu">
    <head>
        <meta charset="UTF-8">
        <title>Vehicles</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <?php require_once 'partials/navbar.php'; ?>
        <div class="container mt-4">
            <h2>Vehicles</h2>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>License Plate</th>
                        <th>Brand</th>
                        <th>Model</th>
                    </tr>
                </thead>
                <tbody id="vehicleTable"></tbody>
            </table>
        </div>
        <script src="assets/js/auth-check.js"></script>
        <script src="assets/js/api.js"></script>
        <script src="assets/js/vehicles.js"></script>
    </body>
</html>