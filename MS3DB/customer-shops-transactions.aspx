﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RemainingAmount.aspx.cs" Inherits="MS3DB.Pages.RemainingAmount" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Remaining Amount</title>
  <link rel="stylesheet" href="styles.css">
</head>
<body>
  <!-- Header -->
  <header>
    <nav>
      <a href="customer-dashboard.aspx" class="logo">Telecommunication</a>
      <ul class="nav-links">
        <li><a href="customer-dashboard.aspx">Dashboard</a></li>
        <li><a href="customer-shops-transactions.aspx">Remaining Amount</a></li>
      </ul>
    </nav>
  </header>

  <!-- Main Content -->
  <main>
    <h1>Remaining Amount for Last Payment</h1>

    <form id="remainingAmountForm" runat="server">
      <label for="txtAccountID">Enter Account ID:</label>
      <asp:TextBox ID="txtAccountID" runat="server" placeholder="Account ID"></asp:TextBox>

      <label for="txtPlanID">Enter Plan ID:</label>
      <asp:TextBox ID="txtPlanID" runat="server" placeholder="Plan ID"></asp:TextBox>

      <asp:Button ID="btnFetchRemainingAmount" runat="server" Text="Fetch Remaining Amount" OnClick="btnFetchRemainingAmount_Click" />

      <div id="results">
        <p><asp:Label ID="lblPaymentID" runat="server" Text=""></asp:Label></p>
        <p><asp:Label ID="lblRemainingAmount" runat="server" Text=""></asp:Label></p>
        <p><asp:Label ID="lblPaymentDate" runat="server" Text=""></asp:Label></p>
        <p style="color: red;"><asp:Label ID="lblMessage" runat="server" Text=""></asp:Label></p>
      </div>
    </form>
  </main>

  <!-- Footer -->
  <footer>
    <p>&copy; 2023 Telecommunication</p>
  </footer>
</body>
</html>
