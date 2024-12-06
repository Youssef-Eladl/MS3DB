<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customer-remaining-amount.aspx.cs" Inherits="MS3DB.customer_remaining_amount" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Telecommunication - Remaining Amount</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        .remaining-container {
            width: 80%;
            margin: 20px auto;
        }

        .remaining-container form {
            display: flex;
            flex-direction: column;
            max-width: 400px;
            margin-bottom: 20px;
        }

        .remaining-container label {
            margin-bottom: 5px;
            font-weight: bold;
        }

        .remaining-container input {
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .remaining-container button {
            padding: 10px;
            background-color: #17a2b8;
            border: none;
            color: #fff;
            font-size: 16px;
            border-radius: 3px;
            cursor: pointer;
        }

        .remaining-container button:hover {
            background-color: #138496;
        }

        .remaining-result {
            margin-top: 20px;
            font-size: 18px;
        }

        .remaining-result table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .remaining-result th, .remaining-result td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }

        .remaining-result th {
            background-color: #f2f2f2;
            font-size: 18px;
        }

        .remaining-result tr:hover {
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
            .remaining-container form {
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
        <h1>Remaining Amount for Last Payment</h1>
        <div class="remaining-container">
            <form id="remaining-form">
                <label for="mobile-no">Customer Mobile Number:</label>
                <input type="text" id="mobile-no" name="mobile-no" required>

                <label for="plan-id">Service Plan ID:</label>
                <input type="number" id="plan-id" name="plan-id" required>

                <button type="submit">View Remaining Amount</button>
            </form>
            <div class="remaining-result" id="remaining-result"></div>
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
        document.getElementById('remaining-form').addEventListener('submit', function(event) {
            event.preventDefault();
            const mobileNo = document.getElementById('mobile-no').value;
            const planId = document.getElementById('plan-id').value;

            // Fetch the remaining amount
            fetch('/api/get-remaining-amount', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ mobileNo, planId })
            })
            .then(response => response.json())
            .then(data => {
                if(data.success && data.remainingAmount !== undefined){
                    let table = `
                        <table>
                            <thead>
                                <tr>
                                    <th>Mobile Number</th>
                                    <th>Plan ID</th>
                                    <th>Remaining Amount</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>${mobileNo}</td>
                                    <td>${planId}</td>
                                    <td>$${data.remainingAmount}</td>
                                </tr>
                            </tbody>
                        </table>
                    `;
                    document.getElementById('remaining-result').innerHTML = table;
                } else {
                    document.getElementById('remaining-result').innerHTML = '<p>No remaining amount found for this payment.</p>';
                }
            })
            .catch(error => {
                console.error('Error:', error);
                document.getElementById('remaining-result').innerHTML = '<p>An error occurred while fetching data.</p>';
            });
        });
    </script>
</body>
</html>