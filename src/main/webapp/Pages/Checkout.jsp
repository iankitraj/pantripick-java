<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Checkout</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
        />
        <style>
            body {
                background-color: #f8f9fa;
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100vh;
            }
            .checkout-container {
                max-width: 650px;
                background: #fff;
                padding: 30px;
                border-radius: 12px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                animation: fadeIn 0.8s ease-in-out;
            }
            @keyframes fadeIn {
                from {
                    opacity: 0;
                    transform: translateY(-10px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }
            .checkout-title {
                display: flex;
                align-items: center;
                font-size: 22px;
                font-weight: bold;
            }
            .checkout-title::after {
                content: '';
                flex-grow: 1;
                height: 2px;
                background-color: black;
                margin-left: 10px;
            }
            .form-control {
                border: 1px solid #ffcc00;
                border-radius: 6px;
            }
            .form-control:focus {
                border-color: #ff9900;
                box-shadow: 0 0 5px rgba(255, 153, 0, 0.5);
            }
            .place-order-btn {
                background-color: #28a745;
                color: white;
                border: 1px solid #28a745;
                border-radius: 6px;
                padding: 8px 15px;
                font-weight: bold;
            }
            .place-order-btn:hover {
                background-color: #218838;
            }
            .back-to-cart {
                text-decoration: none;
                color: #155724;
                font-weight: bold;
                font-size: 14px;
            }
        </style>
    </head>
    <body>
        <div class="checkout-container">
            <a href="Cart.jsp" class="back-to-cart">← Go Back to Cart</a>

            <div class="checkout-title mt-2">
                CHECK <span style="font-weight: bold">OUT</span>
            </div>

            <p class="fw-bold mt-3">Total Amount to be paid: ₹323</p>

            <form>
                <div class="row g-3">
                    <div class="col-md-6">
                        <input
                            type="text"
                            class="form-control"
                            placeholder="First Name"
                            required
                        />
                    </div>
                    <div class="col-md-6">
                        <input
                            type="text"
                            class="form-control"
                            placeholder="Last Name"
                            required
                        />
                    </div>
                    <div class="col-md-6">
                        <input
                            type="text"
                            class="form-control"
                            placeholder="Phone number"
                            required
                        />
                    </div>
                    <div class="col-md-6">
                        <input
                            type="email"
                            class="form-control"
                            placeholder="Email address"
                            required
                        />
                    </div>
                    <div class="col-12">
                        <input
                            type="text"
                            class="form-control"
                            placeholder="Address Line 1"
                            required
                        />
                    </div>
                    <div class="col-12">
                        <input
                            type="text"
                            class="form-control"
                            placeholder="Address Line 2"
                        />
                    </div>
                    <div class="col-md-6">
                        <input
                            type="text"
                            class="form-control"
                            placeholder="City"
                            required
                        />
                    </div>
                    <div class="col-md-6">
                        <input
                            type="text"
                            class="form-control"
                            placeholder="State"
                            required
                        />
                    </div>
                    <div class="col-12">
                        <input
                            type="text"
                            class="form-control"
                            placeholder="PIN Code"
                            required
                        />
                    </div>
                    <div class="col-12 text-end">
                        <button type="submit" class="place-order-btn" onclick="window.location.href='Confirm.jsp'">
                            Place Order
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
