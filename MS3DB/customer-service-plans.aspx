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
        <!-- ... -->
      </ul>
    </nav>
  </header>

  <!-- Main Content -->
  <main>
    <h1>Service Plans</h1>
    <!-- Content for viewing and selecting service plans -->


    
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
                                <td><%# Eval("Price") %></td>
                                <td><%# Eval("SMSOffered") %></td>
                                <td><%# Eval("MinutesOffered") %></td>
                                <td><%# Eval("DataOffered") %></td>
                                <td><%# Eval("Description") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>

        </main>


  <!-- Footer -->
  <footer>
    <p>&copy; 2023 Telecommunication</p>
  </footer>
</body>
</html>