<?php
require_once __DIR__ . '/../vendor/autoload.php';
require_once __DIR__ . '/../config/database.php';

$faker = Faker\Factory::create();

$pdo = Database::connect();

$stmt = $pdo->query("
    SELECT user_id
    FROM users
    WHERE user_id NOT IN (
        SELECT user_id
        FROM customers
    )
");
$availableUsers = $stmt->fetchAll(
    PDO::FETCH_COLUMN
);

foreach ($availableUsers as $userId) {
    $stmt = $pdo->prepare("
        INSERT INTO customers
        (
            user_id,
            first_name,
            last_name,
            phone,
            address
        )
        VALUES (?, ?, ?, ?, ?)
    ");
    $stmt->execute([
        $userId,
        $faker->firstName(),
        $faker->lastName(),
        $faker->phoneNumber(),
        $faker->address()
    ]);
}

$stmt = $pdo->query("
    SELECT customer_id
    FROM customers
");
$customerIds = $stmt->fetchAll(PDO::FETCH_COLUMN);

foreach ($customerIds as $customerId) {
    $stmt = $pdo->prepare("
        INSERT INTO vehicles
        (
            customer_id,
            license_plate,
            vin,
            brand,
            model,
            year,
            engine_type,
            mileage
        )
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    ");
    $stmt->execute([
        $customerId,
        strtoupper($faker->bothify('??-###-??')),
        strtoupper($faker->bothify('?????????????????')),
        $faker->randomElement([
            'Volkswagen',
            'Ford',
            'BMW',
            'Audi',
            'Toyota'
        ]),
        $faker->word(),
        $faker->numberBetween(2005, 2025),
        $faker->randomElement([
            'Petrol',
            'Diesel',
            'Hybrid',
            'Electric'
        ]),
        $faker->numberBetween(10000, 300000)
    ]);
}

$stmt = $pdo->query("
    SELECT vehicle_id
    FROM vehicles
");
$vehicleIds = $stmt->fetchAll(PDO::FETCH_COLUMN);

foreach ($vehicleIds as $vehicleId) {
    $stmt = $pdo->prepare("
        INSERT INTO appointments
        (
            vehicle_id,
            appointment_date,
            problem_description,
            status
        )
        VALUES (?, ?, ?, ?)
    ");
    $stmt->execute([
        $vehicleId,
        $faker->dateTimeBetween('-1 month', '+1 month')
              ->format('Y-m-d H:i:s'),
        $faker->sentence(),
        $faker->randomElement([
            'scheduled',
            'in_progress',
            'completed',
            'cancelled'
        ])
    ]);
}

$stmt = $pdo->query("
    SELECT user_id
    FROM users
    WHERE role_id IN (2,3,4)
");
$userIds = $stmt->fetchAll(PDO::FETCH_COLUMN);

foreach ($userIds as $userId) {
    $stmt = $pdo->prepare("
        INSERT INTO employees
        (
            user_id,
            first_name,
            last_name,
            phone,
            email
        )
        VALUES (?, ?, ?, ?, ?)
    ");
    $stmt->execute([
        $userId,
        $faker->firstName(),
        $faker->lastName(),
        $faker->phoneNumber(),
        $faker->email()
    ]);
}

$appointments = $pdo->query("
    SELECT appointment_id
    FROM appointments
")->fetchAll(PDO::FETCH_COLUMN);
$employees = $pdo->query("
    SELECT employee_id
    FROM employees
")->fetchAll(PDO::FETCH_COLUMN);

for ($i = 0; $i < 20; $i++) {
    $stmt = $pdo->prepare("
        INSERT INTO repair_orders
        (
            appointment_id,
            employee_id,
            start_date,
            status,
            total_labor_cost
        )
        VALUES (?, ?, ?, ?, ?)
    ");
    $stmt->execute([
        $appointments[array_rand($appointments)],
        $employees[array_rand($employees)],
        $faker->dateTimeThisYear()
              ->format('Y-m-d H:i:s'),
        $faker->randomElement([
            'reported',
            'in progress',
            'completed'
        ]),
        $faker->randomFloat(2, 50, 500)
    ]);
}
echo "Seed completed\n";
?>