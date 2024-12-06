﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin-remove-benefits.aspx.cs" Inherits="MS3DB.Pages.admin_remove_benefits" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Telecommunication - Remove Benefits</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Additional styles specific to Remove Benefits page */

        .remove-benefits {
            padding: 20px;
        }

        .remove-benefits h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .form-container {
            max-width: 500px;
            margin: 0 auto 20px auto;
            padding: 20px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .form-container label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-container input {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .form-container button {
            padding: 10px 20px;
            background-color: #dc3545;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .form-container button:hover {
            background-color: #c82333;
        }

        /* Success and Error Message Styles */
        .message {
            max-width: 500px;
            margin: 0 auto 20px auto;
            padding: 15px;
            border-radius: 5px;
            text-align: center;
            display: none; /* Hidden by default */
        }

        .success {
            background-color: #d4edda;
            border: 1px solid #c3e6cb;
            color: #155724;
        }

        .error {
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
            color: #721c24;
        }
    </style>
</head>
<body>
    
  <!-- Header -->
  <header>
    <nav>
      <a href="admin-dashboard.html" class="logo">Telecommunication</a>
      <ul class="nav-links">
        <!-- Navigation links -->
        <li><a href="admin-dashboard.html">Dashboard</a></li>
        <!-- ... -->
        <li><a href="admin-support-tickets.html">Support Tickets</a></li>
        <!-- ... -->
      </ul>
    </nav>
  </header>

   <!-- Main Content -->
   <main>
       <section class="remove-benefits">
           <h1>Remove Benefits from Account</h1>

           <!-- Form Container -->
           <div class="form-container">
               <form id="removeBenefitsForm" method="post" action="process-remove-benefits.aspx">
                   <label for="mobileNo">Mobile Number:</label>
                   <input type="text" id="mobileNo" name="mobileNo" pattern="\d{11}" title="Enter 11-digit mobile number" required>

                   <label for="planID">Plan ID:</label>
                   <input type="number" id="planID" name="planID" min="1" required>

                   <button type="submit">Remove Benefits</button>
               </form>
           </div>

           <!-- Success Message -->
           <div class="message success" id="successMessage">
               Benefits successfully removed from the account.
           </div>

           <!-- Error Message -->
           <div class="message error" id="errorMessage">
               Failed to remove benefits. Please check the inputs and try again.
           </div>
       </section>
   </main>

   <!-- Footer -->
   <footer>
     <p>&copy; 2023 Telecommunication</p>
   </footer>

   <!-- Optional JavaScript for Form Handling -->
   <script>
       // Example: Display success or error message based on query parameters
       window.onload = function() {
           const urlParams = new URLSearchParams(window.location.search);
           if (urlParams.get('status') === 'success') {
               document.getElementById('successMessage').style.display = 'block';
           } else if (urlParams.get('status') === 'error') {
               document.getElementById('errorMessage').style.display = 'block';
           }
       };
   </script>
</body>
</html>