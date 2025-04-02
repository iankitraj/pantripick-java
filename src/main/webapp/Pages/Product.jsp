<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Products</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .fade-in {
            opacity: 0;
            transform: translateY(20px);
            animation: fadeIn 0.8s ease-out forwards;
        }
        @keyframes fadeIn {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>

<body class="bg-gray-100">
    <%@ include file="navbar.jsp" %>
    <div class="px-4 sm:px-[5vw] md:px-[7vw] lg:px-[9vw]">
        <div class="px-6 sm:px-16 lg:px-24 py-16 fade-in">
            <!-- Heading -->
            <div class="relative inline-block py-3">
                <h2 class="text-black text-2xl sm:text-3xl font-normal inline-block fade-in">
                    PRODUCTS <span class="font-bold">AVAILABLE</span>
                </h2>
                <span class="absolute left-full top-1/2 -translate-y-1/2 ml-3 w-16 border-t-2 border-black"></span>
            </div>

            <!-- Sections with Fade-in Animation -->
            <h5 class="text-xl font-bold mt-8 fade-in">Dairy, Bread & Eggs</h5>
            <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-6 mt-4 fade-in">
                <div class="bg-white p-4 rounded-lg shadow-md text-center transform transition hover:scale-105">
                    <img src="<%= request.getContextPath() %>/Image/bread.webp" alt="Britannia Brown Bread" class="w-36 h-36 object-contain mx-auto bg-gray-200 rounded-lg" />
                    <p class="mt-2">Britannia Brown Bread</p>
                    <p class="font-semibold">₹30</p>
                </div>
                <div class="bg-white p-4 rounded-lg shadow-md text-center transform transition hover:scale-105">
                    <img src="<%= request.getContextPath() %>/Image/dahi.webp" alt="Amul Masti Dahi" class="w-36 h-36 object-contain mx-auto bg-gray-200 rounded-lg" />
                    <p class="mt-2">Amul Masti Dahi</p>
                    <p class="font-semibold">₹70</p>
                </div>
                <a href="Details.jsp" class="bg-white p-4 rounded-lg shadow-md text-center transform transition hover:scale-105">
                    <img src="<%= request.getContextPath() %>/Image/keloggs.jpg" alt="Honey Corn Flakes" class="w-36 h-36 object-contain mx-auto bg-gray-200 rounded-lg" />
                    <p class="mt-2">Honey Corn Flakes</p>
                    <p class="font-semibold">₹278</p>
                </a>
                <div class="bg-white p-4 rounded-lg shadow-md text-center transform transition hover:scale-105">
                    <img src="<%= request.getContextPath() %>/Image/eggs.webp" alt="Eggs Tray" class="w-36 h-36 object-contain mx-auto bg-gray-200 rounded-lg" />
                    <p class="mt-2">Eggs Tray</p>
                    <p class="font-semibold">₹100</p>
                </div>
            </div>

            <h5 class="text-xl font-bold mt-8 fade-in">Fruits & Vegetables</h5>
            <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-6 mt-4 fade-in">
                <div class="bg-white p-4 rounded-lg shadow-md text-center transform transition hover:scale-105">
                    <img src="<%= request.getContextPath() %>/Image/fruits1.jpg" alt="Fresh Fruits" class="w-36 h-36 object-contain mx-auto bg-gray-200 rounded-lg" />
                    <p class="mt-2">Fresh Fruits</p>
                    <p class="font-semibold">₹60</p>
                </div>
                <div class="bg-white p-4 rounded-lg shadow-md text-center transform transition hover:scale-105">
                    <img src="<%= request.getContextPath() %>/Image/fruits2.jpg" alt="Seasonal Vegetables" class="w-36 h-36 object-contain mx-auto bg-gray-200 rounded-lg" />
                    <p class="mt-2">Seasonal Vegetables</p>
                    <p class="font-semibold">₹60</p>
                </div>
                <div class="bg-white p-4 rounded-lg shadow-md text-center transform transition hover:scale-105">
                    <img src="<%= request.getContextPath() %>/Image/fruits3.jpg" alt="Green Leafy" class="w-36 h-36 object-contain mx-auto bg-gray-200 rounded-lg" />
                    <p class="mt-2">Green Leafy</p>
                    <p class="font-semibold">₹60</p>
                </div>
                <div class="bg-white p-4 rounded-lg shadow-md text-center transform transition hover:scale-105">
                    <img src="<%= request.getContextPath() %>/Image/fruits4.jpg" alt="Exotic Fruits" class="w-36 h-36 object-contain mx-auto bg-gray-200 rounded-lg" />
                    <p class="mt-2">Exotic Fruits</p>
                    <p class="font-semibold">₹60</p>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>