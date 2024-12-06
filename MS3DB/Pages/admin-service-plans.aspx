﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin-service-plans.aspx.cs" Inherits="MS3DB.Pages.admin_service_plans" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Telecommunication - Service Plans</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Additional styles specific to Service Plans page */

        .service-plans {
            padding: 20px;
        }

        .service-plans h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .filter-form {
            max-width: 500px;
            margin: 0 auto 20px auto;
            padding: 20px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .filter-form label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .filter-form input {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .filter-form button {
            padding: 10px 20px;
            background-color: #1877f2;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .filter-form button:hover {
            background-color: #166fe5;
        }

        /* Error Message Styles */
        .error-message {
            max-width: 500px;
            margin: 0 auto 20px auto;
            padding: 15px;
            background-color: #ffe6e6;
            border: 1px solid #ffcccc;
            border-radius: 5px;
            color: #cc0000;
            text-align: center;
            display: none; /* Hidden by default */
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:hover {background-color: #f5f5f5;}

        /* Responsive Design */
        @media (max-width: 768px) {
            table, thead, tbody, th, td, tr { 
                display: block; 
            }

            th {
                position: absolute;
                top: -9999px;
                left: -9999px;
            }

            tr { border: 1px solid #ccc; margin-bottom: 5px; }

            td { 
                border: none;
                border-bottom: 1px solid #eee; 
                position: relative;
                padding-left: 50%; 
            }

            td:before { 
                position: absolute;
                top: 12px;
                left: 12px;
                width: 45%; 
                padding-right: 10px; 
                white-space: nowrap;
                font-weight: bold;
            }

            /* Label the data */
            td:nth-of-type(1):before { content: "Customer Name"; }
            td:nth-of-type(2):before { content: "Mobile No"; }
            td:nth-of-type(3):before { content: "Plan Name"; }
            td:nth-of-type(4):before { content: "Price"; }
            td:nth-of-type(5):before { content: "SMS Offered"; }
            td:nth-of-type(6):before { content: "Minutes Offered"; }
            td:nth-of-type(7):before { content: "Data Offered (MB)"; }
            td:nth-of-type(8):before { content: "Subscription Date"; }
            td:nth-of-type(9):before { content: "Subscription Status"; }
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
      <li><a href="admin-service-plans.html">Service Plans</a></li>
      <!-- ... -->
    </ul>
  </nav>
</header>

    <!-- Main Content -->
    <main>
        <section class="service-plans">
            <h1>Customers' Accounts and Subscribed Service Plans</h1>

            <!-- Filter Form -->
            <div class="filter-form">
                <form id="filterForm" method="post" action="#">
                    <label for="planId">Plan ID:</label>
                    <input type="number" id="planId" name="planId" required>

                    <label for="inputDate">Date:</label>
                    <input type="date" id="inputDate" name="inputDate" required>

                    <button type="submit">Filter</button>
                </form>
            </div>

            <!-- Error Message -->
            <div class="error-message" id="errorMessage">
                No customer accounts found matching the provided Plan ID and Date.
            </div>

            <table id="servicePlansTable">
                <thead>
                    <tr>
                        <th>Customer Name</th>
                        <th>Mobile No</th>
                        <th>Plan Name</th>
                        <th>Price</th>
                        <th>SMS Offered</th>
                        <th>Minutes Offered</th>
                        <th>Data Offered (MB)</th>
                        <th>Subscription Date</th>
                        <th>Subscription Status</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Sample Data Row -->
                    <tr>
                        <td>John Doe</td>
                        <td>01234567890</td>
                        <td>Premium Plan</td>
                        <td>$50</td>
                        <td>500</td>
                        <td>1000</td>
                        <td>5000</td>
                        <td>2023-01-15</td>
                        <td>Active</td>
                    </tr>
                    <!-- Additional Data Rows will be populated here -->
                </tbody>
            </table>
        </section>
    </main>

    <!-- Footer -->
    <footer>
        <p>&copy; 2023 Telecommunication</p>
    </footer>
    <script>
      document.getElementById('filterForm').addEventListener('submit', function(event) {
          event.preventDefault(); // Prevent form from submitting

          // Get input values
          const planId = document.getElementById('planId').value;
          const inputDate = document.getElementById('inputDate').value;

          // For demonstration, assume no data is found
          // You will implement actual data retrieval once backend is connected

          // Hide the table
          document.getElementById('servicePlansTable').style.display = 'none';

          // Show the error message
          document.getElementById('errorMessage').style.display = 'block';
      });
    </script>
</body>
</html>