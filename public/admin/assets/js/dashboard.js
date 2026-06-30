const headers = getAuthHeaders();

async function loadDashboard() {
    const vehiclesResponse =
        await fetch(
            "/car-repair-shop/public/api/vehicles",
            { headers }
        );
    const appointmentsResponse =
        await fetch(
            "/car-repair-shop/public/api/appointments",
            { headers }
        );
    const repairOrdersResponse =
        await fetch(
            "/car-repair-shop/public/api/repair-orders",
            { headers }
        );
    const invoicesResponse =
        await fetch(
            "/car-repair-shop/public/api/invoices",
            { headers }
        );

    const vehicles = await vehiclesResponse.json();
    const appointments = await appointmentsResponse.json();
    const repairOrders = await repairOrdersResponse.json();
    const invoices = await invoicesResponse.json();

    document.getElementById(
        "vehicleCount"
    ).innerText =
        vehicles.data?.length || 0;

    document.getElementById(
        "appointmentCount"
    ).innerText =
        appointments.data?.length || 0;

    document.getElementById(
        "repairOrderCount"
    ).innerText =
        repairOrders.data?.length || 0;

    document.getElementById(
        "invoiceCount"
    ).innerText =
        invoices.data?.length || 0;
}
loadDashboard();