<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EventManager_Admin.aspx.cs" Inherits="Admin_EventManager_Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Events</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Manage Events</h1>
            <asp:GridView ID="GridViewEvents" AutoGenerateColumns="false" OnRowDeleting="GridViewEvents_RowDeleting" DataKeyNames="eventname" runat="server">
                <Columns>
                    <asp:BoundField DataField="eventname" HeaderText="Event" />
                    <asp:BoundField DataField="date" HeaderText="Date" />
                    <asp:BoundField DataField="timing" HeaderText="Timing" />
                    <asp:BoundField DataField="venue" HeaderText="Venue" />
                    <asp:BoundField DataField="category" HeaderText="Category" />
                    <asp:BoundField DataField="studentexec" HeaderText="Student Head" />
                    <asp:BoundField DataField="facultymentor" HeaderText="Faculty Mentor" />
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" CommandArgument='<%# Eval("eventname") %>' />
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%# Eval("eventname") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>


            <h1>Add New Events</h1>
            <p>Enter Event Name:</p> <asp:TextBox ID="eventNameTextBox" runat="server" />
            <p>Enter Event Date:</p> <asp:TextBox ID="dateTextBox" runat="server" />
            <p>Enter Event Timings:</p> <asp:TextBox ID="timingTextBox" runat="server" />
            <p>Enter Event Venue:</p> <asp:TextBox ID="venueTextBox" runat="server" />
            <p>Enter Event Category:</p> <asp:TextBox ID="categoryTextBox" runat="server" />
            <p>Enter Student Head Username:</p> <asp:TextBox ID="studentexecTextBox" runat="server" />
            <p>Enter Faculty Mentor Username:</p> <asp:TextBox ID="facultyTextBox" runat="server" />

            <asp:Button ID="registerEventButton" Text="Register Event!" OnClick="registerEventMethod" runat="server" />
        </div>
    </form>
</body>
</html>
