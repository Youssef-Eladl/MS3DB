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
      <a href="admin-dashboard.aspx" class="logo">Telecommunication</a>
      <ul class="nav-links">
        <li><a href="admin-dashboard.aspx">Dashboard</a></li>
        <li><a href="admin-customer-profiles.aspx">Customer Profiles</a></li>
        <li><a href="admin-stores-vouchers.aspx">Stores & Vouchers</a></li>
        <li><a href="admin-support-tickets.aspx">Support Tickets</a></li>
        <li><a href="admin-service-plans.aspx">Service Plans</a></li>
        <li><a href="admin-total-usage.aspx">Total Usage</a></li>
        <li><a href="admin-sms-offers.aspx">SMS Offers</a></li>
        <li><a href="admin-remove-benefits.aspx">Remove benifits</a></li>
        <li><a href="admin-wallets.aspx">Wallets</a></li>
        <li><a href="admin-payments.aspx">Payments</a></li>
        <li><a href="logout.aspx">Logout</a></li>
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
