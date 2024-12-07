<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cashback-transactions.aspx.cs" Inherits="MS3DB.Pages.CashbackTransactions" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Cashback Transactions</title>
  <link rel="stylesheet" href="styles.css">
</head>
<body>
  <!-- Header -->
  <header>
    <nav>
      <a href="customer-dashboard.aspx" class="logo">Telecommunication</a>
      <ul class="nav-links">
        <li><a href="customer-dashboard.aspx">Dashboard</a></li>
        <li><a href="cashback-transactions.aspx">Cashback Transactions</a></li>
      </ul>
    </nav>
  </header>

  <!-- Main Content -->
  <main>
    <h1>Cashback Transactions</h1>

    <form id="transactionsForm" runat="server">
      <label for="txtNationalID">Enter National ID:</label>
      <asp:TextBox ID="txtNationalID" runat="server" placeholder="National ID" />
      <asp:Button ID="btnFetchTransactions" runat="server" Text="Fetch Transactions" OnClick="btnFetchTransactions_Click" />

      <div id="results">
        <asp:Repeater ID="transactionsRepeater" runat="server">
          <HeaderTemplate>
            <table>
              <thead>
                <tr>
                  <th>Transaction ID</th>
                  <th>Cashback Amount</th>
                  <th>Transaction Date</th>
                  <th>Wallet ID</th>
                  <th>Customer Name</th>
                  <th>National ID</th>
                </tr>
              </thead>
              <tbody>
          </HeaderTemplate>
          <ItemTemplate>
            <tr>
              <td><%# Eval("TransactionID") %></td>
              <td><%# Eval("CashbackAmount", "{0:C}") %></td>
              <td><%# Eval("TransactionDate", "{0:yyyy-MM-dd}") %></td>
              <td><%# Eval("WalletID") %></td>
              <td><%# Eval("CustomerName") %></td>
              <td><%# Eval("NationalID") %></td>
            </tr>
          </ItemTemplate>
          <FooterTemplate>
              </tbody>
            </table>
          </FooterTemplate>
        </asp:Repeater>

        <p style="color: red;"><asp:Label ID="lblMessage" runat="server"></asp:Label></p>
      </div>
    </form>
  </main>

  <!-- Footer -->
  <footer>
    <p>&copy; 2023 Telecommunication</p>
  </footer>
</body>
</html>
