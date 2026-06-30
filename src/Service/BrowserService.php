<?php
class BrowserService {
    public static function detect(): string {
        $ua = $_SERVER['HTTP_USER_AGENT'] ?? '';

        if (str_contains($ua, 'Firefox')) {
            return 'Firefox';
        }

        if (str_contains($ua, 'Chrome')) {
            return 'Chrome';
        }

        if (str_contains($ua, 'Safari')) {
            return 'Safari';
        }

        if (str_contains($ua, 'Edge')) {
            return 'Edge';
        }

        return 'Unknown';
    }
}
?>