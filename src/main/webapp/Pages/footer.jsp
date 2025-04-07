<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Footer</title>

    <!-- Font Awesome CDN -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
    />

    <style>
      .footer {
        background-color: black;
        color: white;
        text-align: center;
        padding: 15px 0;
        width: 100%;
        position: relative;
        bottom: 0;
        left: 0;
      }

      .social-icons {
        display: flex;
        justify-content: center;
        gap: 15px;
        margin: 10px 0;
      }

      .social-icons a {
        color: white;
        font-size: 20px;
        transition: opacity 0.3s ease-in-out;
      }

      .social-icons a:hover {
        opacity: 0.8;
      }

      .footer p {
        font-size: 12px;
        margin: 5px 0;
      }
    </style>
  </head>
  <body>
    <footer class="footer">
      <p>You can also reach us from:</p>
      <div class="social-icons">
        <a href="https://www.facebook.com/" target="_blank"
          ><i class="fab fa-facebook-f"></i
        ></a>
        <a href="https://www.instagram.com/" target="_blank"
          ><i class="fab fa-instagram"></i
        ></a>
        <a href="https://twitter.com/" target="_blank"
          ><i class="fab fa-x-twitter"></i
        ></a>
      </div>
      <p>© 2025 PantriPick. All rights reserved.</p>
    </footer>
  </body>
</html>