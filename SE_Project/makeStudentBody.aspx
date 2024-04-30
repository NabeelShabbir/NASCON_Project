<%@ Page Language="C#" AutoEventWireup="true" CodeFile="makeStudentBody.aspx.cs" Inherits="makeStudentBody" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p>Select A Category to assign the Secretary of this team to:</p>
            <asp:DropDownList ID="categoriesDropDownList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="categoriesDropDownList_SelectedIndexChanged">
                <asp:ListItem Text="-- Select Category --" Value="" />
            </asp:DropDownList>
            <asp:Label ID="selectedCategoryLabel" Text="Selected Category:" runat="server" />

            <p>Student Body ID:</p> <asp:TextBox ID="studentBodyIDTextBox" TextMode="Number" runat="server" />

            <p>President:</p> 
            <asp:TextBox ID="presUsernameTextBox" Text="President Username" runat="server" />
            <asp:TextBox ID="presFullnameTextBox" Text="President Fullname" runat="server" />
            <asp:TextBox ID="presPasswordTextBox" Text="President Password" runat="server" />

            <p>Vice-President :</p> 
            <asp:TextBox ID="vicepresUsernameTextBox" Text="VP Username" runat="server" />
            <asp:TextBox ID="vicepresFullnameTextBox" Text="VP Fullname" runat="server" />
            <asp:TextBox ID="vicepresPasswordTextBox" Text="VP Password" runat="server" />
            <p>Secretary :</p> 
            <asp:TextBox ID="secretaryUsernameTextBox" Text="Secretary Username" runat="server" />
            <asp:TextBox ID="secretaryFullnameTextBox" Text="Secretary Fullname" runat="server" />
            <asp:TextBox ID="secretaryPasswordTextBox" Text="Secretary Password" runat="server" />
            <p>At least 4 members are required for a Student Executive Body</p>
            <p>Member :</p> 
            <asp:TextBox ID="member1UsernameTextBox" Text="Member1 Username" runat="server" />
            <asp:TextBox ID="member1FullnameTextBox" Text="Member1 Fullname" runat="server" />
            <asp:TextBox ID="member1PasswordTextBox" Text="Member1 Password" runat="server" />
            <p>Member :</p> 
            <asp:TextBox ID="member2UsernameTextBox" Text="Member2 Username" runat="server" />
            <asp:TextBox ID="member2FullnameTextBox" Text="Member2 Fullname" runat="server" />
            <asp:TextBox ID="member2PasswordTextBox" Text="Member2 Password" runat="server" />
            <p>Member :</p> 
            <asp:TextBox ID="member3UsernameTextBox" Text="Member3 Username" runat="server" />
            <asp:TextBox ID="member3FullnameTextBox" Text="Member3 Fullname" runat="server" />
            <asp:TextBox ID="member3PasswordTextBox" Text="Member3 Password" runat="server" />
            <p>Member :</p> 
            <asp:TextBox ID="member4UsernameTextBox" Text="Member4 Username" runat="server" />
            <asp:TextBox ID="member4FullnameTextBox" Text="Member4 Fullname" runat="server" />
            <asp:TextBox ID="member4PasswordTextBox" Text="Member4 Password" runat="server" />

            <asp:Button ID="submitStudentBodyButton" Text="Submit Student Exec Body" OnClick="submitStudentBodyEventMethod" runat="server" />

        </div>
    </form>
</body>
</html>
