<?php
class Database {
    private static $host = "localhost";
    private static $db   = "car_repair_shop";
    private static $user = "root";
    private static $pass = "root";
    private static $charset = "utf8mb4";
    
    public static function connect() {
        $dsn = "mysql:host=".self::$host.";dbname=".self::$db.";charset=".self::$charset;
        try {
            return new PDO($dsn, self::$user, self::$pass, [
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
            ]);
        } catch (PDOException $e) {
            die("DB connection failed: " . $e->getMessage());
        }
    }
}
?>