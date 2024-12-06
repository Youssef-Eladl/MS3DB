<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customer-available-plans.aspx.cs" Inherits="MS3DB.customer_available_plans" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Telecommunication - Available Service Plans</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        .available-plans-container {
            width: 80%;
            margin: 20px auto;
        }

        .available-plans-container form {
            display: flex;
            flex-direction: column;
            max-width: 400px;
            margin-bottom: 20px;
        }

        .available-plans-container label {
            margin-bottom: 5px;
            font-weight: bold;
        }

        .available-plans-container input {
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .available-plans-container button {
            padding: 10px;
            background-color: #007BFF;
            border: none;
            color: #fff;
            font-size: 16px;
            border-radius: 3px;
            cursor: pointer;
        }

        .available-plans-container button:hover {
            background-color: #0056b3;
        }

        .plans-list {
            margin-top: 20px;
        }

        .plans-list table {
            width: 100%;
            border-collapse: collapse;
        }

        .plans-list th, .plans-list td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }

        .plans-list th {
            background-color: #f2f2f2;
            font-size: 18px;
        }

        .plans-list tr:hover {
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
        <h1>Available Service Plans</h1>
        <div class="available-plans-container">
            <form id="available-plans-form">
                <label for="mobile-number">Mobile Number:</label>
                <input type="text" id="mobile-number" name="mobile-number" required>

                <button type="submit">View Available Plans</button>
            </form>
            <div class="plans-list" id="plans-list"></div>
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
        document.getElementById('available-plans-form').addEventListener('submit', function(event) {
            event.preventDefault();
            const mobileNumber = document.getElementById('mobile-number').value;

            // Placeholder for fetching available plans
            // Replace '/api/get-available-plans' with actual endpoint
            fetch('/api/get-available-plans', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ mobileNumber })
            })
            .then(response => response.json())
            .then(data => {
                if(data.success && data.plans.length > 0){
                    let table = `
                        <table>
                            <thead>
                                <tr>
                                    <th>Plan ID</th>
                                    <th>Name</th>
                                    <th>Price</th>
                                    <th>SMS Offered</th>
                                    <th>Minutes Offered</th>
                                    <th>Data Offered</th>
                                    <th>Description</th>
                                </tr>
                            </thead>
                            <tbody>
                    `;
                    data.plans.forEach(plan => {
                        table += `
                            <tr>
                                <td>${plan.planID}</td>
                                <td>${plan.name}</td>
                                <td>$${plan.price}</td>
                                <td>${plan.SMS_offered}</td>
                                <td>${plan.minutes_offered}</td>
                                <td>${plan.data_offered} GB</td>
                                <td>${plan.description}</td>
                            </tr>
                        `;
                    });
                    table += `
                            </tbody>
                        </table>
                    `;
                    document.getElementById('plans-list').innerHTML = table;
                } else {
                    document.getElementById('plans-list').innerHTML = '<p>No available plans found.</p>';
                }
            })
            .catch(error => {
                console.error('Error:', error);
                document.getElementById('plans-list').innerHTML = '<p>An error occurred while fetching data.</p>';
            });
        });
    </script>
</body>
</html>