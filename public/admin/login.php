<!DOCTYPE html>
<html lang="hu">
    <head>
        <meta charset="UTF-8">
        <title>Car Repair Shop</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light">
        <div class="container">
            <div class="row justify-content-center mt-5">
                <div class="col-md-4">
                    <div class="card shadow">
                        <div class="card-header">
                            Bejelentkezés
                        </div>
                        <div class="card-body">
                            <form id="loginForm">
                                <div class="mb-3">
                                    <label class="form-label">Email</label>
                                    <input type="email" id="email" class="form-control" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Jelszó</label>
                                    <input type="password" id="password" class="form-control" required>
                                </div>
                                <button type="submit" class="btn btn-primary w-100">
                                    Bejelentkezés
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="assets/js/auth.js"></script>
    </body>
</html>