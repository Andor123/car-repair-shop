fetch(
    `${API_BASE}/invoices`,
    {
        headers: getAuthHeaders()
    }
)
.then(response => response.json())
.then(result => {
    console.log(result);
    const table = document.getElementById("invoiceTable");

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
            case "pending":
                return '<span class="badge bg-warning">Pending</span>';
                
            case "paid":
                return '<span class="badge bg-success">Paid</span>';

            case "cancelled":
                return '<span class="badge bg-danger">Cancelled</span>';

            default:
                return status;
        }
    }
    
    result.data.forEach(invoice => {
        table.innerHTML += `
            <tr>
                <td>${invoice.invoice_id}</td>
                <td>${invoice.repair_order_id}</td>
                <td>${invoice.total_amount}</td>
                <td>${getStatusBadge(invoice.status)}</td>
            </tr>
        `;
    });
});