<?php
class Csrf {
    public static function generate() {
        if (session_status() === PHP_SESSION_NONE) session_start();
        if (empty($_SESSION['csrf'])) {
            $_SESSION['csrf'] = bin2hex(random_bytes(32));
        }
        return $_SESSION['csrf'];
    }
    
    public static function validate($token) {
        if (session_status() === PHP_SESSION_NONE) session_start();
        return isset($_SESSION['csrf']) && hash_equals($_SESSION['csrf'], $token);
    }
}
?>