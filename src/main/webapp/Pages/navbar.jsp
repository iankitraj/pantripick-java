<%@ page import="jakarta.servlet.http.HttpSession"%>
<%
HttpSession userSession = request.getSession(false);
String userEmail = (userSession != null) ? (String) userSession.getAttribute("user") : null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Navbar - PantriPick</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<style>
.navbar {
	background-color: white;
	box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
}

.nav-item a {
	font-size: 18px;
	transition: color 0.3s;
}

.nav-item a:hover {
	color: #007bff;
}

.dropdown-menu {
	min-width: 150px;
}

.dropdown-menu a {
	font-size: 16px;
}

.search-bar {
	display: flex;
	align-items: center;
	border: 1px solid #ccc;
	padding: 5px;
	border-radius: 5px;
	background: white;
}

.search-bar input {
	border: none;
	outline: none;
	font-size: 16px;
	width: 150px;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg fixed-top">
		<div class="container-fluid">
			<a class="navbar-brand fw-bold" href="Home.jsp">PantriPick</a>

			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav mx-auto">
					<li class="nav-item"><a class="nav-link" href="Home.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="Product.jsp">Products</a></li>
					<li class="nav-item"><a class="nav-link" href="About.jsp">About</a></li>
					<li class="nav-item"><a class="nav-link" href="Contact.jsp">Contact</a></li>
				</ul>

				<div class="d-flex align-items-center gap-3">
					<!-- Search Bar -->
					<div class="search-bar">
						<input type="text" class="form-control search-input" placeholder="Search...">
						<i class="fas fa-search search-icon"></i>
					</div>

					<!-- Cart Icon -->
					<a href="Cart.jsp" class="text-dark"><i class="fas fa-shopping-cart fa-lg"></i></a>

					<!-- Profile Dropdown -->
					<div class="dropdown">
						<i class="fas fa-user fa-lg dropdown-toggle" id="profileDropdown" data-bs-toggle="dropdown"></i>
						<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="profileDropdown">
							<%
							if (userEmail != null) {
							%>
							<li><a class="dropdown-item" href="UserProfile.jsp">My Profile</a></li>
							<li><a class="dropdown-item text-danger" href="<%= request.getContextPath() %>/UserLogoutServlet">Logout</a></li>
							<%
							} else {
							%>
							<li><a class="dropdown-item" href="Login.jsp">Sign In</a></li>
							<li><a class="dropdown-item" href="Signup.jsp">Sign Up</a></li>
							<%
							}
							%>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</nav>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
