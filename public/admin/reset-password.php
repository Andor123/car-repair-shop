<?php
$token = $_GET['token'] ?? '';
if (empty($token)) {
    die("Invalid or missing reset token.");
}
?>
<!DOCTYPE html>
<html lang="hu">
    <head>
        <meta charset="UTF-8">
        <title>Reset Password</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light">
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-header">
                            Reset Password
                        </div>
                        <div class="card-body">
                            <form id="resetForm">
                                <input type="hidden" id="token" value="<?= htmlspecialchars($token) ?>">
                                <div class="mb-3">
                                    <label>New password</label>
                                    <input type="password" id="password" class="form-control" required>
                                </div>
                                <div class="mb-3">
                                    <label>Confirm password</label>
                                    <input type="password" id="confirmPassword" class="form-control" required>
                                </div>
                                <button class="btn btn-primary w-100" type="submit">
                                    Reset password
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="assets/js/reset-password.js"></script>
    </body>
</html>