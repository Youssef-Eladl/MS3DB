<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customer-subscriptions.aspx.cs" Inherits="MS3DB.customer_subscriptions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Telecommunication - Subscribed Plans</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        .subscriptions-container {
            width: 80%;
            margin: 20px auto;
        }

        .subscriptions-container form {
            display: flex;
            flex-direction: column;
            max-width: 400px;
            margin-bottom: 20px;
        }

        .subscriptions-container label {
            margin-bottom: 5px;
            font-weight: bold;
        }

        .subscriptions-container input {
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .subscriptions-container button {
            padding: 10px;
            background-color: #28a745;
            border: none;
            color: #fff;
            font-size: 16px;
            border-radius: 3px;
            cursor: pointer;
        }

        .subscriptions-container button:hover {
            background-color: #218838;
        }

        .subscriptions-result {
            margin-top: 20px;
            font-size: 18px;
        }

        .subscriptions-result table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .subscriptions-result th, .subscriptions-result td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }

        .subscriptions-result th {
            background-color: #f2f2f2;
            font-size: 18px;
        }

        .subscriptions-result tr:hover {
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
            .subscriptions-container form {
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
        <h1>Subscribed Service Plans (Last 5 Months)</h1>
        <div class="subscriptions-container">
            <form id="subscriptions-form">
                <label for="mobile-no">Customer Mobile Number:</label>
                <input type="text" id="mobile-no" name="mobile-no" required pattern="\d{11}" title="Enter an 11-digit mobile number">
                
                <button type="submit">View Subscribed Plans</button>
            </form>
            <div class="subscriptions-result" id="subscriptions-result"></div>
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
        document.getElementById('subscriptions-form').addEventListener('submit', function(event) {
            event.preventDefault();
            const mobileNo = document.getElementById('mobile-no').value;

            // Fetch the subscribed plans
            fetch('/api/get-subscriptions', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ mobileNo })
            })
            .then(response => response.json())
            .then(data => {
                if(data.success && data.subscriptions.length > 0){
                    let table = `
                        <table>
                            <thead>
                                <tr>
                                    <th>Plan ID</th>
                                    <th>Plan Name</th>
                                    <th>Price</th>
                                    <th>SMS Offered</th>
                                    <th>Minutes Offered</th>
                                    <th>Data Offered (MB)</th>
                                    <th>Subscription Date</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                    `;
                    data.subscriptions.forEach(plan => {
                        table += `
                            <tr>
                                <td>${plan.planID}</td>
                                <td>${plan.name}</td>
                                <td>$${plan.price}</td>
                                <td>${plan.SMS_offered}</td>
                                <td>${plan.minutes_offered}</td>
                                <td>${plan.data_offered}</td>
                                <td>${plan.subscription_date}</td>
                                <td>${plan.status}</td>
                            </tr>
                        `;
                    });
                    table += `
                            </tbody>
                        </table>
                    `;
                    document.getElementById('subscriptions-result').innerHTML = table;
                } else {
                    document.getElementById('subscriptions-result').innerHTML = '<p>No subscriptions found in the last 5 months.</p>';
                }
            })
            .catch(error => {
                console.error('Error:', error);
                document.getElementById('subscriptions-result').innerHTML = '<p>An error occurred while fetching data.</p>';
            });
        });
    </script>
</body>
</html>