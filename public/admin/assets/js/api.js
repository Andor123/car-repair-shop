const API_BASE = "/car-repair-shop/public/api";
function getAuthHeaders() {
    return {
        Authorization: `Bearer ${localStorage.getItem("token")}`
    };
}