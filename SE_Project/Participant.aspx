<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Participant.aspx.cs" Inherits="Participant" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Participant</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Participant Page</h1>
            <p>Name: <asp:Label ID="nameLabel" runat="server"/></p>
            <p>Username: <asp:Label ID="usernameLabel" runat="server"/></p>
            <p>Email: <asp:Label ID="emailLabel" runat="server"/></p>
            <p>Phone: <asp:Label ID="phoneLabel" runat="server"/></p>
        </div>
    </form>
</body>
</html>
