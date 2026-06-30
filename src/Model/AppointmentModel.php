<?php
require_once __DIR__ . '/../../config/database.php';

class AppointmentModel {
    private PDO $pdo;

    public function __construct() {
        $this->pdo = Database::connect();
    }

    public function create($vehicleId, $date, $desc): bool {
        $stmt = $this->pdo->prepare("
            INSERT INTO appointments
            (vehicle_id, appointment_date, problem_description, status)
            VALUES (?, ?, ?, 'scheduled')
        ");
        return $stmt->execute([$vehicleId, $date, $desc]);
    }

    public function getByVehicle($vehicleId) {
        $stmt = $this->pdo->prepare("
            SELECT * FROM appointments
            WHERE vehicle_id = ?
            ORDER BY appointment_date DESC
        ");
        $stmt->execute([$vehicleId]);
        return $stmt->fetchAll();
    }

    public function getOne($id, $vehicleIds) {
        $stmt = $this->pdo->prepare("
            SELECT * FROM appointments
            WHERE appointment_id = ?
            AND vehicle_id IN ($vehicleIds)
        ");
        $stmt->execute([$id]);
        return $stmt->fetch();
    }

    public function updateStatus($id, $status, $vehicleIds) {
        $stmt = $this->pdo->prepare("
            UPDATE appointments
            SET status = ?
            WHERE appointment_id = ?
            AND vehicle_id IN ($vehicleIds)
        ");
        return $stmt->execute([$status, $id]);
    }
}
?>