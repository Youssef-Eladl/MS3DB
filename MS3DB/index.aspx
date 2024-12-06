<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="MS3DB.Pages.index" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Telecommunication - Home</title>
  <link rel="stylesheet" href="styles.css">
</head>
<body>
  <!-- Top Navigation -->
  <nav class="top-nav" id="topNav">
    <div class="nav-wrapper">
        <a href="login.aspx" class="nav-link" onclick="setUserType('consumer')">Consumer</a>
        <a href="login.aspx" class="nav-link" onclick="setUserType('admin')">Admin</a>
    </div>
</nav>

  <!-- Main Header -->
  <header>
    <nav>
      <a href="index.aspx" class="logo">Telecommunication</a>
      <ul class="nav-links">
        <li><a href="index.aspx">Home</a></li>
        <li><a href="faq.aspx">FAQ</a></li>
        <li><a href="contact.aspx">Contact Us</a></li>
        <li><a href="login.aspx">Login</a></li>
      </ul>
    </nav>
  </header>

  <!-- Slideshow Section -->
  <div class="slideshow-container">
    <div class="slide fade">
      <img src="images/image1.jpg" alt="Image 1">
    </div>
    <div class="slide fade">
      <img src="images/image2.jpg" alt="Image 2">
    </div>
    <div class="slide fade">
      <img src="images/image3.jpg" alt="Image 3">
    </div>
  </div>

  <!-- Main Content -->
  <main>

  </main>

  <!-- Footer -->
  <footer>
    <p>&copy; 2023 Telecommunication</p>
  </footer>

  <script src="app.js"></script>
</body>
</html>