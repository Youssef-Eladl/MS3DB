﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin-update-points.aspx.cs" Inherits="MS3DB.admin_update_points" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Points</title>
    <link rel="stylesheet" href="styles.css">
</head>
<header>
    <nav>
      <a href="admin-dashboard.html" class="logo">Telecommunication</a>
      <ul class="nav-links">
        <!-- Navigation links -->
        <li><a href="admin-dashboard.html">Dashboard</a></li>
        <!-- ... -->
      </ul>
    </nav>
  </header>
<body>
    <main>
        <h1>Update Total Points</h1>
        <form id="update-points-form">
            <label for="mobile-number">Mobile Number:</label>
            <input type="text" id="mobile-number" name="mobile-number" required>
            <button type="submit">Update Points</button>
        </form>
    </main>

    <!-- Footer -->
    <footer>
        <p>&copy; 2023 Telecommunication</p>
    </footer>

    <script>
        document.getElementById('update-points-form').addEventListener('submit', function(event) {
            event.preventDefault();
            const mobileNumber = document.getElementById('mobile-number').value;
            
            fetch('/update-points', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ mobileNumber })
            })
            .then(response => response.json())
            .then(data => {
                alert('Points updated successfully!');
            })
            .catch(error => {
                console.error('Error:', error);
            });
        });
    </script>
</body>
</html>