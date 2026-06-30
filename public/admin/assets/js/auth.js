document.getElementById("loginForm").addEventListener("submit", async (e) => {
    e.preventDefault();
    const response = await fetch(
        "/car-repair-shop/public/api/auth/login",
        {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                email: document.getElementById("email").value,
                password: document.getElementById("password").value
            })
        }
    );
    const data = await response.json();
    if (data.status === 200) {
        localStorage.setItem(
            "token",
            data.data
        );
        window.location.href = "dashboard.php";
    } else {
        alert(data.message);
    }
});