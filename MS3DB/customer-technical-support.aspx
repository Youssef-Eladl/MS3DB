<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customer-technical-support.aspx.cs" Inherits="MS3DB.Pages.customer_technical_support" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Telecommunication - Technical Support</title>
  <link rel="stylesheet" href="styles.css">
</head>
<body>
  <!-- Header -->
  <header>
    <nav>
      <a href="customer-dashboard.aspx" class="logo">Telecommunication</a>
      <ul class="nav-links">
        <!-- Navigation links -->
        <li><a href="customer-dashboard.aspx">Dashboard</a></li>
        <li><a href="customer-technical-support.aspx">Technical Support</a></li>
        <!-- ... -->
      </ul>
    </nav>
  </header>

  <!-- Main Content -->
  <main>
    <h1>Technical Support</h1>
    <!-- Content for accessing technical support -->
      <asp:Repeater ID="unresolvedTicketsRepeater" runat="server">
    <HeaderTemplate>
        <table>
            <thead>
                <tr>
                    <th>Account ID</th>
                    <th>Unresolved Tickets</th>
                </tr>
            </thead>
            <tbody>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td><%# Eval("AccountID") %></td>
            <td><%# Eval("UnresolvedTickets") %></td>
        </tr>
    </ItemTemplate>
    <FooterTemplate>
            </tbody>
        </table>
    </FooterTemplate>
</asp:Repeater>

  </main>

  <!-- Footer -->
  <footer>
    <p>&copy; 2023 Telecommunication</p>
  </footer>
</body>
</html>