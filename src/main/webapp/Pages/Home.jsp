<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .fade-in {
            animation: fadeInUp 0.8s ease-in-out;
        }

        .hover-scale:hover {
            transform: scale(1.05);
            transition: transform 0.3s ease-in-out;
        }
    </style>
</head>
<body class="bg-gray-100">
    <%@ include file="navbar.jsp" %>
    <div class='px-4 sm:px-[5vw] md:px-[7vw] lg:px-[9vw] fade-in'>
    
    <div class="px-6 sm:px-16 lg:px-24 py-20 sm:py-24 flex flex-col sm:flex-row items-center justify-between">
        <div class="w-full sm:w-1/2 text-center sm:text-left">
            <h1 class="text-green-600 text-4xl sm:text-6xl font-bold leading-tight fade-in">Fresh Groceries</h1>
            <h2 class="text-black text-xl sm:text-3xl font-medium mt-2 fade-in">Delivered straight to your door</h2>
            <div class="mt-6 flex gap-4 justify-center sm:justify-start fade-in">
                <a href="<%= session.getAttribute("user") != null ? "Product.jsp" : "Signup.jsp" %>" class="bg-green-600 text-white px-6 py-2 rounded-md transition hover:bg-green-700">Get Started →</a>
                <a href="<%= session.getAttribute("user") != null ? "Product.jsp" : "Signup.jsp" %>" class="border border-green-600 text-green-600 px-6 py-2 rounded-md transition hover:bg-green-100">Shop Now</a>
            </div>
        </div>
        <div class="w-full sm:w-1/2 flex justify-center sm:justify-end mt-8 sm:mt-0">
            <img class="max-w-xs sm:max-w-md lg:max-w-lg object-cover rounded-xl shadow-md fade-in" src="<%= request.getContextPath()%>/Image/Grocery Bag.jpg" alt="Fresh groceries delivered" >
        </div>
    </div>

    <div class="px-6 sm:px-16 lg:px-24 py-8 fade-in">
        <div class="relative inline-block mb-6">
            <h2 class="text-black text-2xl sm:text-3xl font-normal inline-block">PRODUCTS <span class="font-bold">CATEGORIES</span></h2>
            <span class="absolute left-full top-1/2 -translate-y-1/2 ml-3 w-16 border-t-2 border-black"></span>
        </div>
        <div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 gap-8 py-4">
            <% String[][] categories = {
                {"Dairy & Bread.jpg", "Dairy and Bread"},
                {"Fruits & Vegetables.jpg", "Fruits and Vegetables"},
                {"Cold Drinks and Juice.jpg", "Cold Drinks and Juice"},
                {"Snacks & Munchies.jpg", "Snacks and Munchies"},
                {"Biscuits.jpg", "Bakery and Biscuits"},
                {"Spices and Herbs.jpg", "Spices and Herbs"},
                {"Personal Care.jpg", "Personal Care"},
                {"Cleaning Essentials.jpeg", "Cleaning Essentials"},
                {"Personal Care.jpg", "Personal Care"},
                {"Cleaning Essentials.jpeg", "Cleaning Essentials"}
            };
            for (String[] category : categories) { %>
                <a href="<%= session.getAttribute("user") != null ? "Product.jsp" : "Signup.jsp" %>" class="flex flex-col items-center cursor-pointer hover-scale fade-in">
                    <div class="w-28 h-28 sm:w-32 sm:h-32 bg-blue-50 rounded-xl flex items-center justify-center shadow">
                        <img src="<%= request.getContextPath() %>/Image/<%= category[0] %>" alt="<%= category[1] %>">
                    </div>
                    <p class="text-black text-xs sm:text-sm mt-2 font-normal text-center"><%= category[1] %></p>
                </a>
            <% } %>
        </div>
    </div>

    <div class='flex flex-col sm:flex-row items-center justify-between px-6 sm:px-16 lg:px-24 py-15 mb-14 mt-12 fade-in'>
        <div class='w-full sm:w-1/2 text-center sm:text-left'>
            <div class='relative inline-block'>
                <h2 class='text-black text-2xl sm:text-3xl font-normal inline-block'>ABOUT <span class='font-bold'>US</span></h2>
                <span class='absolute left-full top-1/2 -translate-y-1/2 ml-3 w-16 border-t-2 border-black'></span>
            </div>
            <p class='text-black mt-4 leading-relaxed'>
                Your trusted neighborhood grocery shop, dedicated to providing high-quality products that meet every shopper's needs.
            </p>
            <p class='text-black mt-2'>
                From fresh produce to daily essentials, we offer a wide selection of items.
            </p>
            <div class="mt-6">
                <a href="About.jsp" class="border border-green-600 text-green-600 px-6 py-2 rounded-md transition hover:bg-green-600 hover:text-white shadow-sm">Know More →</a>
            </div>
        </div>
        <div class="w-full sm:w-1/2 flex justify-center sm:justify-end mt-8 sm:mt-0">
            <img class="w-56 sm:w-72 lg:w-88 rounded-lg object-cover shadow-md fade-in" src="<%= request.getContextPath() %>/Image/Grocery Store.jpeg" alt="Grocery Store">
        </div>
    </div>
    </div>
    
    <%@ include file="footer.jsp" %>
</body>
</html>
