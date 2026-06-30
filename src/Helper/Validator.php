<?php
class Validator {
    private static array $errors = [];

    public static function validate(array $data, array $rules): void {
        self::$errors = [];
        foreach ($rules as $field => $ruleString) {
            $rules = explode('|', $ruleString);
            $value = $data[$field] ?? null;
            foreach ($rules as $rule) {
                if ($rule === 'required') {
                    if (!isset($value) || $value === '') {
                        self::addError($field, "$field is required");
                    }
                }

                if ($rule === 'email') {
                    if (!filter_var($value, FILTER_VALIDATE_EMAIL)) {
                        self::addError($field, "$field must be a valid email");
                    }
                }

                if (str_starts_with($rule, 'min:')) {
                    $min = (int) explode(':', $rule)[1];
                    if (strlen($value) < $min) {
                        self::addError($field, "$field must be at least $min characters");
                    }
                }

                if (str_starts_with($rule, 'max:')) {
                    $max = (int) explode(':', $rule)[1];
                    if (strlen($value) > $max) {
                        self::addError($field, "$field must be max $max characters");
                    }
                }
            }
        }
        if (!empty(self::$errors)) {
            Response::json(
                422,
                "Validation failed",
                null,
                self::$errors
            );
        }
    }

    private static function addError(string $field, string $message): void {
        self::$errors[$field][] = $message;
    }
}
?>