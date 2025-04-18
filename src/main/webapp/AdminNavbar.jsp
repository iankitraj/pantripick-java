<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Navigation</title>
    <link rel="stylesheet" href="Admin.css">
</head>
<body>
    <header>
        <div class="logo">
            <strong>PantriPick - Admin</strong>
        </div>
        <nav>
            <a href="ItemList.jsp">Items</a>
            <a href="UserList.jsp">Users</a>
            <a href="AddProduct.jsp">Add Product</a>
            <a href="Order.jsp">Orders</a>
        </nav>
        <button class="btn-logout" onclick="location.href='LogoutServlet'">Logout</button>
    </header>
</body>
</html>
