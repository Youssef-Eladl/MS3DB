<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customer-dashboard.aspx.cs" Inherits="MS3DB.customer_dashboard" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Telecommunication - Customer Dashboard</title>
  <link rel="stylesheet" href="styles.css">
  <style>
    /* Styles for the dashboard list */
    .dashboard-list {
      list-style-type: none;
      padding: 0;
      margin: 20px 0;
    }

    .dashboard-item {
      display: flex;
      align-items: center;
      padding: 15px;
      border-bottom: 1px solid #ddd;
    }

    .dashboard-item .icon {
      width: 40px;
      text-align: center;
      font-size: 24px;
    }

    .dashboard-item .page-name {
      flex: 1;
      margin-left: 15px;
      font-size: 18px;
    }

    .dashboard-item .description {
      flex: 2;
      text-align: right;
      color: #666;
    }

    .dashboard-item a {
      text-decoration: none;
      color: #000;
      font-weight: bold;
    }

    .dashboard-item a:hover {
      text-decoration: underline;
    }

    /* Responsive adjustments */
    @media (max-width: 768px) {
      .dashboard-item {
        flex-direction: column;
        align-items: flex-start;
      }
      .dashboard-item .description {
        text-align: left;
        margin-top: 5px;
      }
    }
  </style>
</head>
<body>
  <!-- Header -->
  <header>
    <nav>
      <a href="customer-dashboard.html" class="logo">Telecommunication</a>
      <ul class="nav-links">
        <li><a href="logout.html">Logout</a></li>
      </ul>
    </nav>
  </header>

  <!-- Main Content -->
  <main>
    <h1>Welcome, Customer</h1>
    <ul class="dashboard-list">
      <li class="dashboard-item">
        <div class="icon">📋</div>
        <div class="page-name"><a href="customer-service-plans.html">Service Plans</a></div>
        <div class="description">View and manage your service plans.</div>
      </li>
      <li class="dashboard-item">
        <div class="icon">📈</div>
        <div class="page-name"><a href="customer-view-consumption.html">View Consumption</a></div>
        <div class="description">View your SMS, Minutes, and Internet consumption.</div>
    </li>
    <li class="dashboard-item">
      <div class="icon">📄</div>
      <div class="page-name"><a href="customer-available-plans.html">Available Plans</a></div>
      <div class="description">View all available service plans not subscribed to.</div>
    </li>
    <li class="dashboard-item">
      <div class="icon">📊</div>
      <div class="page-name"><a href="customer-active-plan-usage.html">Active Plan Usage</a></div>
      <div class="description">View usage of your active plans for the current month.</div>
    </li>
    <li class="dashboard-item">
      <div class="icon">💸</div>
      <div class="page-name"><a href="customer-wallet-cashback.html">Wallet Cashback</a></div>
      <div class="description">View all cashback transactions related to your wallet.</div>
    </li>
    <li class="dashboard-item">
      <div class="icon">🎁</div>
      <div class="page-name"><a href="customer-active-benefits.html">Active Benefits</a></div>
      <div class="description">View all active benefits available to you.</div>
    </li>
    <li class="dashboard-item">
      <div class="icon">📬</div>
      <div class="page-name"><a href="customer-open-support-tickets.html">Open Support Tickets</a></div>
      <div class="description">View the number of open support tickets for each of your accounts.</div>
    </li>
    <li class="dashboard-item">
      <div class="icon">🏆</div>
      <div class="page-name"><a href="customer-highest-voucher.html">Highest Voucher</a></div>
      <div class="description">View the voucher with the highest value for your account.</div>
    </li>
    <li class="dashboard-item">
      <div class="icon">💰</div>
      <div class="page-name"><a href="customer-remaining-amount.html">Remaining Amount</a></div>
      <div class="description">View the remaining amount for your last payment on a specific plan.</div>
    </li>
    <li class="dashboard-item">
      <div class="icon">💵</div>
      <div class="page-name"><a href="customer-extra-amount.html">Extra Amount</a></div>
      <div class="description">View the extra amount for your last payment on a specific plan.</div>
    </li>
    <li class="dashboard-item">
      <div class="icon">💳</div>
      <div class="page-name"><a href="customer-top-payments.html">Top Payments</a></div>
      <div class="description">View the top 10 successful payments for your account.</div>
    </li>
    <li class="dashboard-item">
      <div class="icon">🏪</div>
      <div class="page-name"><a href="customer-shops.html">All Shops</a></div>
      <div class="description">View details for all shops.</div>
    </li>
    <li class="dashboard-item">
      <div class="icon">📅</div>
      <div class="page-name"><a href="customer-subscriptions.html">Subscribed Plans</a></div>
      <div class="description">View all service plans you subscribed to in the past 5 months.</div>
    </li>
    <li class="dashboard-item">
      <div class="icon">🔄</div>
      <div class="page-name"><a href="customer-renew-subscription.html">Renew Subscription</a></div>
      <div class="description">Renew your existing service plans through a payment transaction.</div>
    </li>
    <li class="dashboard-item">
      <div class="icon">💰</div>
      <div class="page-name"><a href="customer-get-cashback.html">Get Cashback</a></div>
      <div class="description">Get the cashback amount for a specific payment transaction and benefit.</div>
    </li>
    <li class="dashboard-item">
      <div class="icon">💳</div>
      <div class="page-name"><a href="customer-recharge.html">Recharge Balance</a></div>
      <div class="description">Recharge your account balance through a chosen payment method.</div>
    </li>
    <li class="dashboard-item">
      <div class="icon">🎟️</div>
      <div class="page-name"><a href="customer-redeem-voucher.html">Redeem Voucher</a></div>
      <div class="description">Redeem your voucher using the voucher ID.</div>
  </li>
    </ul>
  </main>

  <!-- Footer -->
  <footer>
    <p>&copy; 2023 Telecommunication</p>
  </footer>
</body>
</html>