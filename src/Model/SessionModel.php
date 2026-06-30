<?php
require_once __DIR__ . '/../../config/database.php';

class SessionModel {
    private PDO $pdo;

    public function __construct() {
        $this->pdo = Database::connect();
    }

    public function create(
        int $userId,
        string $ip,
        string $deviceType,
        string $browser,
        string $os
    ): int {
        $stmt = $this->pdo->prepare("
            INSERT INTO user_sessions
            (
                user_id,
                login_time,
                ip_address,
                device_type,
                browser,
                os
            )
            VALUES (?, NOW(), ?, ?, ?, ?)
        ");
        $stmt->execute([
            $userId,
            $ip,
            $deviceType,
            $browser,
            $os
        ]);
        return $this->pdo->lastInsertId();
    }

    public function saveLocation(
        int $sessionId,
        array $geo
    ): void {
        $stmt = $this->pdo->prepare("
            INSERT INTO ip_locations
            (
                session_id,
                country,
                city,
                isp
            )
            VALUES (?, ?, ?, ?)
        ");
        $stmt->execute([
            $sessionId,
            $geo['country'],
            $geo['city'],
            $geo['isp']
        ]);
    }

    public function logout(int $sessionId): bool {
        $stmt = $this->pdo->prepare("
            UPDATE user_sessions
            SET logout_time = NOW()
            WHERE session_id = ?
            AND logout_time IS NULL
        ");
        $stmt->execute([$sessionId]);
        return $stmt->rowCount() > 0;
    }
}