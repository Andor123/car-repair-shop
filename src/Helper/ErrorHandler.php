<?php
class ErrorHandler {
    public static function register(): void {
        set_exception_handler([self::class, 'handleException']);
        set_error_handler([self::class, 'handleError']);
        register_shutdown_function([self::class, 'handleShutdown']);
    }

    public static function handleException(Throwable $e): void {
        http_response_code(500);
        header("Content-Type: application/json");
        echo json_encode([
            "status" => 500,
            "message" => "Internal Server Error",
            "error" => $e->getMessage()
        ]);
        exit;
    }

    public static function handleError(
        int $severity,
        string $message,
        string $file,
        int $line
    ): bool {
        throw new ErrorException($message, 0, $severity, $file, $line);
    }

    public static function handleShutdown(): void {
        $error = error_get_last();
        if ($error !== null) {
            http_response_code(500);
            header("Content-Type: application/json");
            echo json_encode([
                "status" => 500,
                "message" => "Fatal Error",
                "error" => $error["message"]
            ]);
        }
    }
}
?>