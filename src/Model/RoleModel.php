<?php
require_once __DIR__ . '/../../config/database.php';

class RoleModel {
    private PDO $pdo;

    public function __construct() {
        $this->pdo = Database::connect();
    }

    public function getRoleIdByName(string $roleName) {
        $stmt = $this->pdo->prepare("
            SELECT role_id
            FROM roles
            WHERE role_name = ?
        ");
        $stmt->execute([$roleName]);
        $role = $stmt->fetch();
        return $role['role_id'] ?? null;
    }
}
?>