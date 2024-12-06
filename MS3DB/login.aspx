<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="MS3DB.Pages.Login" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <title>Telecommunication - Login</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Additional styles specific to login.aspx */
        .login-container {
            max-width: 400px;
            margin: 100px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .login-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 1rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
        }

        input:hover, input:focus {
            border-color: #1877f2;
            outline: none;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #1877f2;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #166fe5;
        }

        /* Feedback message styling */
        #feedback {
            color: red;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body runat="server">
    <!-- Top Navigation -->
    <nav class="top-nav" id="topNav">
        <div class="nav-wrapper">
            <a href="login.aspx" class="nav-link" onclick="setUserType('consumer')">Consumer</a>
            <a href="login.aspx" class="nav-link" onclick="setUserType('admin')">Admin</a>
        </div>
    </nav>

    <!-- Main Header -->
    <header runat="server">
        <nav runat="server">
            <a href="index.aspx" class="logo">Telecommunication</a>
            <ul class="nav-links">
                <li><a href="index.aspx">Home</a></li>
                <li><a href="faq.aspx">FAQ</a></li>
                <li><a href="contact.aspx">Contact Us</a></li>
                <li><a href="login.aspx">Login</a></li>
            </ul>
        </nav>
    </header>

    <!-- Login Section -->
    <div class="login-container" runat="server">
        <h2>Login</h2>
        <form id="loginForm" runat="server">
            <asp:TextBox ID="username" runat="server" placeholder="Username" CssClass="input" required="required"></asp:TextBox>
            <asp:TextBox ID="password" runat="server" TextMode="Password" placeholder="Password" CssClass="input" required="required"></asp:TextBox>
            <asp:Button ID="submitButton" runat="server" Text="Login" OnClick="LoginForm_Submit" CssClass="button" />
            <asp:Label ID="feedback" runat="server" ForeColor="Red" CssClass="feedback"></asp:Label>
        </form>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2023 Telecommunication</p>
    </footer>

</body>
</html>
