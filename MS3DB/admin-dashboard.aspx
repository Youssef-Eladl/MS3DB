﻿<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Telecommunication - Admin Dashboard</title>
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
      <a href="admin-dashboard.html" class="logo">Telecommunication</a>
      <ul class="nav-links">
        <li><a href="logout.html">Logout</a></li>
      </ul>
    </nav>
  </header>

  <!-- Main Content -->
  <main>
    <h1>Welcome, Admin</h1>
    <ul class="dashboard-list">
      <li class="dashboard-item">
        <div class="icon">👤</div>
        <div class="page-name"><a href="admin-customer-profiles.html">Customer Profiles</a></div>
        <div class="description">Manage customer profiles.</div>
      </li>
      <li class="dashboard-item">
        <div class="icon">🏬</div>
        <div class="page-name"><a href="admin-stores-vouchers.html">Stores & Vouchers</a></div>
        <div class="description">Manage stores and vouchers.</div>
      </li>
      <li class="dashboard-item">
        <div class="icon">🎫</div>
        <div class="page-name"><a href="admin-support-tickets.html">Support Tickets</a></div>
        <div class="description">Handle support tickets.</div>
      </li>
      <li class="dashboard-item">
        <div class="icon">📋</div>
        <div class="page-name"><a href="admin-service-plans.html">Service Plans</a></div>
        <div class="description">Manage service plans.</div>
      </li>
      <li class="dashboard-item">
        <div class="icon">📊</div>
        <div class="page-name"><a href="admin-total-usage.html">Total Usage</a></div>
        <div class="description">View usage statistics.</div>
      </li>
      <li class="dashboard-item">
        <div class="icon">✉️</div>
        <div class="page-name"><a href="admin-sms-offers.html">SMS Offers</a></div>
        <div class="description">Manage SMS offers.</div>
      </li>
      <li class="dashboard-item">
        <div class="icon">🔄</div>
        <div class="page-name"><a href="admin-remove-benefits.html">Remove Benefits</a></div>
        <div class="description">Remove customer benefits.</div>
      </li>
      <li class="dashboard-item">
        <div class="icon">💰</div>
        <div class="page-name"><a href="admin-wallets.html">Wallets</a></div>
        <div class="description">Manage customer wallets.</div>
      </li>
      <li class="dashboard-item">
        <div class="icon">🛒</div>
        <div class="page-name"><a href="admin-eshops.html">E-Shops</a></div>
        <div class="description">View e-shops and vouchers.</div>
      </li>
      <li class="dashboard-item">
        <div class="icon">💳</div>
        <div class="page-name"><a href="admin-payments.html">Payments</a></div>
        <div class="description">View payment transactions.</div>
      </li>
      <li class="dashboard-item">
        <div class="icon">💵</div>
        <div class="page-name"><a href="admin-cashback-transactions.html">Cashback Transactions</a></div>
        <div class="description">View cashback transactions per wallet.</div>
      </li>
       <li class="dashboard-item">
      <div class="icon">📱</div>
      <div class="page-name"><a href="admin-account-transactions.html">Account Transactions</a></div>
      <div class="description">View accepted transactions and earned points for an account.</div>
       </li>
      <li class="dashboard-item">
    <div class="icon">💲</div>
    <div class="page-name"><a href="admin-cashback-by-wallet.html">Cashback by Wallet</a></div>
    <div class="description">View cashback amount by wallet ID and plan ID.</div>
      </li>
      <li class="dashboard-item">
        <div class="icon">📈</div>
        <div class="page-name"><a href="admin-average-transactions.html">Average Transactions</a></div>
        <div class="description">View average sent transaction amounts by wallet ID.</div>
    </li>
    <li class="dashboard-item">
      <div class="icon">🔍</div>
      <div class="page-name"><a href="admin-wallet-check.html">Wallet Check</a></div>
      <div class="description">Check if a mobile number is linked to a wallet.</div>
     </li>
   <li class="dashboard-item">
    <div class="icon">🔄</div>
    <div class="page-name"><a href="admin-update-points.html">Update Points</a></div>
    <div class="description">Update total points for a mobile number.</div>
    </li>
    </ul>
  </main>

  <!-- Footer -->
  <footer>
    <p>&copy; 2023 Telecommunication</p>
  </footer>
</body>
</html>