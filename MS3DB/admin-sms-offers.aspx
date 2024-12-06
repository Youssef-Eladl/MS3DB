<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin-sms-offers.aspx.cs" Inherits="MS3DB.Pages.admin_sms_offers" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <title>Telecommunication - SMS Offers</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Additional styles for SMS Offers page */
        .sms-offers {
            padding: 20px;
        }
        .sms-offers h1 {
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
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .filter-form button:hover {
            background-color: #0056b3;
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
            td:nth-of-type(1):before { content: "Offer ID"; }
            td:nth-of-type(2):before { content: "Benefit Description"; }
            td:nth-of-type(3):before { content: "SMS Offered"; }
            td:nth-of-type(4):before { content: "Internet Offered"; }
            td:nth-of-type(5):before { content: "Minutes Offered"; }
            td:nth-of-type(6):before { content: "Validity Date"; }
            td:nth-of-type(7):before { content: "Status"; }
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
                <li><a href="admin-sms-offers.aspx">SMS Offers</a></li>
                <!-- ... -->
            </ul>
        </nav>
    </header>

    <!-- Main Content -->
    <main>
        <section class="sms-offers">
            <h1>List SMS Offers by Account</h1>

            <!-- Filter Form -->
            <div class="filter-form">
                <form id="smsOffersForm" method="post" runat="server">
                    <label for="mobileNo">Mobile Number:</label>
                    <asp:TextBox ID="mobileNo" runat="server" MaxLength="11" required="true"></asp:TextBox>

                    <asp:Button ID="filterButton" runat="server" Text="View SMS Offers" OnClick="ViewSMSOffers" />
                </form>
            </div>

            <!-- Error Message -->
            <div class="error-message" id="errorMessage" runat="server">
                No SMS offers found for the provided account.
            </div>

            <table id="smsOffersTable">
                <thead>
                    <tr>
                        <th>Offer ID</th>
                        <th>Benefit Description</th>
                        <th>SMS Offered</th>
                        <th>Internet Offered</th>
                        <th>Minutes Offered</th>
                        <th>Validity Date</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="smsOffersRepeater" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("OfferID") %></td>
                                <td><%# Eval("BenefitDescription") %></td>
                                <td><%# Eval("SMSOffered") %></td>
                                <td><%# Eval("InternetOffered") %></td>
                                <td><%# Eval("MinutesOffered") %></td>
                                <td><%# Eval("ValidityDate") %></td>
                                <td><%# Eval("Status") %></td>
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
