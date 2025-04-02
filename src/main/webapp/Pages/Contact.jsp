<%@ include file="navbar.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
    <style>
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes bounceIn {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.1); }
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateX(-30px); }
            to { opacity: 1; transform: translateX(0); }
        }

        .fade-in {
            animation: fadeIn 1.5s ease-in-out;
        }

        .bounce-in {
            animation: bounceIn 1.2s ease-in-out;
        }

        .slide-in {
            opacity: 0;
            animation: slideIn 1.5s ease-in-out forwards;
        }

        .hover-scale:hover {
            transform: scale(1.1);
            transition: transform 0.4s ease-in-out;
        }
    </style>
</head>
<body>

 <div class='px-4 sm:px-[5vw] md:px-[7vw] lg:px-[9vw]'>
<div class="px-6 sm:px-16 lg:px-24 py-16 fade-in">
    <!-- Heading -->
    <div class="relative inline-block mb-7 py-3 mt-10">
        <h2 class="text-black text-2xl sm:text-3xl font-normal inline-block bounce-in">
            CONTACT <span class="font-bold">US</span>
        </h2>
        <span class="absolute left-full top-1/2 transform -translate-y-1/2 ml-3 w-16 border-t-2 border-black"></span>
    </div>

    <!-- Content Section -->
    <div class="grid grid-cols-1 sm:grid-cols-2 items-stretch gap-10">
        <!-- Image Section -->
        <div class="flex justify-center">
            <img class="w-full max-w-sm sm:max-w-md lg:max-w-lg object-cover rounded-lg shadow-lg hover-scale h-full" src="<%= request.getContextPath() %>/Image/img2.jpeg" alt="Our Store">
        </div>
        
        <!-- Contact Details -->
        <div class="bg-gray-100 p-6 rounded-lg shadow-md w-full slide-in flex flex-col justify-center h-full">
            <h3 class="text-xl sm:text-2xl font-semibold text-gray-800 mb-4">Our Stores</h3>
            
            <div class="space-y-6">
                <!-- Ahmedabad Store -->
                <div>
                    <p class="text-sm sm:text-base font-medium">C.G. Road</p>
                    <p class="text-sm sm:text-base text-gray-600">Ahmedabad, Gujarat 380009</p>
                    <p class="text-sm sm:text-base"><span class="font-semibold">Tel:</span> +91 98765 43210</p>
                    <p class="text-sm sm:text-base"><span class="font-semibold">Email:</span> ahmedabad@pantripick.com</p>
                </div>

                <hr class="border-gray-300">
                
                <!-- Vadodara Store -->
                <div>
                    <p class="text-sm sm:text-base font-medium">Alkapuri</p>
                    <p class="text-sm sm:text-base text-gray-600">Vadodara, Gujarat 390007</p>
                    <p class="text-sm sm:text-base"><span class="font-semibold">Tel:</span> +91 99876 54321</p>
                    <p class="text-sm sm:text-base"><span class="font-semibold">Email:</span> vadodara@pantripick.com</p>
                </div>

                <hr class="border-gray-300">
                
                <!-- Surat Store -->
                <div>
                    <p class="text-sm sm:text-base font-medium">Ghod Dod Road</p>
                    <p class="text-sm sm:text-base text-gray-600">Surat, Gujarat 395007</p>
                    <p class="text-sm sm:text-base"><span class="font-semibold">Tel:</span> +91 91234 56789</p>
                    <p class="text-sm sm:text-base"><span class="font-semibold">Email:</span> surat@pantripick.com</p>
                </div>
            </div>
        </div>
    </div>
    </div></div>
</body>
</html>
<%@ include file="footer.jsp" %>