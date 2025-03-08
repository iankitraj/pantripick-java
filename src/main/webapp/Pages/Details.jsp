<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Product Details</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f8f9fa;
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100vh;
}

@
keyframes fadeIn {from { opacity:0;
	transform: translateY(-10px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
.product-container {
	max-width: 900px;
	background: #fff;
	padding: 30px;
	border-radius: 12px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	animation: fadeIn 0.5s ease-in-out;
}

@
keyframes fadeIn {from { opacity:0;
	transform: translateY(-10px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
.product-title {
	display: flex;
	align-items: center;
	font-weight: bold;
	font-size: 24px;
}

.product-title::after {
	content: "";
	flex-grow: 1;
	height: 2px;
	background-color: black;
	margin-left: 10px;
}

.product-card {
	display: flex;
	align-items: center;
	gap: 20px;
	background: #fff;
	padding: 20px;
}

.product-image {
	width: 250px;
	border-radius: 8px;
}

.product-footer {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 10px;
}

.add-cart-btn {
	border-radius: 7px;
	height: 35px;
	width: 120px;
}
</style>
</head>
<body>
<%@ include file="navbar.jsp" %>

	<div class="product-container">
		<div class="product-title">
			<span style="font-weight: 100;">PRODUCT&nbsp;</span><span
				style="font-weight: bold;">DETAILS</span>
		</div>

		<div class="product-card mt-3">
			<img src="<%= request.getContextPath() %>/Image/keloggs.jpg" alt="Kellogg's Corn Flakes"
				class="product-image">
			<div class="w-100">
				<h4 class="fw-bold">Kellogg's Real Almond Honey Corn Flakes</h4>
				<p>
					<strong>Quantity:</strong> 1 kg
				</p>
				<p>
					<strong>Description:</strong><br> Nourishing, Tasty & Healthy
					Breakfast Cereal - Kellogg’s Real Almond and Honey Corn Flakes is a
					great combination of taste & health. Enjoy a delicious and
					nutritious breakfast with the goodness of Kellogg's Corn Flakes
					with real Almond & Honey.
				</p>

				<div class="product-footer">
					<p class="m-0">
						<strong>₹278</strong> (Inclusive of all taxes)
					</p>
					<button class="add-cart-btn btn btn-outline-primary">Add
						to cart</button>
				</div>
			</div>
		</div>
	</div>

</body>

</html>
