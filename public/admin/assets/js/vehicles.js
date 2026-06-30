fetch(
    `${API_BASE}/vehicles`,
    {
        headers: getAuthHeaders()
    }
)
.then(response => response.json())
.then(result => {
    console.log(result);
    const table = document.getElementById("vehicleTable");

    if (!result.data) {
        console.error(result);
        return;
    }

    if(result.data.length === 0) {
        table.innerHTML = `
            <tr>
                <td colspan="4">
                    No records found.
                </td>
            </tr>
        `;
        return;
    }
    
    result.data.forEach(vehicle => {
        table.innerHTML += `
            <tr>
                <td>${vehicle.vehicle_id}</td>
                <td>${vehicle.license_plate}</td>
                <td>${vehicle.brand}</td>
                <td>${vehicle.model}</td>
            </tr>
        `;
    });
});