<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Order Confirmation - PantriPick</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            overflow: hidden;
        }
        .confirmation-container {
            max-width: 500px;
            background: #fff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            animation: fadeIn 0.8s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }
        .success-icon {
            width: 80px;
            height: 80px;
            background-color: #008040;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            animation: bounce 1.5s infinite;
        }
        .success-icon img {
            width: 50px;
        }
        .continue-btn {
            background-color: #008040;
            color: white;
            border: none;
            border-radius: 6px;
            padding: 10px 20px;
            font-weight: bold;
            transition: transform 0.3s;
        }
        .continue-btn:hover {
            transform: scale(1.1);
        }
        .countdown {
            font-size: 14px;
            margin-top: 15px;
            color: #555;
        }
        .confetti {
            position: fixed;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            pointer-events: none;
        }
    </style>
</head>
<body>
<canvas class="confetti"></canvas>
<div class="confirmation-container">
    <div class="success-icon">
        <img src="<%= request.getContextPath() %>/Image/confirm.png" alt="Success">
    </div>
    <h3 class="fw-bold">Thank You for Ordering!</h3>
    <p>Your order has been successfully placed.</p>
    <button class="continue-btn" onclick="window.location.href='Product.jsp'">Continue Shopping</button>
    <p class="countdown">Redirecting in <span id="timer">5</span> seconds...</p>
</div>

<script>
    // Countdown timer
    let countdown = 5;
    const timerElement = document.getElementById('timer');
    const interval = setInterval(() => {
        countdown--;
        timerElement.textContent = countdown;
        if (countdown === 0) {
            clearInterval(interval);
            window.location.href = 'Product.jsp';
        }
    }, 1000);

    // Confetti effect
    const canvas = document.querySelector('.confetti');
    const ctx = canvas.getContext('2d');
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;

    const confetti = [];
    for (let i = 0; i < 100; i++) {
        confetti.push({
            x: Math.random() * canvas.width,
            y: Math.random() * canvas.height - canvas.height,
            color: `hsl(${Math.random() * 360}, 100%, 50%)`,
            size: Math.random() * 5 + 2,
            speed: Math.random() * 3 + 2
        });
    }

    function animateConfetti() {
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        confetti.forEach(p => {
            ctx.fillStyle = p.color;
            ctx.fillRect(p.x, p.y, p.size, p.size);
            p.y += p.speed;
            if (p.y > canvas.height) {
                p.y = 0;
            }
        });
        requestAnimationFrame(animateConfetti);
    }

    animateConfetti();
</script>
</body>
</html>
