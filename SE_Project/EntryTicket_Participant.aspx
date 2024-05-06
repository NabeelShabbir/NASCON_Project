<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EntryTicket_Participant.aspx.cs" Inherits="EntryTicket_Participant" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Participant Details</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>EntryTicket</h1>
            <div>
                <strong>Full Name:</strong> <asp:Label ID="lblFullName" runat="server" Text=""></asp:Label><br />
                <strong>Email:</strong> <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label><br />
                <strong>Phone:</strong> <asp:Label ID="lblPhone" runat="server" Text=""></asp:Label><br />
                <strong>CNIC:</strong> <asp:Label ID="lblCNIC" runat="server" Text=""></asp:Label><br />
            <h3>Events</h3>
            <asp:GridView ID="GridViewTickets" runat="server" AutoGenerateColumns="False" Width="100%">
                <Columns>
                    <asp:BoundField DataField="eventID" HeaderText="Event ID" />
                    <asp:BoundField DataField="eventName" HeaderText="Event Name" />
                </Columns>
            </asp:GridView>
                <br />
                <strong>FoodDeal:</strong> <asp:Label ID="fooddeal" runat="server" Text=""></asp:Label><br />
                
                <asp:Button ID="btnPrint" runat="server" Text="Print" />
            </div>
        </div>
    </form>
</body>
</html>
