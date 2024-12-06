<form id="usageDetailsForm" runat="server">
<asp:TextBox ID="TextBox1" runat="server" placeholder="Mobile Number" />
<input type="text" id="txtMobileNumber" runat="server" />
<asp:Button ID="btnFetchUsage" runat="server" Text="Fetch Usage" OnClick="btnFetchUsage_Click" />
<input type="text" id="Text1" runat="server" placeholder="Mobile Number" />

  <div id="results">
    <asp:Repeater ID="usageDetailsRepeater" runat="server">
      <HeaderTemplate>
        <table>
          <thead>
            <tr>
              <th>Account ID</th>
              <th>Plan Name</th>
              <th>SMS Usage</th>
              <th>Minutes Usage</th>
              <th>Internet Usage (MB)</th>
              <th>Usage Date</th>
            </tr>
          </thead>
          <tbody>
      </HeaderTemplate>
      <ItemTemplate>
        <tr>
          <td><%# Eval("AccountID") %></td>
          <td><%# Eval("PlanName") %></td>
          <td><%# Eval("SMSUsage") %></td>
          <td><%# Eval("MinutesUsage") %></td>
          <td><%# Eval("InternetUsage", "{0:N2}") %></td>
          <td><%# Eval("UsageDate", "{0:yyyy-MM-dd}") %></td>
        </tr>
      </ItemTemplate>
      <FooterTemplate>
          </tbody>
        </table>
      </FooterTemplate>
    </asp:Repeater>

    <p style="color: red;"><asp:Label ID="lblMessage" runat="server"></asp:Label></p>
  </div>
</form>
