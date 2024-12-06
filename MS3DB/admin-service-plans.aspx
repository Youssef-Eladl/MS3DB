<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin-service-plans.aspx.cs" Inherits="MS3DB.Pages.admin_service_plans" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <title>Telecommunication - Service Plans</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Additional styles specific to Service Plans page */
        .service-plans {
            padding: 20px;
        }
        .service-plans h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        .filter-form {
            max-width: 500px;
            margin: 0 auto 20px auto;
            padding: 20px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .filter-form label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .filter-form input {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .filter-form button {
            padding: 10px 20px;
            background-color: #1877f2;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .filter-form button:hover {
            background-color: #166fe5;
        }
        /* Error Message Styles */
        .error-message {
            max-width: 500px;
            margin: 0 auto 20px auto;
            padding: 15px;
            background-color: #ffe6e6;
            border: 1px solid #ffcccc;
            border-radius: 5px;
            color: #cc0000;
            text-align: center;
            display: none; /* Hidden by default */
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
        /* Responsive Design */
        @media (max-width: 768px) {
            table, thead, tbody, th, td, tr { 
                display: block; 
            }
            th {
                position: absolute;
                top: -9999px;
                left: -9999px;
            }
            tr { border: 1px solid #ccc; margin-bottom: 5px; }
            td { 
                border: none;
                border-bottom: 1px solid #eee; 
                position: relative;
                padding-left: 50%; 
            }
            td:before { 
                position: absolute;
                top: 12px;
                left: 12px;
                width: 45%; 
                padding-right: 10px; 
                white-space: nowrap;
                font-weight: bold;
            }
            /* Label the data */
            td:nth-of-type(1):before { content: "Plan ID"; }
            td:nth-of-type(2):before { content: "Customer Name"; }
            td:nth-of-type(3):before { content: "Mobile No"; }
            td:nth-of-type(4):before { content: "Plan Name"; }
            td:nth-of-type(5):before { content: "Price"; }
            td:nth-of-type(6):before { content: "SMS Offered"; }
            td:nth-of-type(7):before { content: "Minutes Offered"; }
            td:nth-of-type(8):before { content: "Data Offered (MB)"; }
            td:nth-of-type(9):before { content: "Subscription Date"; }
            td:nth-of-type(10):before { content: "Subscription Status"; }
        }
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
                <li><a href="admin-service-plans.aspx">Service Plans</a></li>
                <!-- ... -->
            </ul>
        </nav>
    </header>

    <!-- Main Content -->
    <main>
        <section class="service-plans">
            <h1>Customers' Accounts and Subscribed Service Plans</h1>

            <!-- Filter Form -->
            <div class="filter-form">
                <form id="filterForm" method="post" runat="server" onsubmit="FilterServicePlans">
                    <label for="planId">Plan ID:</label>
                    <asp:TextBox ID="planId" runat="server"></asp:TextBox>

                    <label for="inputDate">Date:</label>
                    <asp:TextBox ID="inputDate" runat="server" TextMode="Date"></asp:TextBox>

                    <asp:Button ID="filterButton" runat="server" Text="Filter" OnClick="FilterServicePlans" />
                </form>
            </div>

            <!-- Error Message -->
            <div class="error-message" id="errorMessage">
                No customer accounts found matching the provided Plan ID and/or Date.
            </div>

            <!-- Service Plans Table -->
            <table id="servicePlansTable">
                <thead>
                    <tr>
                        <th>Plan ID</th>
                        <th>Customer Name</th>
                        <th>Mobile No</th>
                        <th>Plan Name</th>
                        <th>Price</th>
                        <th>SMS Offered</th>
                        <th>Minutes Offered</th>
                        <th>Data Offered (MB)</th>
                        <th>Subscription Date</th>
                        <th>Subscription Status</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="servicePlansRepeater" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("PlanID") %></td>
                                <td><%# Eval("CustomerName") %></td>
                                <td><%# Eval("MobileNo") %></td>
                                <td><%# Eval("PlanName") %></td>
                                <td><%# Eval("Price") %></td>
                                <td><%# Eval("SMSOffered") %></td>
                                <td><%# Eval("MinutesOffered") %></td>
                                <td><%# Eval("DataOffered") %></td>
                                <td><%# Eval("SubscriptionDate") %></td>
                                <td><%# Eval("SubscriptionStatus") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
            
            <!-- Usage Data Table -->
            <h2>Total Usage Data</h2>
            <table id="usageDataTable">
                <thead>
                    <tr>
                        <th>Plan Name</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Data Consumption (MB)</th>
                        <th>Minutes Used</th>
                        <th>SMS Sent</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="usageDataRepeater" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("PlanName") %></td>
                                <td><%# Eval("StartDate") %></td>
                                <td><%# Eval("EndDate") %></td>
                                <td><%# Eval("DataConsumption") %></td>
                                <td><%# Eval("MinutesUsed") %></td>
                                <td><%# Eval("SMSSent") %></td>
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
