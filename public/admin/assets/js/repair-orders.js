fetch(
    `${API_BASE}/repair-orders`,
    {
        headers: getAuthHeaders()
    }
)
.then(response => response.json())
.then(result => {
    console.log(result);
    const table = document.getElementById("repairOrderTable");

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
            case "reported":
                return '<span class="badge bg-warning">Reported</span>';

            case "in progress":
                return '<span class="badge bg-primary">In Progress</span>';

            case "completed":
                return '<span class="badge bg-success">Completed</span>';
                
            default:
                return status;
        }
    }
    
    result.data.forEach(order => {
        table.innerHTML += `
            <tr>
                <td>${order.repair_order_id}</td>
                <td>${order.appointment_id}</td>
                <td>${order.employee_id}</td>
                <td>${getStatusBadge(order.status)}</td>
            </tr>
        `;
    });
});