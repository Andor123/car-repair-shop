<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

class EmailService {
    public static function sendPasswordReset(
        string $email,
        string $token
    ): bool {
        $mail = new PHPMailer(true);
        try {
            $mail->isSMTP();

            $mail->Host = $_ENV['SMTP_HOST'];
            $mail->SMTPAuth = true;
            $mail->Username = $_ENV['SMTP_USERNAME'];
            $mail->Password = $_ENV['SMTP_PASSWORD'];
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
            $mail->Port = $_ENV['SMTP_PORT'];

            $mail->setFrom(
                $_ENV['MAIL_FROM'],
                'Car Repair Shop'
            );

            $mail->addAddress($email);

            $resetLink = $_ENV['APP_URL']
                . '/public/admin/reset-password.php?token='
                . urlencode($token);

            $mail->isHTML(true);
            $mail->Subject = 'Password Reset Request';
            $mail->Body = "
                <h2>Password Reset</h2>
                <p>You requested a password reset.</p>
                <p>
                    <a href='{$resetLink}'>
                        Reset Password
                    </a>
                </p>
                <p>
                    This link expires in 1 hour.
                </p>
            ";
            return $mail->send();
        } catch (Exception $e) {
            error_log(
                $mail->ErrorInfo
            );
            return false;
        }
    }
}