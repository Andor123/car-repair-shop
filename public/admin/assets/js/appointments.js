fetch(
    `${API_BASE}/appointments`,
    {
        headers: getAuthHeaders()
    }
)
.then(response => response.json())
.then(result => {
    console.log(result);
    const table = document.getElementById("appointmentTable");

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

    function getStatusBadge(status) {
        switch(status) {
            case "scheduled":
                return '<span class="badge bg-warning">Scheduled</span>';

            case "in_progress":
                return '<span class="badge bg-primary">In Progress</span>';

            case "completed":
                return '<span class="badge bg-success">Completed</span>';

            case "cancelled":
                return '<span class="badge bg-danger">Cancelled</span>';
                
            default:
                return status;
        }
    }
    
    result.data.forEach(appointment => {
        table.innerHTML += `
            <tr>
                <td>${appointment.appointment_id}</td>
                <td>${appointment.vehicle_id}</td>
                <td>${appointment.appointment_date}</td>
                <td>${getStatusBadge(appointment.status)}</td>
            </tr>
        `;
    });
});