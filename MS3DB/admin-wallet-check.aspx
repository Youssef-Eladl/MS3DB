﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin-wallet-check.aspx.cs" Inherits="MS3DB.admin_wallet_check" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Telecommunication - Wallet Check</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Styles specific to Wallet Check page */
        .wallet-check {
            padding: 20px;
        }

        .wallet-check h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .wallet-check form {
            max-width: 500px;
            margin: 0 auto;
            text-align: center;
        }

        .wallet-check input[type="text"] {
            width: 80%;
            padding: 10px;
            margin-bottom: 10px;
            font-size: 16px;
        }

        .wallet-check button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #17a2b8;
            color: white;
            border: none;
            cursor: pointer;
        }

        .wallet-check button:hover {
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
                <!-- Other navigation links -->
                <li><a href="admin-dashboard.html">Dashboard</a></li>
                <!-- ... -->
            </ul>
        </nav>
    </header>

    <!-- Main Content -->
    <main>
        <section class="wallet-check">
            <h1>Check Wallet Link</h1>
            <form id="walletCheckForm">
                <label for="mobileNo">Enter Mobile Number:</label><br>
                <input type="text" id="mobileNo" name="mobileNo" pattern="\d{11}" required>
                <br><br>
                <button type="submit">Check Wallet Link</button>
            </form>

            <div class="result" id="result" style="display: none;">
                <p id="walletStatus"></p>
            </div>
            <div class="error-message" id="errorMessage" style="display: none;">
                Invalid mobile number or error occurred.
            </div>
        </section>
    </main>

    <!-- Footer -->
    <footer>
        <p>&copy; 2023 Telecommunication</p>
    </footer>

    <!-- JavaScript for form handling -->
    <script>
        document.getElementById('walletCheckForm').addEventListener('submit', function(event) {
            event.preventDefault();

            const mobileNo = document.getElementById('mobileNo').value.trim();

            // Validate mobile number
            if (!/^\d{11}$/.test(mobileNo)) {
                document.getElementById('errorMessage').style.display = 'block';
                document.getElementById('result').style.display = 'none';
                return;
            }

            // Hide error message and show loading
            document.getElementById('errorMessage').style.display = 'none';
            document.getElementById('result').style.display = 'none';

            // Send AJAX request to backend
            fetch(`process-wallet-check.aspx?mobileNo=${encodeURIComponent(mobileNo)}`, {
                method: 'GET'
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    document.getElementById('walletStatus').textContent = `Wallet Status: ${data.status}`;
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