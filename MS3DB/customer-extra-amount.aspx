<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customer-extra-amount.aspx.cs" Inherits="MS3DB.customer_extra_amount" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Telecommunication - Extra Amount</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        .extra-container {
            width: 80%;
            margin: 20px auto;
        }

        .extra-container form {
            display: flex;
            flex-direction: column;
            max-width: 400px;
            margin-bottom: 20px;
        }

        .extra-container label {
            margin-bottom: 5px;
            font-weight: bold;
        }

        .extra-container input {
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .extra-container button {
            padding: 10px;
            background-color: #ffc107;
            border: none;
            color: #fff;
            font-size: 16px;
            border-radius: 3px;
            cursor: pointer;
        }

        .extra-container button:hover {
            background-color: #e0a800;
        }

        .extra-result {
            margin-top: 20px;
            font-size: 18px;
        }

        .extra-result table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .extra-result th, .extra-result td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }

        .extra-result th {
            background-color: #f2f2f2;
            font-size: 18px;
        }

        .extra-result tr:hover {
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
            .extra-container form {
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
        <h1>Extra Amount for Last Payment</h1>
        <div class="extra-container">
            <form id="extra-form">
                <label for="mobile-no">Customer Mobile Number:</label>
                <input type="text" id="mobile-no" name="mobile-no" required>

                <label for="plan-id">Service Plan ID:</label>
                <input type="number" id="plan-id" name="plan-id" required>

                <button type="submit">View Extra Amount</button>
            </form>
            <div class="extra-result" id="extra-result"></div>
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
        document.getElementById('extra-form').addEventListener('submit', function(event) {
            event.preventDefault();
            const mobileNo = document.getElementById('mobile-no').value;
            const planId = document.getElementById('plan-id').value;

            // Fetch the extra amount
            fetch('/api/get-extra-amount', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ mobileNo, planId })
            })
            .then(response => response.json())
            .then(data => {
                if(data.success && data.extraAmount !== undefined){
                    let table = `
                        <table>
                            <thead>
                                <tr>
                                    <th>Mobile Number</th>
                                    <th>Plan ID</th>
                                    <th>Extra Amount</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>${mobileNo}</td>
                                    <td>${planId}</td>
                                    <td>$${data.extraAmount}</td>
                                </tr>
                            </tbody>
                        </table>
                    `;
                    document.getElementById('extra-result').innerHTML = table;
                } else {
                    document.getElementById('extra-result').innerHTML = '<p>No extra amount found for this payment.</p>';
                }
            })
            .catch(error => {
                console.error('Error:', error);
                document.getElementById('extra-result').innerHTML = '<p>An error occurred while fetching data.</p>';
            });
        });
    </script>
</body>
</html>