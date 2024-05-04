<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegEvent_Participant.aspx.cs" Inherits="RegEvent_Participant" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register for Event</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Register for Event:
                <asp:Label ID="usernameLabel" runat="server" Text="Label"></asp:Label>
            </h1>
            <asp:GridView ID="GridViewEvents" runat="server" AutoGenerateColumns="False" Width="100%" OnRowCommand="GridViewEvents_RowCommand">
                <Columns>
                    <asp:BoundField DataField="eventID" HeaderText="Event ID" />
                    <asp:BoundField DataField="eventName" HeaderText="Event Name" />
                    <asp:BoundField DataField="date" HeaderText="Date" />
                    <asp:BoundField DataField="timing" HeaderText="Timing"  />
                    <asp:BoundField DataField="venue" HeaderText="Venue" />
                    <asp:TemplateField HeaderText="Registration">
                        <ItemTemplate>
                            <asp:Button ID="btnRegister" runat="server" Text="Register" CommandName="Register" CommandArgument='<%# Eval("eventID") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <h1>Your Tickets</h1>
            <asp:GridView ID="GridViewTickets" runat="server" AutoGenerateColumns="False" Width="100%">
                <Columns>
                    <asp:BoundField DataField="eventID" HeaderText="Event ID" />
                    <asp:BoundField DataField="eventName" HeaderText="Event Name" />
                </Columns>
            </asp:GridView>
            <h1>Food Deals</h1>
            <asp:Button ID="btnDeal1" runat="server" Text="3 Burgers, Fries, and 3 Drinks for Rs 1200" OnClick="btnDeal1_Click" />
            <asp:Button ID="btnDeal2" runat="server" Text="4 Burgers, Fries, and 4 Drinks for Rs 1500" OnClick="btnDeal2_Click" />
            <asp:Button ID="btnDeal3" runat="server" Text="1 Burger, Fries, and 1 Drink for Rs 500" OnClick="btnDeal3_Click" />
            <h1>Generate Entry Ticket</h1>
            <asp:Button ID="btnGenerateTicket" runat="server" Text="Generate Entry Ticket" OnClick="btnGenerateTicket_Click" />
        </div>
    </form>
</body>
</html>
