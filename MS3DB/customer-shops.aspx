<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customer-shops.aspx.cs" Inherits="MS3DB.customer_shops" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Telecommunication - All Shops</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        .shops-container {
            width: 80%;
            margin: 20px auto;
        }

        .shops-container form {
            display: flex;
            flex-direction: column;
            max-width: 400px;
            margin-bottom: 20px;
        }

        .shops-container label {
            margin-bottom: 5px;
            font-weight: bold;
        }

        .shops-container input {
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .shops-container button {
            padding: 10px;
            background-color: #6c757d;
            border: none;
            color: #fff;
            font-size: 16px;
            border-radius: 3px;
            cursor: pointer;
        }

        .shops-container button:hover {
            background-color: #5a6268;
        }

        .shops-result {
            margin-top: 20px;
            font-size: 18px;
        }

        .shops-result table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .shops-result th, .shops-result td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }

        .shops-result th {
            background-color: #f2f2f2;
            font-size: 18px;
        }

        .shops-result tr:hover {
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
            .shops-container form {
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
        <h1>All Shops</h1>
        <div class="shops-container">
            <form id="shops-form">
                <label for="shop-category">Shop Category:</label>
                <input type="text" id="shop-category" name="shop-category" placeholder="e.g., Electronics" required>

                <button type="submit">View Shops</button>
            </form>
            <div class="shops-result" id="shops-result"></div>
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
        document.getElementById('shops-form').addEventListener('submit', function(event) {
            event.preventDefault();
            const category = document.getElementById('shop-category').value;

            // Fetch the shops by category
            fetch('/api/get-shops', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ category })
            })
            .then(response => response.json())
            .then(data => {
                if(data.success && data.shops.length > 0){
                    let table = `
                        <table>
                            <thead>
                                <tr>
                                    <th>Shop ID</th>
                                    <th>Name</th>
                                    <th>Category</th>
                                    <th>Address</th>
                                    <th>Working Hours</th>
                                    <th>URL</th>
                                    <th>Rating</th>
                                </tr>
                            </thead>
                            <tbody>
                    `;
                    data.shops.forEach(shop => {
                        table += `
                            <tr>
                                <td>${shop.shopID}</td>
                                <td>${shop.name}</td>
                                <td>${shop.Category}</td>
                                <td>${shop.address || 'N/A'}</td>
                                <td>${shop.working_hours || 'N/A'}</td>
                                <td>${shop.URL || 'N/A'}</td>
                                <td>${shop.rating || 'N/A'}</td>
                            </tr>
                        `;
                    });
                    table += `
                            </tbody>
                        </table>
                    `;
                    document.getElementById('shops-result').innerHTML = table;
                } else {
                    document.getElementById('shops-result').innerHTML = '<p>No shops found in this category.</p>';
                }
            })
            .catch(error => {
                console.error('Error:', error);
                document.getElementById('shops-result').innerHTML = '<p>An error occurred while fetching data.</p>';
            });
        });
    </script>
</body>
</html>