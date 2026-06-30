<?php
use Firebase\JWT\JWT;
use Firebase\JWT\Key;

class JwtService {
    private static $secret;

    private static function init() {
        self::$secret = $_ENV['JWT_SECRET'] ?? null;
        if (!self::$secret) {
            throw new Exception("JWT_SECRET is missing from environment");
        }
    }

    public static function generate($userId, $roleId, $sessionId) {
        self::init();
        $payload = [
            "iss" => "car_repair_api",
            "iat" => time(),
            "exp" => time() + 3600,
            "user_id" => $userId,
            "role_id" => $roleId,
            "session_id" => $sessionId
        ];
        return JWT::encode($payload, self::$secret, 'HS256');
    }

    public static function validate($token) {
        self::init();
        try {
            return JWT::decode($token, new Key(self::$secret, 'HS256'));
        } catch (Exception $e) {
            return false;
        }
    }
}
?>