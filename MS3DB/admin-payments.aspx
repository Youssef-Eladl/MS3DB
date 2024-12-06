<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin-payments.aspx.cs" Inherits="MS3DB.Pages.admin_payments" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
  <meta charset="UTF-8">
  <title>Telecommunication - Payments</title>
  <link rel="stylesheet" href="styles.css">
  <style>
      /* Additional styles specific to Payments page */
      .payments {
          padding: 20px;
      }
      .payments h1 {
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
  </style>
</head>
<body runat="server">
  <!-- Header -->
  <header>
    <nav>
      <a href="admin-dashboard.aspx" class="logo">Telecommunication</a>
      <ul class="nav-links">
        <!-- Navigation links -->
        <li><a href="admin-dashboard.aspx">Dashboard</a></li>
        <!-- ... -->
        <li><a href="admin-payments.aspx">Payments</a></li>
        <!-- ... -->
      </ul>
    </nav>
  </header>

  <!-- Main Content -->
  <main>
    <section class="payments">
      <h1>Payments</h1>
      <table id="paymentsTable">
        <thead>
          <tr>
            <th>Payment ID</th>
            <th>Amount</th>
            <th>Date of Payment</th>
            <th>Payment Method</th>
            <th>Status</th>
            <th>Mobile No</th>
          </tr>
        </thead>
        <tbody>
          <asp:Repeater ID="paymentsRepeater" runat="server">
            <ItemTemplate>
              <tr>
                <td><%# Eval("PaymentID") %></td>
                <td><%# Eval("Amount") %></td>
                <td><%# Eval("DateOfPayment") %></td>
                <td><%# Eval("PaymentMethod") %></td>
                <td><%# Eval("Status") %></td>
                <td><%# Eval("MobileNo") %></td>
              </tr>
            </ItemTemplate>
          </asp:Repeater>
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
