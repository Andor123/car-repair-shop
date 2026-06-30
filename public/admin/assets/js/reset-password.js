document.getElementById("resetForm").addEventListener("submit", async function(e) {
    e.preventDefault();
    const password = document.getElementById("password").value;
    const confirm = document.getElementById("confirmPassword").value;

    if(password !== confirm) {
        alert("Passwords do not match.");
        return;
    }

    const token = document.getElementById("token").value;
    const response = await fetch (
        "/car-repair-shop/public/api/auth/reset-password",
        {
            method:"POST",
            headers:{
                "Content-Type":"application/json"
            },
            body:JSON.stringify({
                token:token,
                new_password:password
            })
        }
    );

    const result = await response.json();
    alert(result.message);
    if(result.status===200) {
        setTimeout(() => {
            window.location.href="login.php";
        },2000);
    }
});