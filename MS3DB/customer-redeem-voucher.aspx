<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customer-redeem-voucher.aspx.cs" Inherits="MS3DB.customer_redeem_voucher" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Telecommunication - Redeem Voucher</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        .redeem-container {
            width: 80%;
            margin: 20px auto;
        }

        .redeem-container form {
            display: flex;
            flex-direction: column;
            max-width: 400px;
            margin-bottom: 20px;
        }

        .redeem-container label {
            margin-bottom: 5px;
            font-weight: bold;
        }

        .redeem-container input {
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .redeem-container button {
            padding: 10px;
            background-color: #28a745;
            border: none;
            color: #fff;
            font-size: 16px;
            border-radius: 3px;
            cursor: pointer;
        }

        .redeem-container button:hover {
            background-color: #218838;
        }

        .redeem-result {
            margin-top: 20px;
            font-size: 18px;
        }

        .redeem-result table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .redeem-result th, .redeem-result td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }

        .redeem-result th {
            background-color: #f2f2f2;
            font-size: 18px;
        }

        .redeem-result tr:hover {
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
            .redeem-container form {
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
        <h1>Redeem Voucher</h1>
        <div class="redeem-container">
            <form id="redeem-form">
                <label for="mobile-no">Customer Mobile Number:</label>
                <input type="text" id="mobile-no" name="mobile-no" required pattern="\d{11}" title="Enter an 11-digit mobile number">

                <label for="voucher-id">Voucher ID:</label>
                <input type="number" id="voucher-id" name="voucher-id" required>

                <button type="submit">Redeem Voucher</button>
            </form>
            <div class="redeem-result" id="redeem-result"></div>
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
        document.getElementById('redeem-form').addEventListener('submit', function(event) {
            event.preventDefault();
            const mobileNo = document.getElementById('mobile-no').value;
            const voucherId = document.getElementById('voucher-id').value;

            // Redeem the voucher
            fetch('/api/redeem-voucher', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ mobileNo, voucherId })
            })
            .then(response => response.json())
            .then(data => {
                if(data.success){
                    let table = `
                        <table>
                            <thead>
                                <tr>
                                    <th>Voucher ID</th>
                                    <th>Value ($)</th>
                                    <th>Expiry Date</th>
                                    <th>Redeem Date</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>${data.voucher.voucherID}</td>
                                    <td>$${data.voucher.value}</td>
                                    <td>${data.voucher.expiry_date}</td>
                                    <td>${data.voucher.redeem_date}</td>
                                    <td>${data.voucher.status}</td>
                                </tr>
                            </tbody>
                        </table>
                    `;
                    document.getElementById('redeem-result').innerHTML = table;
                } else {
                    document.getElementById('redeem-result').innerHTML = `<p>${data.message}</p>`;
                }
            })
            .catch(error => {
                console.error('Error:', error);
                document.getElementById('redeem-result').innerHTML = '<p>An error occurred while processing your request.</p>';
            });
        });
    </script>
</body>
</html>