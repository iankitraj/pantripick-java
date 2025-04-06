<%@ page
	import="java.sql.*, javax.mail.*, javax.mail.internet.*, java.util.*, javax.activation.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Users List - PantriPick</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	font-family: Arial, sans-serif;
	background: linear-gradient(-45deg, #1a1a2e, #16213e, #0f3460);
	background-size: 300% 300%;
	animation: bgAnimation 10s infinite alternate;
	color: white;
	text-align: center;
	padding: 20px;
}

@keyframes bgAnimation {
  0% {
    background-position: 0% 50%;
  }
  50% {
    background-position: 100% 50%;
  }
  100% {
    background-position: 0% 50%;
  }
}

.container {
	width: 90%;
	max-width: 800px;
	background: rgba(255, 255, 255, 0.95);
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	color: black;
}

table {
	width: 100%;
	border-collapse: collapse;
	background: white;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
}

th, td {
	padding: 12px;
	text-align: center;
	border-bottom: 1px solid #ddd;
}

th {
	background: #007bff;
	color: white;
	cursor: pointer;
}

tr:hover {
	background: #f2f2f2;
}

.btn-danger {
	padding: 5px 10px;
	font-size: 12px;
}

#searchInput {
	margin-bottom: 10px;
}
</style>
</head>
<body>

	<%@ include file="AdminNavbar.jsp"%>

	<div class="container">
		<h2>Users List</h2>
		<input type="text" id="searchInput" placeholder="Search for Users..."
			class="form-control" onkeyup="searchItems()">

		<table>
			<thead>
				<tr>
					<th>Name</th>
					<th>Email</th>
					<th>Address</th>
					<th>Total Orders</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody id="itemsTable">
				<%
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pantripick", "root", "807280");

					String sql = "SELECT u.name, u.email, o.address, COUNT(o.id) as total_orders "
					+ "FROM user u JOIN orders o ON u.Id = o.user_id "
					+ "WHERE o.status != 'Cancelled' "
					+ "GROUP BY u.Id, u.name, u.email, o.address";
					PreparedStatement ps = con.prepareStatement(sql);
					ResultSet rs = ps.executeQuery();

					while (rs.next()) {
						String name = rs.getString("name");
						String email = rs.getString("email");
						String address = rs.getString("address");
						int totalOrders = rs.getInt("total_orders");
				%>
				<tr>
					<td><%=name%></td>
					<td><%=email%></td>
					<td><%=address%></td>
					<td><%=totalOrders%></td>
					<td>
						<form id="cancelForm-<%= email %>" action="<%=request.getContextPath()%>/CancelUserOrderServlet" method="POST">
							<input type="hidden" name="email" value="<%=email%>">
							<button type="button" class="btn btn-danger" onclick="confirmCancel('<%= email %>')">Cancel</button>
						</form>
					</td>
				</tr>
				<%
					}
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				%>
			</tbody>
		</table>
	</div>

	<script>
		function searchItems() {
			let input = document.getElementById("searchInput").value.toUpperCase();
			let table = document.getElementById("itemsTable");
			let tr = table.getElementsByTagName("tr");

			for (let i = 0; i < tr.length; i++) {
				let td = tr[i].getElementsByTagName("td")[0];
				if (td) {
					let txtValue = td.textContent || td.innerText;
					tr[i].style.display = txtValue.toUpperCase().includes(input) ? "" : "none";
				}
			}
		}

		function confirmCancel(email) {
			if (confirm("Are you sure you want to cancel this user's order?")) {
				document.getElementById("cancelForm-" + email).submit();
			}
		}

		window.onload = function () {
			const successMessage = '<%= session.getAttribute("successMessage") %>';
			if (successMessage !== "null") {
				alert(successMessage);
				<% session.removeAttribute("successMessage"); %>
			}
		};
	</script>

</body>
</html>
