<?php
class OperatingSystemService {
    public static function detect(): string {
        $ua = $_SERVER['HTTP_USER_AGENT'] ?? '';

        if (str_contains($ua, 'Windows')) {
            return 'Windows';
        }

        if (str_contains($ua, 'Linux')) {
            return 'Linux';
        }

        if (str_contains($ua, 'Android')) {
            return 'Android';
        }

        if (str_contains($ua, 'iPhone')) {
            return 'iOS';
        }

        if (str_contains($ua, 'Mac OS')) {
            return 'macOS';
        }

        return 'Unknown';
    }
}
?>