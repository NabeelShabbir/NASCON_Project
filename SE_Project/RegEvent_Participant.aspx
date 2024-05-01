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

        </div>
    </form>
</body>
</html>
