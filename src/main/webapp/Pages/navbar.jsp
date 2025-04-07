<%@ page import="jakarta.servlet.http.HttpSession"%>
<%
HttpSession userSession = request.getSession(false);
String userEmail = (userSession != null) ? (String) userSession.getAttribute("user") : null;
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Navbar</title>

<!-- Font Awesome CDN -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />

<script>
	function handleSearch(event) {
		if (event.key === 'Enter') {
			var query = event.target.value.trim()
			if (query) {
				window.location.href = 'search.jsp?q='
						+ encodeURIComponent(query)
			}
		}
	}
</script>

<style>
.navbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 15px 20px;
}

.navbar-logo img {
	width: 140px;
}

.navbar-menu {
	display: flex;
	gap: 20px;
	list-style: none;
}

.navbar-menu a {
	text-decoration: none;
	color: #333;
	font-size: 14px;
	font-weight: 500;
	transition: color 0.3s;
}

.navbar-menu a:hover {
	color: #ff6600;
}

.navbar-icons {
	display: flex;
	align-items: center;
	gap: 20px;
}

.search-bar {
	position: relative;
}

.search-bar input {
	padding: 8px 30px 8px 10px;
	border: 1px solid #ccc;
	border-radius: 20px;
	font-size: 12px;
	width: 200px;
}

.search-bar i {
	position: absolute;
	right: 10px;
	top: 50%;
	transform: translateY(-50%);
	color: #888;
	cursor: pointer;
}

.dropdown-menu {
	display: none;
	position: absolute;
	right: 0;
	background: #f8f9fa;
	border-radius: 5px;
	padding: 10px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.dropdown:hover .dropdown-menu {
	display: block;
}
</style>
</head>
<body>
	<nav class="navbar">
		<div class="navbar-logo">
			<img src="<%= request.getContextPath() %>/Image/PantriPickLogo.jpg" alt="PantriPick Logo" />
		</div>

		<ul class="navbar-menu">
			<li><a href="Home.jsp">HOME</a></li>
			<li><a href="Product.jsp">PRODUCTS</a></li>
			<li><a href="About.jsp">ABOUT</a></li>
			<li><a href="Contact.jsp">CONTACT</a></li>
		</ul>

		<div class="navbar-icons">
			<div class="search-bar">
				<input type="text" placeholder="Search products here"
					onkeydown="handleSearch(event)" /> <i
					class="fas fa-search"></i>
			</div>
			<div class="dropdown">
				<i class="fas fa-user fa-lg dropdown-toggle" id="profileDropdown"
					data-bs-toggle="dropdown"></i>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="profileDropdown">
					<%
					if (userEmail != null) {
					%>
					<li><a class="dropdown-item" href="Profile.jsp">My
							Profile</a></li>
					<li><a class="dropdown-item text-danger"
						href="<%=request.getContextPath()%>/UserLogoutServlet">Logout</a>
					</li>
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
			<%
			if (userEmail != null) {
			%>
			<a href="Cart.jsp" class="text-dark"><i
				class="fas fa-shopping-cart fa-lg"></i></a>
			<%
			}
			%>
		</div>
	</nav>
</body>
</html>