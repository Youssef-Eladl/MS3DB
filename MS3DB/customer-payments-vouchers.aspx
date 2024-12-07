<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HighestVoucher.aspx.cs" Inherits="MS3DB.Pages.HighestVoucher" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Highest Voucher</title>
  <link rel="stylesheet" href="styles.css">
</head>
<body>
  <!-- Header -->
  <header>
    <nav>
      <a href="customer-dashboard.aspx" class="logo">Telecommunication</a>
      <ul class="nav-links">
        <li><a href="customer-dashboard.aspx">Dashboard</a></li>
        <li><a href="HighestVoucher.aspx">Highest Voucher</a></li>
      </ul>
    </nav>
  </header>

  <!-- Main Content -->
  <main>
    <h1>Voucher with Highest Value</h1>

    <form id="voucherForm" runat="server">
      <label for="txtAccountID">Enter Account ID:</label>
      <asp:TextBox ID="txtAccountID" runat="server" placeholder="Account ID"></asp:TextBox>
      <asp:Button ID="btnFetchHighestVoucher" runat="server" Text="Fetch Voucher" OnClick="btnFetchHighestVoucher_Click" />

      <div id="results">
        <p><asp:Label ID="lblVoucherID" runat="server" Text=""></asp:Label></p>
        <p><asp:Label ID="lblVoucherValue" runat="server" Text=""></asp:Label></p>
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
