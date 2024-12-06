<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customer-recharge.aspx.cs" Inherits="MS3DB.customer_recharge" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Telecommunication - Recharge Balance</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        .recharge-container {
            width: 80%;
            margin: 20px auto;
        }

        .recharge-container form {
            display: flex;
            flex-direction: column;
            max-width: 400px;
            margin-bottom: 20px;
        }

        .recharge-container label {
            margin-bottom: 5px;
            font-weight: bold;
        }

        .recharge-container input, .recharge-container select {
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .recharge-container button {
            padding: 10px;
            background-color: #007bff;
            border: none;
            color: #fff;
            font-size: 16px;
            border-radius: 3px;
            cursor: pointer;
        }

        .recharge-container button:hover {
            background-color: #0069d9;
        }

        .recharge-result {
            margin-top: 20px;
            font-size: 18px;
        }

        .recharge-result table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .recharge-result th, .recharge-result td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }

        .recharge-result th {
            background-color: #f2f2f2;
            font-size: 18px;
        }

        .recharge-result tr:hover {
            background-color: #f1f1f1;
        }

        .back-link {
            margin-top: 20px;
            text-align: center;
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
            .recharge-container form {
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
        <h1>Recharge Balance</h1>
        <div class="recharge-container">
            <form id="recharge-form">
                <label for="mobile-no">Customer Mobile Number:</label>
                <input type="text" id="mobile-no" name="mobile-no" required pattern="\d{11}" title="Enter an 11-digit mobile number">

                <label for="payment-method">Payment Method:</label>
                <select id="payment-method" name="payment-method" required>
                    <option value="">Select Payment Method</option>
                    <option value="cash">Cash</option>
                    <option value="credit">Credit</option>
                </select>

                <label for="amount">Payment Amount ($):</label>
                <input type="number" id="amount" name="amount" step="0.01" required>

                <button type="submit">Recharge</button>
            </form>
            <div class="recharge-result" id="recharge-result"></div>
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
        document.getElementById('recharge-form').addEventListener('submit', function(event) {
            event.preventDefault();
            const mobileNo = document.getElementById('mobile-no').value;
            const paymentMethod = document.getElementById('payment-method').value;
            const amount = document.getElementById('amount').value;

            // Recharge the balance
            fetch('/api/recharge-balance', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ mobileNo, paymentMethod, amount })
            })
            .then(response => response.json())
            .then(data => {
                if(data.success){
                    let table = `
                        <table>
                            <thead>
                                <tr>
                                    <th>Mobile Number</th>
                                    <th>Payment Method</th>
                                    <th>Amount Paid ($)</th>
                                    <th>Recharge Date</th>
                                    <th>New Balance ($)</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>${data.recharge.mobileNo}</td>
                                    <td>${data.recharge.paymentMethod}</td>
                                    <td>$${data.recharge.amount}</td>
                                    <td>${data.recharge.recharge_date}</td>
                                    <td>$${data.recharge.new_balance}</td>
                                    <td>${data.recharge.status}</td>
                                </tr>
                            </tbody>
                        </table>
                    `;
                    document.getElementById('recharge-result').innerHTML = table;
                } else {
                    document.getElementById('recharge-result').innerHTML = `<p>${data.message}</p>`;
                }
            })
            .catch(error => {
                console.error('Error:', error);
                document.getElementById('recharge-result').innerHTML = '<p>An error occurred while processing your request.</p>';
            });
        });
    </script>
</body>
</html>