<?php
$currentPage = basename($_SERVER['PHP_SELF']);
function isActive($page) {
    global $currentPage;
    return $currentPage === $page ? 'active' : '';
}
?>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="dashboard.php">
            Car Repair Shop
        </a>
        <div class="navbar-nav">
            <a class="nav-link <?= isActive('dashboard.php') ?>" href="dashboard.php">
                Dashboard
            </a>
            <a class="nav-link <?= isActive('vehicles.php') ?>" href="vehicles.php">
                Vehicles
            </a>
            <a class="nav-link <?= isActive('appointments.php') ?>" href="appointments.php">
                Appointments
            </a>
            <a class="nav-link <?= isActive('repair-orders.php') ?>" href="repair-orders.php">
                Repair Orders
            </a>
            <a class="nav-link <?= isActive('invoices.php') ?>" href="invoices.php">
                Invoices
            </a>
            <a class="nav-link <?= isActive('logout.php') ?>" href="logout.php">
                Logout
            </a>
        </div>
    </div>
</nav>