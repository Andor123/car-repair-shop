<!DOCTYPE html>
<html lang="hu">
    <head>
        <meta charset="UTF-8">
        <title>Invoices</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <?php require_once 'partials/navbar.php'; ?>
        <div class="container mt-4">
            <h2>Invoices</h2>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Repair Order</th>
                        <th>Total Amount</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody id="invoiceTable"></tbody>
            </table>
        </div>
        <script src="assets/js/auth-check.js"></script>
        <script src="assets/js/api.js"></script>
        <script src="assets/js/invoices.js"></script>
    </body>
</html>