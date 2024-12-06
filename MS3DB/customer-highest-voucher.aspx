<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customer-highest-voucher.aspx.cs" Inherits="MS3DB.customer_highest_voucher" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Telecommunication - Highest Voucher</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        .voucher-container {
            width: 80%;
            margin: 20px auto;
        }

        .voucher-container form {
            display: flex;
            flex-direction: column;
            max-width: 400px;
            margin-bottom: 20px;
        }

        .voucher-container label {
            margin-bottom: 5px;
            font-weight: bold;
        }

        .voucher-container input {
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .voucher-container button {
            padding: 10px;
            background-color: #28a745;
            border: none;
            color: #fff;
            font-size: 16px;
            border-radius: 3px;
            cursor: pointer;
        }

        .voucher-container button:hover {
            background-color: #218838;
        }

        .voucher-result {
            margin-top: 20px;
            font-size: 18px;
        }

        .voucher-result table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .voucher-result th, .voucher-result td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }

        .voucher-result th {
            background-color: #f2f2f2;
            font-size: 18px;
        }

        .voucher-result tr:hover {
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
            .voucher-container form {
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
        <h1>Highest Voucher</h1>
        <div class="voucher-container">
            <form id="voucher-form">
                <label for="mobile-no">Customer Mobile Number:</label>
                <input type="text" id="mobile-no" name="mobile-no" required>

                <button type="submit">View Highest Voucher</button>
            </form>
            <div class="voucher-result" id="voucher-result"></div>
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
        document.getElementById('voucher-form').addEventListener('submit', function(event) {
            event.preventDefault();
            const mobileNo = document.getElementById('mobile-no').value;

            // Fetch the highest voucher
            fetch('/api/get-highest-voucher', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ mobileNo })
            })
            .then(response => response.json())
            .then(data => {
                if(data.success && data.voucher){
                    let table = `
                        <table>
                            <thead>
                                <tr>
                                    <th>Voucher ID</th>
                                    <th>Value</th>
                                    <th>Expiry Date</th>
                                    <th>Redeem Date</th>
                                    <th>Shop ID</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>${data.voucher.voucherID}</td>
                                    <td>${data.voucher.value}</td>
                                    <td>${data.voucher.expiry_date}</td>
                                    <td>${data.voucher.redeem_date || 'N/A'}</td>
                                    <td>${data.voucher.shopID}</td>
                                </tr>
                            </tbody>
                        </table>
                    `;
                    document.getElementById('voucher-result').innerHTML = table;
                } else {
                    document.getElementById('voucher-result').innerHTML = '<p>No vouchers found for this customer.</p>';
                }
            })
            .catch(error => {
                console.error('Error:', error);
                document.getElementById('voucher-result').innerHTML = '<p>An error occurred while fetching data.</p>';
            });
        });
    </script>
</body>
</html>