<?php
use Detection\MobileDetect;

class DeviceDetectionService {
    public static function detect(): array {
        $detect = new MobileDetect();

        if ($detect->isTablet()) {
            $deviceType = 'tablet';
        } elseif ($detect->isMobile()) {
            $deviceType = 'mobile';
        } else {
            $deviceType = 'desktop';
        }
        
        $userAgent = $_SERVER['HTTP_USER_AGENT'] ?? '';
        return [
            'device_type' => $deviceType,
            'user_agent' => $userAgent
        ];
    }
}
?>