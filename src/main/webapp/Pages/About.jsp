<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>About Us</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
      @keyframes fadeIn {
        from {
          opacity: 0;
          transform: translateY(20px);
        }
        to {
          opacity: 1;
          transform: translateY(0);
        }
      }

      @keyframes bounceIn {
        0%,
        100% {
          transform: scale(1);
        }
        50% {
          transform: scale(1.1);
        }
      }

      @keyframes slideIn {
        from {
          opacity: 0;
          transform: translateX(-30px);
        }
        to {
          opacity: 1;
          transform: translateX(0);
        }
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
  <body class="bg-gray-100">
  <%@ include file="navbar.jsp" %>
    <div class="px-4 sm:px-[5vw] md:px-[7vw] lg:px-[9vw]">
    
      <div class="px-6 sm:px-16 lg:px-24 py-16 fade-in">
        <!-- Heading -->
        <div class="relative inline-block mb-7 py-3">
          <h2
            class="text-black text-2xl sm:text-3xl font-normal inline-block bounce-in"
          >
            ABOUT <span class="font-bold">US</span>
          </h2>
          <span
            class="absolute left-full top-1/2 -translate-y-1/2 ml-3 w-16 border-t-2 border-black"
          ></span>
        </div>

        <!-- Image Grid -->
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-32 mb-4">
          <div class="flex flex-col items-center">
            <img
              class="w-64 h-80 object-cover rounded-xl shadow-md transition-transform transform hover:scale-105"
              src="<%=request.getContextPath()%>/Image/img1.jpeg"
              alt="Store Interior"
            />
            <p
              class="text-black text-sm sm:text-base mt-3 text-center font-medium"
            >
              Store Interior
            </p>
          </div>
          <div class="flex flex-col items-center">
            <img
              class="w-64 h-80 object-cover rounded-xl shadow-md transition-transform transform hover:scale-105"
              src="<%=request.getContextPath()%>/Image/img2.jpeg"
              alt="Fresh Produce"
            />
            <p
              class="text-black text-sm sm:text-base mt-3 text-center font-medium"
            >
              Fresh Produce
            </p>
          </div>
          <div class="flex flex-col items-center">
            <img
              class="w-64 h-80 object-cover rounded-xl shadow-md transition-transform transform hover:scale-105"
              src="<%=request.getContextPath()%>/Image/img2.jpeg"
              alt="Shopping Aisle"
            />
            <p
              class="text-black text-sm sm:text-base mt-3 text-center font-medium"
            >
              Shopping Aisle
            </p>
          </div>
        </div>

        <!-- Description Section -->
        <div class="bg-gray-100 p-6 sm:p-8 rounded-lg shadow-lg slide-in">
          <p
            class="text-sm sm:text-base text-gray-700 leading-relaxed text-justify"
          >
            Welcome to <span class="font-semibold text-black">PantriPick</span>,
            your trusted neighborhood grocery store. Since our humble beginnings
            in 1997 in Ahmedabad, we have been committed to bringing the best
            quality products to our customers. What started as a small
            family-run store has now expanded into three thriving branches
            across Ahmedabad, Vadodara, and Surat.
          </p>

          <p
            class="text-sm sm:text-base text-gray-700 leading-relaxed text-justify mt-4"
          >
            At PantriPick, we believe in providing a seamless shopping
            experience by combining affordable pricing, premium quality, and
            exceptional customer service. We source fresh, locally grown produce
            and stock a wide range of essential grocery items to meet the needs
            of every household.
          </p>

          <p
            class="text-sm sm:text-base text-gray-700 leading-relaxed text-justify mt-4"
          >
            Over the years, we have built a strong bond with our customers,
            thanks to our unwavering dedication to quality and service. Whether
            you're here for a quick grocery run or preparing for a special
            occasion, our stores are designed to offer everything you need under
            one roof.
          </p>

          <p
            class="text-sm sm:text-base text-gray-700 leading-relaxed text-justify mt-4"
          >
            As we continue to grow, our mission remains the same—to make
            everyday shopping effortless, enjoyable, and affordable. Thank you
            for being part of our journey. We look forward to serving you for
            many years to come!
          </p>
        </div>
      </div>
    </div>
  </body>
</html>
<%@ include file="footer.jsp" %>