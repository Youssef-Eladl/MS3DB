<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TopPayments.aspx.cs" Inherits="MS3DB.Pages.TopPayments" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Top Payments</title>
  <link rel="stylesheet" href="styles.css">
</head>
<body>
  <!-- Header -->
  <header>
    <nav>
      <a href="customer-dashboard.aspx" class="logo">Telecommunication</a>
      <ul class="nav-links">
        <li><a href="customer-dashboard.aspx">Dashboard</a></li>
        <li><a href="TopPayments.aspx">Top Payments</a></li>
      </ul>
    </nav>
  </header>

  <!-- Main Content -->
  <main>
    <h1>Top 10 Successful Payments</h1>

    <form id="topPaymentsForm" runat="server">
      <label for="txtAccountID">Enter Account ID:</label> 93324<asp:Button ID="btnFetchTopPayments" runat="server" Text="Fetch Top Payments" OnClick="btnFetchTopPayments_Click" />

      <div id="results">
        <asp:Repeater ID="topPaymentsRepeater" runat="server">
          <HeaderTemplate>
            <table>
              <thead>
                <tr>
                  <th>Payment ID</th>
                  <th>Paid Amount</th>
                  <th>Payment Date</th>
                  <th>Status</th>
                </tr>
              </thead>
              <tbody>
          </HeaderTemplate>
          <ItemTemplate>
            <tr>
              <td><%# Eval("PaymentID") %></td>
              <td><%# Eval("PaidAmount", "{0:C}") %></td>
              <td><%# Eval("PaymentDate", "{0:yyyy-MM-dd}") %></td>
              <td><%# Eval("Status") %></td>
            </tr>
          </ItemTemplate>
          <FooterTemplate>
              </tbody>
            </table>
          </FooterTemplate>
        </asp:Repeater>

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
