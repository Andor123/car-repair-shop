<?php
class Response {
    public static function json(
        int $status,
        string $message,
        mixed $data = null,
        array $errors = []
    ): void {
        http_response_code($status);
        $response = [
            "status" => $status,
            "message" => $message
        ];
        if ($data !== null) {
            $response["data"] = $data;
        }
        if (!empty($errors)) {
            $response["errors"] = $errors;
        }
        header("Content-Type: application/json");
        echo json_encode($response);
        exit;
    }
}
?>