<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p>Enter Username</p>
            <asp:TextBox ID="usernameTextBox" runat="server" />
            <p>Enter Password</p>
            <asp:TextBox ID="passwordTextBox" runat="server" />

            <p>Choose one of the following roles:</p>
            
            <asp:RadioButton ID="adminRadioButton" Text="Administrator" GroupName="userRole" runat="server" />
            <asp:RadioButton ID="studentexecRadioButton" Text="Student Executive" GroupName="userRole"  runat="server" />
            <asp:RadioButton ID="facultyRadioButton" Text="Faculty Mentor" GroupName="userRole"  runat="server" />
            <asp:RadioButton ID="participantRadioButton" Text="Participant" GroupName="userRole"  runat="server" />
            <asp:RadioButton ID="sponsorRadioButton" Text="Sponsor" GroupName="userRole"  runat="server" />
            <br />
            <asp:Button ID="loginButton" Text="Login" runat="server" OnClick="loginEventMethod" />

            <br />
            <p>Don't have an Account? You can Register Here:</p>
            <a href="ChooseRegistrationRole.aspx">Registration Page</a>

        </div>
    </form>
</body>
</html>
