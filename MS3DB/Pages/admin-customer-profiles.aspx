﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin-customer-profiles.aspx.cs" Inherits="MS3DB.Pages.admin_customer_profiles" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - Customer Profiles</title>
    <link rel="stylesheet" href="styles.css"> <!-- Ensure your styles.css includes necessary styles -->
    <style>
        /* Additional styles specific to the admin dashboard */

        .customer-profiles {
            padding: 20px;
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
      <li><a href="admin-payments.html">Payments</a></li>
      <!-- ... -->
    </ul>
  </nav>
</header>

    <!-- Admin Dashboard Content -->
    <main>
        <section class="customer-profiles">
            <h2>Customer Profiles</h2>
            <table id="customerTable">
                <thead>
                    <tr>
                        <th>National ID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th>Date of Birth</th>
                        <th>Mobile No</th>
                        <th>Account Type</th>
                        <th>Status</th>
                        <th>Start Date</th>
                        <th>Balance</th>
                        <th>Points</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Data will be populated here via JavaScript -->
                </tbody>
            </table>
        </section>
    </main>

    <!-- Footer -->
    <footer>
        <p>&copy; 2023 Telecommunication</p>
    </footer>

    <!-- JavaScript to fetch and display data -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            fetch('fetch_customer_accounts.php')
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok ' + response.statusText);
                    }
                    return response.json();
                })
                .then(data => {
                    const tableBody = document.querySelector('#customerTable tbody');
                    data.forEach(customer => {
                        const row = document.createElement('tr');

                        // Create table cells for each data field
                        for (const key in customer) {
                            const cell = document.createElement('td');
                            cell.textContent = customer[key];
                            row.appendChild(cell);
                        }

                        tableBody.appendChild(row);
                    });
                })
                .catch(error => {
                    console.error('There was a problem with the fetch operation:', error);
                    alert('Failed to load customer data.');
                });
        });
    </script>
</body>
</html>