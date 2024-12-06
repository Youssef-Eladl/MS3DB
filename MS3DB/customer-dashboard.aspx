<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customer-dashboard.aspx.cs" Inherits="MS3DB.Pages.Shared.customer_dashboard" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Telecommunication - Customer Dashboard</title>
  <link rel="stylesheet" href="styles.css">
</head>
<body>
  <!-- Header -->
  <header>
    <nav>
      <a href="customer-dashboard.aspx" class="logo">Telecommunication</a>
      <ul class="nav-links">
        <li><a href="customer-dashboard.aspx">Dashboard</a></li>
        <li><a href="customer-service-plans.aspx">Service Plans</a></li>
        <li><a href="customer-usage-benefits.aspx">Usage & Benefits</a></li>
        <li><a href="customer-technical-support.aspx">Technical Support</a></li>
        <li><a href="customer-payments-vouchers.aspx">Payments & Vouchers</a></li>
        <li><a href="customer-shops-transactions.aspx">Shops & Transactions</a></li>
        <li><a href="logout.aspx">Logout</a></li>
      </ul>
    </nav>
  </header>

  <!-- Main Content -->
  <main>
    <h1>Welcome, Customer</h1>
    <p>Select an option from the navigation menu.</p>
  </main>

  <!-- Footer -->
  <footer>
    <p>&copy; 2023 Telecommunication</p>
  </footer>
</body>
</html>