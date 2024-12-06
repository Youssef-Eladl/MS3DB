<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customer-open-support-tickets.aspx.cs" Inherits="MS3DB.customer_open_support_tickets" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Telecommunication - Open Support Tickets</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        .tickets-container {
            width: 80%;
            margin: 20px auto;
        }

        .tickets-container form {
            display: flex;
            flex-direction: column;
            max-width: 400px;
            margin-bottom: 20px;
        }

        .tickets-container label {
            margin-bottom: 5px;
            font-weight: bold;
        }

        .tickets-container input {
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .tickets-container button {
            padding: 10px;
            background-color: #007BFF;
            border: none;
            color: #fff;
            font-size: 16px;
            border-radius: 3px;
            cursor: pointer;
        }

        .tickets-container button:hover {
            background-color: #0056b3;
        }

        .tickets-result {
            margin-top: 20px;
            font-size: 18px;
        }

        .tickets-result table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .tickets-result th, .tickets-result td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }

        .tickets-result th {
            background-color: #f2f2f2;
            font-size: 18px;
        }

        .tickets-result tr:hover {
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
            .tickets-container form {
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
        <h1>Open Support Tickets</h1>
        <div class="tickets-container">
            <form id="tickets-form">
                <label for="national-id">Customer National ID:</label>
                <input type="text" id="national-id" name="national-id" required>

                <button type="submit">View Open Tickets</button>
            </form>
            <div class="tickets-result" id="tickets-result"></div>
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
        document.getElementById('tickets-form').addEventListener('submit', function(event) {
            event.preventDefault();
            const nationalId = document.getElementById('national-id').value;

            // Placeholder for fetching open support tickets
            // Replace '/api/get-open-support-tickets' with actual endpoint
            fetch('/api/get-open-support-tickets', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ nationalId })
            })
            .then(response => response.json())
            .then(data => {
                if(data.success && data.tickets.length > 0){
                    let table = `
                        <table>
                            <thead>
                                <tr>
                                    <th>Mobile Number</th>
                                    <th>Open Tickets Count</th>
                                </tr>
                            </thead>
                            <tbody>
                    `;
                    data.tickets.forEach(ticket => {
                        table += `
                            <tr>
                                <td>${ticket.mobileNo}</td>
                                <td>${ticket.openTickets}</td>
                            </tr>
                        `;
                    });
                    table += `
                            </tbody>
                        </table>
                    `;
                    document.getElementById('tickets-result').innerHTML = table;
                } else {
                    document.getElementById('tickets-result').innerHTML = '<p>No open support tickets found for this customer.</p>';
                }
            })
            .catch(error => {
                console.error('Error:', error);
                document.getElementById('tickets-result').innerHTML = '<p>An error occurred while fetching data.</p>';
            });
        });
    </script>
</body>
</html>