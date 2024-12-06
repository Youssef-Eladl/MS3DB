<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customer-view-consumption.aspx.cs" Inherits="MS3DB.customer_view_consumption" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Telecommunication - View Consumption</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        .consumption-container {
            width: 80%;
            margin: 20px auto;
        }

        .consumption-container form {
            display: flex;
            flex-direction: column;
            max-width: 400px;
            margin-bottom: 20px;
        }

        .consumption-container label {
            margin-bottom: 5px;
            font-weight: bold;
        }

        .consumption-container input {
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .consumption-container button {
            padding: 10px;
            background-color: #007BFF;
            border: none;
            color: #fff;
            font-size: 16px;
            border-radius: 3px;
            cursor: pointer;
        }

        .consumption-container button:hover {
            background-color: #0056b3;
        }

        .result {
            margin-top: 20px;
            font-size: 18px;
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
        <h1>View Consumption</h1>
        <div class="consumption-container">
            <form id="consumption-form">
                <label for="plan-name">Plan Name:</label>
                <input type="text" id="plan-name" name="plan-name" required>

                <label for="start-date">Start Date:</label>
                <input type="date" id="start-date" name="start-date" required>

                <label for="end-date">End Date:</label>
                <input type="date" id="end-date" name="end-date" required>

                <button type="submit">View Consumption</button>
            </form>
            <div class="result" id="result"></div>
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
        document.getElementById('consumption-form').addEventListener('submit', function(event) {
            event.preventDefault();
            const planName = document.getElementById('plan-name').value;
            const startDate = document.getElementById('start-date').value;
            const endDate = document.getElementById('end-date').value;

            // Placeholder for fetching consumption data
            // Replace '/api/get-consumption' with actual endpoint
            fetch('/api/get-consumption', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ planName, startDate, endDate })
            })
            .then(response => response.json())
            .then(data => {
                if(data.success){
                    document.getElementById('result').innerHTML = `
                        <p>Total SMS Consumed: ${data.sms}</p>
                        <p>Total Minutes Used: ${data.minutes}</p>
                        <p>Total Internet Used: ${data.internet} MB</p>
                    `;
                } else {
                    document.getElementById('result').textContent = 'No data found for the given inputs.';
                }
            })
            .catch(error => {
                console.error('Error:', error);
                document.getElementById('result').textContent = 'An error occurred while fetching data.';
            });
        });
    </script>
</body>
</html>