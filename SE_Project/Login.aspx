<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <%-- Link Bootstrap CSS --%>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <%-- Link custom CSS stylesheet --%>
    <link href="styles.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="login-container">
                <h1 class="login-heading">NASCON Management System</h1>
                <div class="login-form">
                    <p>Enter Username</p>
                    <asp:TextBox ID="usernameTextBox" CssClass="form-control" runat="server" />
                    <p>Enter Password</p>
                    <asp:TextBox ID="passwordTextBox" CssClass="form-control" runat="server" />
                    <p>Choose one of the following roles:</p>
                    <div class="radio">
                        <asp:RadioButton ID="adminRadioButton" Text="Administrator" GroupName="userRole" CssClass="form-check-input" runat="server" />
                        <asp:RadioButton ID="studentexecRadioButton" Text="Student Executive" GroupName="userRole" CssClass="form-check-input" runat="server" />
                        <asp:RadioButton ID="facultyRadioButton" Text="Faculty Mentor" GroupName="userRole" CssClass="form-check-input" runat="server" />
                        <asp:RadioButton ID="participantRadioButton" Text="Participant" GroupName="userRole" CssClass="form-check-input" runat="server" />
                        <asp:RadioButton ID="sponsorRadioButton" Text="Sponsor" GroupName="userRole" CssClass="form-check-input" runat="server" />
                    </div>
                    <asp:Button ID="loginButton" Text="Login" CssClass="btn btn-primary" runat="server" OnClick="loginEventMethod" />
                    <br />
                    <p>Don't have an Account? You can Register Here:</p>
                    <a href="ChooseRegistrationRole.aspx">Registration Page</a>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
