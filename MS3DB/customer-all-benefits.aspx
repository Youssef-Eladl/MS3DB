<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="active-benefits.aspx.cs" Inherits="MS3DB.Pages.ActiveBenefits" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Active Benefits</title>
  <link rel="stylesheet" href="styles.css">
</head>
<body>
  <!-- Header -->
  <header>
    <nav>
      <a href="customer-dashboard.aspx" class="logo">Telecommunication</a>
      <ul class="nav-links">
        <li><a href="customer-dashboard.aspx">Dashboard</a></li>
        <li><a href="customer-all-benefits.aspx">Active Benefits</a></li>
      </ul>
    </nav>
  </header>

  <!-- Main Content -->
  <main>
    <h1>Active Benefits</h1>

    <div id="results">
      <asp:Repeater ID="benefitsRepeater" runat="server">
        <HeaderTemplate>
          <table>
            <thead>
              <tr>
                <th>Benefit ID</th>
                <th>Benefit Name</th>
                <th>Description</th>
                <th>Valid From</th>
                <th>Valid To</th>
              </tr>
            </thead>
            <tbody>
        </HeaderTemplate>
        <ItemTemplate>
          <tr>
            <td><%# Eval("BenefitID") %></td>
            <td><%# Eval("BenefitName") %></td>
            <td><%# Eval("Description") %></td>
            <td><%# Eval("ValidFrom", "{0:yyyy-MM-dd}") %></td>
            <td><%# Eval("ValidTo", "{0:yyyy-MM-dd}") %></td>
          </tr>
        </ItemTemplate>
        <FooterTemplate>
            </tbody>
          </table>
        </FooterTemplate>
      </asp:Repeater>
    </div>
  </main>

  <!-- Footer -->
  <footer>
    <p>&copy; 2023 Telecommunication</p>
  </footer>
</body>
</html>
