﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin-total-usage.aspx.cs" Inherits="MS3DB.Pages.admin_total_usage" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Telecommunication - Total Usage</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Additional styles specific to Total Usage page */

        .total-usage {
            padding: 20px;
        }

        .total-usage h1 {
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
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .filter-form button:hover {
            background-color: #218838;
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
            td:nth-of-type(1):before { content: "Plan ID"; }
            td:nth-of-type(2):before { content: "Plan Name"; }
            td:nth-of-type(3):before { content: "Total SMS Sent"; }
            td:nth-of-type(4):before { content: "Total Minutes Used"; }
            td:nth-of-type(5):before { content: "Total Data Consumed (MB)"; }
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
        <section class="total-usage">
            <h1>Total Usage by Account</h1>

            <!-- Filter Form -->
            <div class="filter-form">
                <form id="usageForm" method="post" action="#">
                    <label for="mobileNo">Mobile Number:</label>
                    <input type="text" id="mobileNo" name="mobileNo" pattern="\d{11}" title="Enter 11-digit mobile number" required>

                    <label for="inputDate">From Date:</label>
                    <input type="date" id="inputDate" name="inputDate" required>

                    <button type="submit">Show Usage</button>
                </form>
            </div>

            <!-- Error Message -->
            <div class="error-message" id="errorMessage">
                No usage data found for the provided account and date.
            </div>

            <table id="usageTable">
                <thead>
                    <tr>
                        <th>Plan ID</th>
                        <th>Plan Name</th>
                        <th>Total SMS Sent</th>
                        <th>Total Minutes Used</th>
                        <th>Total Data Consumed (MB)</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Data Rows will be populated here -->
                    <tr>
                        <td>1</td>
                        <td>Premium Plan</td>
                        <td>500</td>
                        <td>1000</td>
                        <td>5000</td>
                    </tr>
                    <!-- Additional Data Rows -->
                </tbody>
            </table>
        </section>
    </main>

    <!-- Footer -->
    <footer>
        <p>&copy; 2023 Telecommunication</p>
    </footer>

</body>
</html>