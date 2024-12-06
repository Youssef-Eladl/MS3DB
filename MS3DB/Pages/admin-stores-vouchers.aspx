﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin-stores-vouchers.aspx.cs" Inherits="MS3DB.Pages.admin_stores_vouchers" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Telecommunication - Stores & Vouchers</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Additional styles specific to Stores & Vouchers page */

        .stores-vouchers {
            padding: 20px;
        }

        .stores-vouchers h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
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
            td:nth-of-type(1):before { content: "Shop ID"; }
            td:nth-of-type(2):before { content: "Shop Name"; }
            td:nth-of-type(3):before { content: "Address"; }
            td:nth-of-type(4):before { content: "Working Hours"; }
            td:nth-of-type(5):before { content: "Voucher ID"; }
            td:nth-of-type(6):before { content: "Voucher Value"; }
            td:nth-of-type(7):before { content: "Redeem Date"; }
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
      <li><a href="admin-payments.html">Payments</a></li>
      <!-- ... -->
    </ul>
  </nav>
</header>

    <!-- Main Content -->
    <main>
        <section class="stores-vouchers">
            <h1>Physical Stores and Redeemed Vouchers</h1>
            <table id="storesVouchersTable">
                <thead>
                    <tr>
                        <th>Shop ID</th>
                        <th>Shop Name</th>
                        <th>Address</th>
                        <th>Working Hours</th>
                        <th>Voucher ID</th>
                        <th>Voucher Value</th>
                        <th>Redeem Date</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Sample Data Row -->
                    <tr>
                        <td>1</td>
                        <td>Store Alpha</td>
                        <td>123 Main St, Cairo</td>
                        <td>9 AM - 9 PM</td>
                        <td>V1001</td>
                        <td>$50</td>
                        <td>2023-08-15</td>
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

</body>
</html>