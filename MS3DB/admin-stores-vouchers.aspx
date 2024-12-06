<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin-stores-vouchers.aspx.cs" Inherits="MS3DB.Pages.admin-stores-vouchers" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Physical Stores</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Physical Stores</h2>
        <asp:Repeater ID="PhysicalStoresRepeater" runat="server">
            <HeaderTemplate>
                <table border="1">
                    <tr>
                        <th>Store ID</th>
                        <th>Store Name</th>
                        <th>Voucher ID</th>
                        <th>Voucher Value</th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%# Eval("StoreID") %></td>
                    <td><%# Eval("StoreName") %></td>
                    <td><%# Eval("VoucherID") %></td>
                    <td><%# Eval("VoucherValue") %></td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
    </form>
</body>
</html>
