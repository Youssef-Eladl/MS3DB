<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MS3DB.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="Login"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="Username:"></asp:Label>
        <p>
            <asp:TextBox ID="Username" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label3" runat="server" Text="Password:"></asp:Label>
            </p>
        <asp:TextBox ID="Password" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="Signin" runat="server" OnClick = "login" Text="Login" />
    </form>
</body>
</html>
