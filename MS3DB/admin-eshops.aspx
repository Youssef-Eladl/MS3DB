<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin-eshops.aspx.cs" Inherits="MS3DB.Pages.admin_eshops" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <title>Telecommunication - E-Shops and Redeemed Vouchers</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Additional styles specific to E-Shops page */

        .eshops {
            padding: 20px;
        }

        .eshops h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:hover {background-color: #f5f5f5;}

        /* Responsive Design */
        @media (max-width: 768px) {
            table, thead, tbody, th, td, tr { 
                display: block; 
            }

            th {
                position: absolute;
                top: -9999px;
                left: -9999px;
            }

            tr { border: 1px solid #ccc; margin-bottom: 5px; }

            td { 
                border: none;
                border-bottom: 1px solid #eee; 
                position: relative;
                padding-left: 50%; 
            }

            td:before { 
                position: absolute;
                top: 12px;
                left: 12px;
                width: 45%; 
                padding-right: 10px; 
                white-space: nowrap;
                font-weight: bold;
            }

            /* Label the data */
            td:nth-of-type(1):before { content: "Shop ID"; }
            td:nth-of-type(2):before { content: "Shop Name"; }
            td:nth-of-type(3):before { content: "URL"; }
            td:nth-of-type(4):before { content: "Rating"; }
            td:nth-of-type(5):before { content: "Voucher ID"; }
            td:nth-of-type(6):before { content: "Voucher Value"; }
        }
    </style>
</head>
<body runat="server">

 <!-- Header -->
 <header>
    <nav>
      <a href="admin-dashboard.aspx" class="logo">Telecommunication</a>
      <ul class="nav-links">
        <!-- Navigation links -->
        <li><a href="admin-dashboard.aspx">Dashboard</a></li>
        <!-- ... -->
      </ul>
    </nav>
  </header>

    <!-- Main Content -->
    <main>
        <section class="eshops">
            <h1>E-Shops and Redeemed Vouchers</h1>

            <table id="eshopsTable">
                <thead>
                    <tr>
                        <th>Shop ID</th>
                        <th>Shop Name</th>
                        <th>URL</th>
                        <th>Rating</th>
                        <th>Voucher ID</th>
                        <th>Voucher Value</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="eshopsRepeater" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("ShopID") %></td>
                                <td><%# Eval("ShopName") %></td>
                                <td><a href="<%# Eval("URL") %>" target="_blank"><%# Eval("URL") %></a></td>
                                <td><%# Eval("Rating") %></td>
                                <td><%# Eval("VoucherID") %></td>
                                <td><%# Eval("Value") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </section>
    </main>

    <!-- Footer -->
    <footer>
        <p>&copy; 2023 Telecommunication</p>
    </footer>
</body>
</html>
