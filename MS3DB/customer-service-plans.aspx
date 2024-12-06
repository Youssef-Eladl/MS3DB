<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customer-service-plans.aspx.cs" Inherits="MS3DB.Pages.customer_service_plans" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Telecommunication - Service Plans</title>
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
        <li><a href="customer-service-plans.aspx">Service Plans</a></li>
      </ul>
    </nav>
  </header>

  <!-- Main Content -->
  <main>
    <h1>Service Plans</h1>

    <!-- Section 1: View All Plans -->
    <section id="allPlansSection">
      <h2>All Service Plans</h2>
      <table id="servicePlansTable">
        <thead>
          <tr>
            <th>Plan ID</th>
            <th>Plan Name</th>
            <th>Price</th>
            <th>SMS Offered</th>
            <th>Minutes Offered</th>
            <th>Data Offered (MB)</th>
            <th>Description</th>
          </tr>
        </thead>
        <tbody>
          <asp:Repeater ID="servicePlansOnlyRepeater" runat="server">
            <ItemTemplate>
              <tr>
                <td><%# Eval("PlanID") %></td>
                <td><%# Eval("Name") %></td>
                <td><%# Eval("Price", "{0:C}") %></td>
                <td><%# Eval("SMSOffered") %></td>
                <td><%# Eval("MinutesOffered") %></td>
                <td><%# Eval("DataOffered") %></td>
                <td><%# Eval("Description") %></td>
              </tr>
            </ItemTemplate>
          </asp:Repeater>
        </tbody>
      </table>
    </section>

    <!-- Section 2: Unsubscribed Plans -->
    <section id="unsubscribedPlansSection">
      <h2>Unsubscribed Plans</h2>
      <form id="unsubscribedPlansForm" runat="server">
        <label for="txtMobileNumber">Enter Mobile Number:</label>
        <input type="text" id="txtMobileNumber" runat="server" placeholder="Mobile Number" />
        <asp:Button ID="btnFetchUnsubscribedPlans" runat="server" Text="Fetch Plans" OnClick="btnFetchUnsubscribedPlans_Click" />

        <div id="results">
          <asp:Repeater ID="unsubscribedPlansRepeater" runat="server">
            <HeaderTemplate>
              <table>
                <thead>
                  <tr>
                    <th>Plan ID</th>
                    <th>Plan Name</th>
                    <th>Price</th>
                    <th>SMS Offered</th>
                    <th>Minutes Offered</th>
                    <th>Data Offered</th>
                    <th>Description</th>
                  </tr>
                </thead>
                <tbody>
            </HeaderTemplate>
            <ItemTemplate>
              <tr>
                <td><%# Eval("PlanID") %></td>
                <td><%# Eval("PlanName") %></td>
                <td><%# Eval("Price", "{0:C}") %></td>
                <td><%# Eval("SMSOffered") %></td>
                <td><%# Eval("MinutesOffered") %></td>
                <td><%# Eval("DataOffered") %></td>
                <td><%# Eval("Description") %></td>
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
    </section>
  </main>

  <!-- Footer -->
  <footer>
    <p>&copy; 2023 Telecommunication</p>
  </footer>
</body>
</html>
