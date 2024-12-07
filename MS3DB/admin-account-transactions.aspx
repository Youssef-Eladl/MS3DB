﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin-account-transactions.aspx.cs" Inherits="MS3DB.admin_account_transactions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Telecommunication - Account Transactions</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Additional styles specific to Account Transactions page */
        .account-transactions {
            padding: 20px;
        }

        .account-transactions h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .account-transactions form {
            max-width: 500px;
            margin: 0 auto;
            text-align: center;
        }

        .account-transactions input[type="text"] {
            width: 80%;
            padding: 10px;
            margin-bottom: 10px;
            font-size: 16px;
        }

        .account-transactions button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #17a2b8;
            color: white;
            border: none;
            cursor: pointer;
        }

        .account-transactions button:hover {
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
<body>

    <!-- Header -->
    <header>
        <nav>
            <a href="admin-dashboard.html" class="logo">Telecommunication</a>
            <ul class="nav-links">
                <!-- Navigation links -->
                <li><a href="admin-dashboard.html">Dashboard</a></li>
            </ul>
        </nav>
    </header>

    <!-- Main Content -->
    <main>
        <section class="account-transactions">
            <h1>Account Transaction Summary</h1>
            <form id="transactionForm">
                <label for="mobileNo">Enter Mobile Number:</label><br>
                <input type="text" id="mobileNo" name="mobileNo" pattern="\d{11}" required>
                <br>
                <button type="submit">Get Summary</button>
            </form>

            <div class="result" id="result" style="display: none;">
                <p id="transactionCount"></p>
                <p id="earnedPoints"></p>
            </div>
            <div class="error-message" id="errorMessage" style="display: none;">
                Invalid mobile number or no records found.
            </div>
        </section>
    </main>

    <!-- Footer -->
    <footer>
        <p>&copy; 2023 Telecommunication</p>
    </footer>

    <!-- JavaScript for form handling -->
    <script>
        document.getElementById('transactionForm').addEventListener('submit', function(event) {
            event.preventDefault(); // Prevent form submission

            const mobileNo = document.getElementById('mobileNo').value.trim();

            // Validate mobile number (must be 11 digits)
            if (!/^\d{11}$/.test(mobileNo)) {
                document.getElementById('errorMessage').style.display = 'block';
                document.getElementById('result').style.display = 'none';
                return;
            }

            // Hide error message and show loading
            document.getElementById('errorMessage').style.display = 'none';
            document.getElementById('result').style.display = 'none';

            // Send AJAX request to backend
            fetch(`process-account-transactions.aspx?mobileNo=${encodeURIComponent(mobileNo)}`, {
                method: 'GET'
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    document.getElementById('transactionCount').textContent = `Number of Accepted Transactions in Last Year: ${data.transactionCount}`;
                    document.getElementById('earnedPoints').textContent = `Total Earned Points: ${data.earnedPoints}`;
                    document.getElementById('result').style.display = 'block';
                } else {
                    document.getElementById('errorMessage').style.display = 'block';
                    document.getElementById('result').style.display = 'none';
                }
            })
            .catch(error => {
                console.error('Error:', error);
                document.getElementById('errorMessage').style.display = 'block';
                document.getElementById('result').style.display = 'none';
            });
        });
    </script>
</body>
</html>