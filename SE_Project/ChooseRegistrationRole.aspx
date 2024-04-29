<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChooseRegistrationRole.aspx.cs" Inherits="ChooseRegistrationRole" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Choose Role</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <p>Choose one of the following roles to register as:</p>
 
             <asp:RadioButton ID="studentexecRadioButton" Text="Student Executive" GroupName="userRole"  runat="server" />
             <asp:RadioButton ID="facultyRadioButton" Text="Faculty Mentor" GroupName="userRole"  runat="server" />
             <asp:RadioButton ID="participantRadioButton" Text="Participant" GroupName="userRole"  runat="server" />
             <asp:RadioButton ID="sponsorRadioButton" Text="Sponsor" GroupName="userRole"  runat="server" />
             <br />
            <asp:Button ID="roleButton" Text="Submit" OnClick="chooseRoleButton" runat="server" />
        </div>
    </form>
</body>
</html>
