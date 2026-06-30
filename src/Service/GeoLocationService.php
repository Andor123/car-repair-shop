<?php
class GeoLocationService {
    public static function lookup(
        string $ip
    ): ?array {
        $response = file_get_contents("http://ip-api.com/json/$ip");

        if (!$response) {
            return null;
        }

        $data = json_decode($response, true);
        
        if (
            !isset($data['status']) ||
            $data['status'] !== 'success') {
                return null;
        }

        return [
            'country' => $data['country'] ?? '',
            'city' => $data['city'] ?? '',
            'isp' => $data['isp'] ?? ''
        ];
    }
}
?>