<?php
require_once __DIR__ . '/../Helper/Response.php';

class RoleMiddleware {
    public static function allow(array $roles, object $user): void {
        if (!in_array($user->role_id, $roles)) {
            Response::json(403, "Access denied");
            exit;
        }
    }
}
?>