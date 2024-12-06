<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customer-get-cashback.aspx.cs" Inherits="MS3DB.customer_get_cashback" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Telecommunication - Get Cashback</title>
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
            background-color: #ffc107;
            border: none;
            color: #fff;
            font-size: 16px;
            border-radius: 3px;
            cursor: pointer;
        }

        .cashback-container button:hover {
            background-color: #e0a800;
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
        <h1>Get Cashback</h1>
        <div class="cashback-container">
            <form id="cashback-form">
                <label for="mobile-no">Customer Mobile Number:</label>
                <input type="text" id="mobile-no" name="mobile-no" required pattern="\d{11}" title="Enter an 11-digit mobile number">

                <label for="payment-id">Payment Transaction ID:</label>
                <input type="number" id="payment-id" name="payment-id" required>

                <label for="benefit-id">Benefit ID:</label>
                <input type="number" id="benefit-id" name="benefit-id" required>

                <button type="submit">Get Cashback Amount</button>
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
            const mobileNo = document.getElementById('mobile-no').value;
            const paymentId = document.getElementById('payment-id').value;
            const benefitId = document.getElementById('benefit-id').value;

            // Fetch the cashback amount
            fetch('/api/get-cashback', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ mobileNo, paymentId, benefitId })
            })
            .then(response => response.json())
            .then(data => {
                if(data.success){
                    let table = `
                        <table>
                            <thead>
                                <tr>
                                    <th>Customer Mobile</th>
                                    <th>Payment ID</th>
                                    <th>Benefit ID</th>
                                    <th>Cashback Amount ($)</th>
                                    <th>Credit Date</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>${data.cashback.mobileNo}</td>
                                    <td>${data.cashback.paymentID}</td>
                                    <td>${data.cashback.benefitID}</td>
                                    <td>$${data.cashback.amount}</td>
                                    <td>${data.cashback.credit_date}</td>
                                </tr>
                            </tbody>
                        </table>
                    `;
                    document.getElementById('cashback-result').innerHTML = table;
                } else {
                    document.getElementById('cashback-result').innerHTML = `<p>${data.message}</p>`;
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