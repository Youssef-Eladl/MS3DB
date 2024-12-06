<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin-dashboard.aspx.cs" Inherits="MS3DB.Pages.admin_dashboard" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Telecommunication - Admin Dashboard</title>
  <link rel="stylesheet" href="styles.css">
</head>
<body>
  <!-- Header -->
  <header>
    <nav>
      <a href="admin-dashboard.html" class="logo">Telecommunication</a>
      <ul class="nav-links">
        <li><a href="admin-dashboard.html">Dashboard</a></li>
        <li><a href="admin-customer-profiles.html">Customer Profiles</a></li>
        <li><a href="admin-stores-vouchers.html">Stores & Vouchers</a></li>
        <li><a href="admin-support-tickets.html">Support Tickets</a></li>
        <li><a href="admin-service-plans.html">Service Plans</a></li>
        <li><a href="admin-total-usage.html">Total Usage</a></li>
        <li><a href="admin-sms-offers.html">SMS Offers</a></li>
        <li><a href="admin-remove-benefits.html">Remove benifits</a></li>
        <li><a href="admin-wallets.html">Wallets</a></li>
        <li><a href="admin-payments.html">Payments</a></li>
        <li><a href="logout.html">Logout</a></li>
      </ul>
    </nav>
  </header>

  <!-- Main Content -->
  <main>
    <h1>Welcome, Admin</h1>
    <p>Select an option from the navigation menu.</p>
  </main>

  <!-- Footer -->
  <footer>
    <p>&copy; 2023 Telecommunication</p>
  </footer>
</body>
</html>
