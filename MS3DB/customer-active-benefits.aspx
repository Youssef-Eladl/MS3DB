<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customer-active-benefits.aspx.cs" Inherits="MS3DB.customer_active_benefits" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Telecommunication - Active Benefits</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        .benefits-container {
            width: 80%;
            margin: 20px auto;
        }

        .benefits-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .benefits-list table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .benefits-list th, .benefits-list td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }

        .benefits-list th {
            background-color: #f2f2f2;
            font-size: 18px;
        }

        .benefits-list tr:hover {
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
            .benefits-container {
                width: 100%;
                padding: 0 10px;
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
        <h1>Active Benefits</h1>
        <div class="benefits-container">
            <div class="benefits-list" id="benefits-list">
                <!-- Benefits table will be inserted here -->
            </div>
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
        // Fetch active benefits on page load
        document.addEventListener('DOMContentLoaded', function() {
            fetch('/api/get-active-benefits')
                .then(response => response.json())
                .then(data => {
                    if(data.success && data.benefits.length > 0){
                        let table = `
                            <h2>List of Active Benefits</h2>
                            <table>
                                <thead>
                                    <tr>
                                        <th>Benefit ID</th>
                                        <th>Description</th>
                                        <th>Validity Date</th>
                                        <th>Status</th>
                                        <th>Mobile Number</th>
                                    </tr>
                                </thead>
                                <tbody>
                        `;
                        data.benefits.forEach(benefit => {
                            table += `
                                <tr>
                                    <td>${benefit.benefitID}</td>
                                    <td>${benefit.description}</td>
                                    <td>${benefit.validity_date}</td>
                                    <td>${benefit.status}</td>
                                    <td>${benefit.mobileNo}</td>
                                </tr>
                            `;
                        });
                        table += `
                                </tbody>
                            </table>
                        `;
                        document.getElementById('benefits-list').innerHTML = table;
                    } else {
                        document.getElementById('benefits-list').innerHTML = '<p>No active benefits found.</p>';
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    document.getElementById('benefits-list').innerHTML = '<p>An error occurred while fetching data.</p>';
                });
        });
    </script>
</body>
</html>