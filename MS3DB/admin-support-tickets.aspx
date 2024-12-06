<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin-support-tickets.aspx.cs" Inherits="MS3DB.Pages.admin_support_tickets" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Telecommunication - Support Tickets</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Additional styles specific to Support Tickets page */

        .support-tickets {
            padding: 20px;
        }

        .support-tickets h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
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
            td:nth-of-type(1):before { content: "Ticket ID"; }
            td:nth-of-type(2):before { content: "Mobile No"; }
            td:nth-of-type(3):before { content: "Issue Description"; }
            td:nth-of-type(4):before { content: "Priority Level"; }
            td:nth-of-type(5):before { content: "Status"; }
        }
    </style>
</head>
<body>

   <!-- Header -->
   <header>
    <nav>
      <a href="admin-dashboard.aspx" class="logo">Telecommunication</a>
      <ul class="nav-links">
        <!-- Navigation links -->
        <li><a href="admin-dashboard.aspx">Dashboard</a></li>
        <!-- ... -->
        <li><a href="admin-support-tickets.aspx">Support Tickets</a></li>
        <!-- ... -->
      </ul>
    </nav>
  </header>

    <!-- Main Content -->
    <main>
        <section class="support-tickets">
            <h1>Resolved Support Tickets</h1>
               <table id="resolvedTicketsTable">
                <thead>
                    <tr>
                        <th>Mobile No</th>
                        <th>Issue Description</th>
                        <th>Priority Level</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="resolvedTicketsRepeater" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("MobileNo") %></td>
                                <td><%# Eval("IssueDescription") %></td>
                                <td><%# Eval("PriorityLevel") %></td>
                                <td><%# Eval("Status") %></td>
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