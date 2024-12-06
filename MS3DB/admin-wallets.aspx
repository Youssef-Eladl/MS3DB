<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin-wallets.aspx.cs" Inherits="MS3DB.Pages.admin_wallets" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
  <meta charset="UTF-8">
  <title>Telecommunication - Wallets</title>
  <link rel="stylesheet" href="styles.css">
  <style>
      /* Additional styles specific to Wallets page */
      .wallets {
          padding: 20px;
      }
      .wallets h1 {
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
        <li><a href="admin-wallets.aspx">Wallets</a></li>
        <!-- ... -->
      </ul>
    </nav>
  </header>

  <!-- Main Content -->
  <main>
    <section class="wallets">
      <h1>Wallets</h1>
      <table id="walletsTable">
        <thead>
          <tr>
            <th>National ID</th>
            <th>Customer Name</th>
            <th>Mobile No</th>
            <th>Current Balance</th>
            <th>Currency</th>
            <th>Last Modified Date</th>
          </tr>
        </thead>
        <tbody>
          <asp:Repeater ID="walletsRepeater" runat="server">
            <ItemTemplate>
              <tr>
                <td><%# Eval("NationalID") %></td>
                <td><%# Eval("CustomerName") %></td>
                <td><%# Eval("MobileNo") %></td>
                <td><%# Eval("CurrentBalance") %></td>
                <td><%# Eval("Currency") %></td>
                <td><%# Eval("LastModifiedDate") %></td>
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
