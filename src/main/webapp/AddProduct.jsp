<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Add Products</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex flex-col">

<% request.setAttribute("pageName", "Add Product"); %>
<jsp:include page="AdminNavbar.jsp" />

<% String success = request.getParameter("success");
   if ("true".equals(success)) {
%>
<div class="fixed top-4 right-4 z-50">
    <div class="bg-green-600 text-white px-4 py-2 rounded shadow-md flex items-center justify-between space-x-4">
        <span>✅ Product added successfully!</span>
        <button onclick="this.parentElement.remove()" class="text-white font-bold">✕</button>
    </div>
</div>
<script>
    if (window.history.replaceState) {
        window.history.replaceState({}, document.title, window.location.pathname);
    }
</script>
<% } %>

<div class="flex flex-col items-center justify-center px-6 py-12">
    <div class="bg-white p-8 rounded-lg shadow-md w-full max-w-xl">
         <div class="relative inline-block mb-6">
            <h2 class="text-black text-2xl sm:text-3xl font-normal inline-block">
                ADD <span class="font-bold">PRODUCTS</span>
            </h2>
            <span class="absolute left-full top-1/2 -translate-y-1/2 ml-3 w-16 border-t-2 border-black"></span>
        </div>
        <p class="text-sm text-gray-500 mb-6">Enter product details below.</p>

        <form action="<%= request.getContextPath() %>/AddProductServlet" method="post" enctype="multipart/form-data" class="space-y-4 text-black">
            <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                <input type="text" name="name" placeholder="Product Name" class="p-2 border rounded w-full focus:outline-none focus:ring-2 focus:ring-gray-300" required />
                <input type="number" name="quantity" placeholder="Quantity" class="p-2 border rounded w-full focus:outline-none focus:ring-2 focus:ring-gray-300" required />
            </div>

            <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                <input type="number" name="price" placeholder="Price" class="p-2 border rounded w-full focus:outline-none focus:ring-2 focus:ring-gray-300" required />
                <select name="category" class="p-2 border rounded w-full focus:outline-none focus:ring-2 focus:ring-gray-300" required>
                    <option value="">Select Category</option>
                    <option value="Dairy and Bread">Dairy and Bread</option>
                    <option value="Fruits and Vegetables">Fruits and Vegetables</option>
                    <option value="Cold Drinks and Juice">Cold Drinks and Juice</option>
                    <option value="Snacks and Munchies">Snacks and Munchies</option>
                    <option value="Bakery and Biscuits">Bakery and Biscuits</option>
                    <option value="Sauces and Spreads">Sauces and Spreads</option>
                    <option value="Pharma and Wellness">Pharma and Wellness</option>
                    <option value="Personal Care">Personal Care</option>
                    <option value="Cleaning Essentials">Cleaning Essentials</option>
                    <option value="Home and Offices">Home and Offices</option>
                </select>
            </div>

            <textarea name="description" placeholder="Product Description" rows="3" class="p-2 w-full border rounded focus:outline-none focus:ring-2 focus:ring-gray-300" required></textarea>

            <label class="flex flex-col items-center justify-center border-2 border-gray-400 py-6 rounded cursor-pointer hover:border-blue-500 transition">
                <span class="text-gray-700">📸 Upload Image</span>
                <input type="file" name="image" accept="image/*" class="hidden" />
            </label>

            <button type="submit" class="w-full bg-gray-700 text-white py-2 rounded-md hover:bg-blue-800 transition">
                Add Product
            </button>
        </form>
    </div>
</div>

</body>
</html>
