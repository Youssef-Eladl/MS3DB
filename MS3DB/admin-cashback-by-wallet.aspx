<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin-cashback-by-wallet.aspx.cs" Inherits="MS3DB.Pages.admin_cashback_by_wallet" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <title>Telecommunication - Cashback Amount</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Additional styles specific to Cashback Amount page */

        .cashback-amount {
            padding: 20px;
        }

        .cashback-amount h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .cashback-amount form {
            max-width: 500px;
            margin: 0 auto;
            text-align: center;
        }

        .cashback-amount input[type="number"] {
            width: 80%;
            padding: 10px;
            margin-bottom: 10px;
            font-size: 16px;
        }

        .cashback-amount button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #17a2b8;
            color: white;
            border: none;
            cursor: pointer;
        }

        .cashback-amount button:hover {
            background-color: #138496;
        }

        .result {
            max-width: 600px;
            margin: 20px auto;
            text-align: center;
        }

        .result p {
            font-size: 18px;
            color: #333;
        }

        .error-message {
            color: red;
            font-weight: bold;
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
        <section class="cashback-amount">
            <h1>View Cashback Amount</h1>
            <form id="cashbackForm" runat="server">
                <label for="walletID">Enter Wallet ID:</label><br>
                <asp:TextBox ID="walletID" runat="server" type="number" min="1" required="true"></asp:TextBox>
                <br><br>
                <label for="planID">Enter Plan ID:</label><br>
                <asp:TextBox ID="planID" runat="server" type="number" min="1" required="true"></asp:TextBox>
                <br><br>
                <asp:Button ID="getCashbackButton" runat="server" Text="Get Cashback Amount" OnClick="GetCashbackAmount" />
            </form>

            <div class="result">
                <asp:Label ID="resultLabel" runat="server" Text="" Visible="false"></asp:Label>
            </div>
            <div class="error-message">
                <asp:Label ID="errorMessage" runat="server" Text="" Visible="false"></asp:Label>
            </div>
        </section>
    </main>

    <!-- Footer -->
    <footer>
        <p>&copy; 2023 Telecommunication</p>
    </footer>
</body>
</html>
