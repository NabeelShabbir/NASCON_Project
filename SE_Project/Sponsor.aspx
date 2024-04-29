<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Sponsor.aspx.cs" Inherits="Sponsor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sponsor</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Sponsor Page</h1>
            <p>Name: <asp:Label ID="nameLabel" runat="server"/></p>
            <p>Username: <asp:Label ID="usernameLabel" runat="server"/></p>
            <p>Email: <asp:Label ID="emailLabel" runat="server"/></p>
            <p>Phone: <asp:Label ID="phoneLabel" runat="server"/></p>

            <%-- 
                 There should be an option for sponsors from where they can register themselves.
                 Sponsor can enter name of company, name of representative, CNIC and name of the
                category for which they are willing to sponsor.
                 There are three packages (Bronze for Rs 25000, Silver for Rs 60000 and Gold for Rs
                100000) from which sponsor can select any one of the packages.
                --%>

        </div>
    </form>
</body>
</html>
