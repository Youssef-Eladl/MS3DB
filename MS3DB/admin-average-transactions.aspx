<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin-average-transactions.aspx.cs" Inherits="MS3DB.Pages.admin_average_transactions" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <title>Telecommunication - Average Transactions</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Additional styles specific to Average Transactions page */
        .average-transactions {
            padding: 20px;
        }

        .average-transactions h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .average-transactions form {
            max-width: 500px;
            margin: 0 auto;
            text-align: center;
        }

        .average-transactions input[type="number"],
        .average-transactions input[type="date"] {
            width: 80%;
            padding: 10px;
            margin-bottom: 10px;
            font-size: 16px;
        }

        .average-transactions button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #17a2b8;
            color: white;
            border: none;
            cursor: pointer;
        }

        .average-transactions button:hover {
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
                <li><a href="admin-dashboard.aspx">Dashboard</a></li>
                <!-- ... -->
            </ul>
        </nav>
    </header>

    <!-- Main Content -->
    <main>
        <section class="average-transactions">
            <h1>Average Sent Transaction Amounts</h1>
            <form id="averageForm" runat="server">
                <label for="walletID">Enter Wallet ID:</label><br>
                <asp:TextBox ID="walletID" runat="server" type="number" min="1" required="true"></asp:TextBox>
                <br><br>
                <label for="startDate">Start Date:</label><br>
                <asp:TextBox ID="startDate" runat="server" type="date" required="true"></asp:TextBox>
                <br><br>
                <label for="endDate">End Date:</label><br>
                <asp:TextBox ID="endDate" runat="server" type="date" required="true"></asp:TextBox>
                <br><br>
                <asp:Button ID="getAverageButton" runat="server" Text="Get Average Amount" OnClick="GetAverageAmount" />
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
