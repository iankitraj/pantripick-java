<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Cart</title>
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
            .cart-container {
                max-width: 1500px;
                background: #fff;
                padding: 30px;
                border-radius: 12px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                animation: fadeIn 0.5s ease-in-out;
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
            .cart-table th,
            .cart-table td {
                vertical-align: middle;
            }
            .cart-title {
                display: flex;
                align-items: center;
                font-weight: bold;
                font-size: 24px;
            }
            .cart-title::after {
                content: '';
                flex-grow: 1;
                height: 2px;
                background-color: black;
                margin-left: 10px;
            }

            .quantity-btn {
                width: 30px;
                height: 30px;
                display: inline-flex;
                align-items: center;
                justify-content: center;
                border: 1px solid #ccc;
                background: transparent;
                cursor: pointer;
                border-radius: 5px;
            }
            .checkout-btn {
                background-color: white;
                color: #007bff;
                border: solid 1px;
                border-color: #007bff;
                border-radius: 7px;
                height: 35px;
                width: 180px;
            }
            .continue-shopping {
                text-decoration: underline;
                font-weight: bold;
                color: black;
                text-size-adjust: 8px;
            }
            .cart-footer {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-top: 20px;
            }
            .cart-title {
                display: flex;
                align-items: center;
                font-weight: bold;
                font-size: 24px;
            }
            .cart-title img {
                margin-right: 10px;
            }
        </style>
    </head>
    <body>
        <div class="cart-container">
            <div class="cart-title">
                <div class="product-title">
                    <span style="font-weight: 100">YOUR&nbsp;</span
                    ><span style="font-weight: bold">CART&nbsp;</span>
                </div>
                <img
                    src="<%= request.getContextPath() %>/Image/shopping-cart.png"
                    width="25"
                    height="25"
                    alt="Cart Icon"
                />
            </div>

            <table class="table cart-table mt-3">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total Cost</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody id="cart-body">
                    <tr data-price="27">
                        <td>
                            <img
                                src="<%= request.getContextPath() %>/Image/milk.jpeg"
                                height="60"
                                width="60"
                                class="me-2"
                            />
                            Amul Taaza Milk
                        </td>
                        <td>₹27</td>
                        <td>
                            <button
                                class="quantity-btn"
                                onclick="updateQuantity(this, -1)"
                            >
                                -
                            </button>
                            <span class="mx-2 quantity">2</span>
                            <button
                                class="quantity-btn"
                                onclick="updateQuantity(this, 1)"
                            >
                                +
                            </button>
                        </td>
                        <td class="total">₹54</td>
                        <td>
                            <button
                                class="btn btn-sm btn-danger"
                                onclick="removeItem(this)"
                            >
                                ×
                            </button>
                        </td>
                    </tr>
                    <tr data-price="246">
                        <td>
                            <img
                                src="<%= request.getContextPath() %>/Image/atta.jpg"
                                height="60"
                                width="60"
                                class="me-2"
                            />
                            Aashirvaad Atta
                        </td>
                        <td>₹246</td>
                        <td>
                            <button
                                class="quantity-btn"
                                onclick="updateQuantity(this, -1)"
                            >
                                -
                            </button>
                            <span class="mx-2 quantity">1</span>
                            <button
                                class="quantity-btn"
                                onclick="updateQuantity(this, 1)"
                            >
                                +
                            </button>
                        </td>
                        <td class="total">₹246</td>
                        <td>
                            <button
                                class="btn btn-sm btn-danger"
                                onclick="removeItem(this)"
                            >
                                ×
                            </button>
                        </td>
                    </tr>
                    <tr data-price="23">
                        <td>
                            <img
                                src="<%= request.getContextPath() %>/Image/poppins.webp"
                                height="60"
                                width="60"
                                class="me-2"
                            />
                            Parle Poppins Candy
                        </td>
                        <td>₹23</td>
                        <td>
                            <button
                                class="quantity-btn"
                                onclick="updateQuantity(this, -1)"
                            >
                                -
                            </button>
                            <span class="mx-2 quantity">1</span>
                            <button
                                class="quantity-btn"
                                onclick="updateQuantity(this, 1)"
                            >
                                +
                            </button>
                        </td>
                        <td class="total">₹23</td>
                        <td>
                            <button
                                class="btn btn-sm btn-danger"
                                onclick="removeItem(this)"
                            >
                                ×
                            </button>
                        </td>
                    </tr>
                </tbody>
            </table>

            <p class="fw-bold">
                Subtotal: <span id="subtotal" class="float-end">₹323</span>
            </p>
            <p class="fw-bold">Shipping: <span class="float-end">Free</span></p>
            <h5 class="fw-bold">
                Total: <span id="total-price" class="float-end">₹323</span>
            </h5>

            <!-- Cart Footer with Buttons -->
            <div class="cart-footer">
                <a href="Product.jsp" class="continue-shopping">← Continue Shopping</a>
                <button class="checkout-btn" onclick="window.location.href='Checkout.jsp'">Proceed to Checkout</button>
            </div>
        </div>

        <script>
            function updateQuantity(button, change) {
                let row = button.closest('tr')
                let quantityElem = row.querySelector('.quantity')
                let pricePerUnit = parseFloat(row.getAttribute('data-price'))
                let totalElem = row.querySelector('.total')

                let quantity = parseInt(quantityElem.innerText)
                quantity = Math.max(1, quantity + change) // Ensure quantity stays above 1
                quantityElem.innerText = quantity
                totalElem.innerText = '₹' + (quantity * pricePerUnit).toFixed(2)

                updateTotal()
            }

            function removeItem(button) {
                let row = button.closest('tr')
                row.remove()
                updateTotal()
            }

            function updateTotal() {
                let total = 0
                document.querySelectorAll('#cart-body tr').forEach((row) => {
                    let itemTotal = parseFloat(
                        row.querySelector('.total').innerText.replace('₹', '')
                    )
                    total += itemTotal
                })
                document.getElementById('subtotal').innerText =
                    '₹' + total.toFixed(2)
                document.getElementById('total-price').innerText =
                    '₹' + total.toFixed(2)
            }
        </script>
    </body>
</html>
