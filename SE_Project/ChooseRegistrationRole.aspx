<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChooseRegistrationRole.aspx.cs" Inherits="ChooseRegistrationRole" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Choose Role</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-5">
        <div class="registration-container">
            <h2 class="registration-heading">Choose Registration Role</h2>
            <div class="form-check">
                <asp:RadioButton ID="facultyRadioButton" Text="Faculty Mentor" GroupName="userRole" CssClass="form-check-input" runat="server" />
                <label class="form-check-label" for="facultyRadioButton">Faculty Mentor</label>
            </div>
            <div class="form-check">
                <asp:RadioButton ID="participantRadioButton" Text="Participant" GroupName="userRole" CssClass="form-check-input" runat="server" />
                <label class="form-check-label" for="participantRadioButton">Participant</label>
            </div>
            <div class="form-check">
                <asp:RadioButton ID="sponsorRadioButton" Text="Sponsor" GroupName="userRole" CssClass="form-check-input" runat="server" />
                <label class="form-check-label" for="sponsorRadioButton">Sponsor</label>
            </div>
            <asp:Button ID="roleButton" Text="Submit" CssClass="btn btn-primary" OnClick="chooseRoleButton" runat="server" />
        </div>
    </form>
</body>
</html>
