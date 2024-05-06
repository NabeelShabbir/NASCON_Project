<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ParticipantDetails.aspx.cs" Inherits="ParticipantDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p>Enter CNIC:</p>
            <asp:TextBox ID="cnicTextBox" runat="server" />

            <asp:Button ID="submitButton" OnClick="submitEventMethod" Text="Submit" runat="server" />
        </div>
    </form>
</body>
</html>
