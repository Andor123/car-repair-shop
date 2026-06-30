<?php
require_once __DIR__ . '/../Service/JwtService.php';
require_once __DIR__ . '/../Helper/Response.php';

class JwtMiddleware {
    public static function handle() {
        $headers = getallheaders();
        $authHeader =
            $headers['Authorization']
            ?? $headers['authorization']
            ?? $_SERVER['HTTP_AUTHORIZATION']
            ?? null;
        if (!$authHeader) {
            Response::json(401, "Missing Authorization header");
        }
        $authHeader = $authHeader;
        if (!str_starts_with($authHeader, 'Bearer ')) {
            Response::json(401, "Invalid token format");
        }
        $token = str_replace('Bearer ', '', $authHeader);
        $token = trim($token);
        $decoded = JwtService::validate($token);
        if (!$decoded) {
            Response::json(401, "Invalid or expired token");
        }
        return $decoded;
    }

    private static function unauthorized($msg) {
        Response::json(401, $msg);
        exit;
    }
}
?>