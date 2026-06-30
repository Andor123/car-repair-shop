<!DOCTYPE html>
<html lang="hu">
    <head>
        <meta charset="UTF-8">
        <title>Repair Orders</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <?php require_once 'partials/navbar.php'; ?>
        <div class="container mt-4">
            <h2>Repair Orders</h2>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Vehicle</th>
                        <th>Employee</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody id="repairOrderTable"></tbody>
            </table>
        </div>
        <script src="assets/js/auth-check.js"></script>
        <script src="assets/js/api.js"></script>
        <script src="assets/js/repair-orders.js"></script>
    </body>
</html>