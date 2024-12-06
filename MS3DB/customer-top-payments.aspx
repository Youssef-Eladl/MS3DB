<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customer-top-payments.aspx.cs" Inherits="MS3DB.customer_top_payments" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Telecommunication - Top Payments</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        .top-payments-container {
            width: 80%;
            margin: 20px auto;
        }

        .top-payments-container form {
            display: flex;
            flex-direction: column;
            max-width: 400px;
            margin-bottom: 20px;
        }

        .top-payments-container label {
            margin-bottom: 5px;
            font-weight: bold;
        }

        .top-payments-container input {
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .top-payments-container button {
            padding: 10px;
            background-color: #007BFF;
            border: none;
            color: #fff;
            font-size: 16px;
            border-radius: 3px;
            cursor: pointer;
        }

        .top-payments-container button:hover {
            background-color: #0056b3;
        }

        .top-payments-result {
            margin-top: 20px;
            font-size: 18px;
        }

        .top-payments-result table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .top-payments-result th, .top-payments-result td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }

        .top-payments-result th {
            background-color: #f2f2f2;
            font-size: 18px;
        }

        .top-payments-result tr:hover {
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
            .top-payments-container form {
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
        <h1>Top 10 Successful Payments</h1>
        <div class="top-payments-container">
            <form id="top-payments-form">
                <label for="mobile-no">Customer Mobile Number:</label>
                <input type="text" id="mobile-no" name="mobile-no" required>

                <button type="submit">View Top Payments</button>
            </form>
            <div class="top-payments-result" id="top-payments-result"></div>
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
        document.getElementById('top-payments-form').addEventListener('submit', function(event) {
            event.preventDefault();
            const mobileNo = document.getElementById('mobile-no').value;

            // Fetch the top 10 payments
            fetch('/api/get-top-payments', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ mobileNo })
            })
            .then(response => response.json())
            .then(data => {
                if(data.success && data.payments.length > 0){
                    let table = `
                        <table>
                            <thead>
                                <tr>
                                    <th>Payment ID</th>
                                    <th>Amount</th>
                                    <th>Date of Payment</th>
                                    <th>Payment Method</th>
                                </tr>
                            </thead>
                            <tbody>
                    `;
                    data.payments.forEach(payment => {
                        table += `
                            <tr>
                                <td>${payment.paymentID}</td>
                                <td>$${payment.amount}</td>
                                <td>${payment.date_of_payment}</td>
                                <td>${payment.payment_method}</td>
                            </tr>
                        `;
                    });
                    table += `
                            </tbody>
                        </table>
                    `;
                    document.getElementById('top-payments-result').innerHTML = table;
                } else {
                    document.getElementById('top-payments-result').innerHTML = '<p>No successful payments found for this customer.</p>';
                }
            })
            .catch(error => {
                console.error('Error:', error);
                document.getElementById('top-payments-result').innerHTML = '<p>An error occurred while fetching data.</p>';
            });
        });
    </script>
</body>
</html>