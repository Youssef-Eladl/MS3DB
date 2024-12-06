<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin-cashback-transactions.aspx.cs" Inherits="MS3DB.Pages.admin_cashback_transactions" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <title>Telecommunication - Cashback Transactions</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Additional styles specific to Cashback Transactions page */
        .cashback-transactions {
            padding: 20px;
        }
        .cashback-transactions h1 {
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
            text-align: center;
        }
        .filter-form label {
            display: block;
            margin-bottom: 10px;
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
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
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
            td:nth-of-type(1):before { content: "Mobile No"; }
            td:nth-of-type(2):before { content: "Number of Transactions"; }
            td:nth-of-type(3):before { content: "Total Points Earned"; }
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
                <!-- ... -->
            </ul>
        </nav>
    </header>

    <!-- Main Content -->
    <main>
        <section class="cashback-transactions">
            <h1>Accepted Payment Transactions and Earned Points</h1>

            <div class="filter-form">
                <form id="filterForm" method="post" runat="server">
                    <label for="mobileNo">Mobile Number:</label>
                    <asp:TextBox ID="mobileNom" runat="server" required="true"></asp:TextBox>
                    <asp:Button ID="filterButton" runat="server" Text="Filter" OnClick="FilterTransactions" />
                </form>
            </div>

            <table id="cashbackTable">
                <thead>
                    <tr>
                        <th>Mobile No</th>
                        <th>Number of Transactions</th>
                        <th>Total Points Earned</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="transactionsRepeator" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("MobileNo") %></td>
                                <td><%# Eval("TransactionCount") %></td>
                                <td><%# Eval("TotalPoints") %></td>
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
