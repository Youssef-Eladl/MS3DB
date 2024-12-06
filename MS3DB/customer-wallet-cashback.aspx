<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customer-wallet-cashback.aspx.cs" Inherits="MS3DB.customer_wallet_cashback" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Telecommunication - Wallet Cashback Transactions</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        .cashback-container {
            width: 80%;
            margin: 20px auto;
        }

        .cashback-container form {
            display: flex;
            flex-direction: column;
            max-width: 400px;
            margin-bottom: 20px;
        }

        .cashback-container label {
            margin-bottom: 5px;
            font-weight: bold;
        }

        .cashback-container input {
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .cashback-container button {
            padding: 10px;
            background-color: #007BFF;
            border: none;
            color: #fff;
            font-size: 16px;
            border-radius: 3px;
            cursor: pointer;
        }

        .cashback-container button:hover {
            background-color: #0056b3;
        }

        .cashback-result {
            margin-top: 20px;
            font-size: 18px;
        }

        .cashback-result table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .cashback-result th, .cashback-result td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }

        .cashback-result th {
            background-color: #f2f2f2;
            font-size: 18px;
        }

        .cashback-result tr:hover {
            background-color: #f1f1f1;
        }

        .back-link {
            margin-top: 20px;
        }

        .back-link a {
            text-decoration: none;
            color: #007BFF;
            font-weight: bold;
        }

        .back-link a:hover {
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            .cashback-container form {
                max-width: 100%;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header>
        <nav>
            <a href="customer-dashboard.html" class="logo">Telecommunication</a>
            <ul class="nav-links">
                <li><a href="logout.html">Logout</a></li>
            </ul>
        </nav>
    </header>

    <!-- Main Content -->
    <main>
        <h1>Wallet Cashback Transactions</h1>
        <div class="cashback-container">
            <form id="cashback-form">
                <label for="national-id">Customer National ID:</label>
                <input type="text" id="national-id" name="national-id" required>

                <button type="submit">View Cashback Transactions</button>
            </form>
            <div class="cashback-result" id="cashback-result"></div>
            <div class="back-link">
                <a href="customer-dashboard.html">← Back to Dashboard</a>
            </div>
        </div>
    </main>

    <!-- Footer -->
    <footer>
        <p>&copy; 2023 Telecommunication</p>
    </footer>

    <script>
        document.getElementById('cashback-form').addEventListener('submit', function(event) {
            event.preventDefault();
            const nationalId = document.getElementById('national-id').value;

            // Placeholder for fetching cashback transactions
            // Replace '/api/get-cashback-transactions' with actual endpoint
            fetch('/api/get-cashback-transactions', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ nationalId })
            })
            .then(response => response.json())
            .then(data => {
                if(data.success && data.cashbacks.length > 0){
                    let table = `
                        <table>
                            <thead>
                                <tr>
                                    <th>Cashback ID</th>
                                    <th>Benefit ID</th>
                                    <th>Wallet ID</th>
                                    <th>Amount</th>
                                    <th>Credit Date</th>
                                </tr>
                            </thead>
                            <tbody>
                    `;
                    data.cashbacks.forEach(cashback => {
                        table += `
                            <tr>
                                <td>${cashback.cashbackID}</td>
                                <td>${cashback.benefitID}</td>
                                <td>${cashback.walletID}</td>
                                <td>$${cashback.amount}</td>
                                <td>${cashback.credit_date}</td>
                            </tr>
                        `;
                    });
                    table += `
                            </tbody>
                        </table>
                    `;
                    document.getElementById('cashback-result').innerHTML = table;
                } else {
                    document.getElementById('cashback-result').innerHTML = '<p>No cashback transactions found for this customer.</p>';
                }
            })
            .catch(error => {
                console.error('Error:', error);
                document.getElementById('cashback-result').innerHTML = '<p>An error occurred while fetching data.</p>';
            });
        });
    </script>
</body>
</html>
