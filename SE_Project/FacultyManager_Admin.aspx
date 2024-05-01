<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FacultyManager_Admin.aspx.cs" Inherits="FacultyManager_Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Faculty</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Manage Faculty</h1>
            <asp:GridView ID="GridViewFaculty" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridViewFaculty_RowDeleting" DataKeyNames="username">
                <Columns>
                    <asp:BoundField DataField="username" HeaderText="Username" />
                    <asp:BoundField DataField="fullname" HeaderText="Full Name" />
                    <asp:BoundField DataField="email" HeaderText="Email" />
                    <asp:BoundField DataField="phone" HeaderText="Phone" />
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:Button ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" CommandArgument='<%# Eval("username") %>' />
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" CommandArgument='<%# Eval("username") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
    
            <h2>Add Faculty</h2>
            <p>Enter Full Name</p>
            <asp:TextBox ID="fullnameTextBox" Text="" runat="server" />
            <p>Enter Email</p>
            <asp:TextBox ID="emailTextBox" Text="" runat="server" />
            <p>Enter Phone Number</p>
            <asp:TextBox ID="phoneNumTextBox" Text="" runat="server" />            
            <p>Enter Username</p>
            <asp:TextBox ID="usernameTextBox" Text="" runat="server" />            
            <p>Enter Password</p>
            <asp:TextBox ID="passwordTextBox" Text="" runat="server" />

            <asp:Button ID="registerButton" Text="Register" runat="server" OnClick="registerEventMethod" />
        </div>
    </form>
</body>
</html>
