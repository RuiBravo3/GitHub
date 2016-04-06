<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationPage.aspx.cs" Inherits="WebForum.RegistrationPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
        }
        .auto-style2 {
            width: 65px;
            height: 40px;
        }
        .auto-style3 {
            font-size: xx-large;
            width: 943px;
            height: 40px;
        }
        .auto-style4 {
            width: 65px;
            height: 23px;
        }
        .auto-style11 {
            height: 23px;
            width: 943px;
        }
        .auto-style12 {
            height: 40px;
        }
        .auto-style14 {
            width: 4px;
            height: 80px;
        }
        .auto-style15 {
            height: 80px;
            width: 171px;
            font-size: 20pt;
        }
        .auto-style16 {
            height: 80px;
            width: 834px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style2"></td>
                <td class="auto-style3">
                    <center>
        <asp:LinkButton ID="LinkButtonTekJunkies" runat="server" OnClick="LinkButtonTekJunkies_Click" style="font-size: xx-large">Tek Junkies</asp:LinkButton>
                        <br />
                        <br />
                    <asp:Label ID="Title" runat="server" Text="Registration Page" style="font-size: x-large"></asp:Label>
                        </center>
                </td>
                <td class="auto-style12">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4"></td>
                <td class="auto-style11">
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style15">
                                <p style="font-size: 15pt">
                                    User Name:<br />
                                Password:<br />
                                Retype Password:
                                <br />
                                email address: 
                                </p>
                            </td>
                            <td class="auto-style16">
                                <asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ControlToValidate="TextBoxName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:CustomValidator ID="CustomValidatorName" runat="server" ControlToValidate="TextBoxName" ErrorMessage="User name must be unique and between 3 to 12 characters." ForeColor="Red" OnServerValidate="CustomValidatorName_ServerValidate" ValidateEmptyText="true"></asp:CustomValidator>
                                <br />
                                <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ControlToValidate="TextBoxPassword" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:CustomValidator ID="CustomValidatorPassword" runat="server" ControlToValidate="TextBoxPassword" ErrorMessage="Password must be between 6 to 12 characters." ForeColor="Red" OnServerValidate="CustomValidatorPassword_ServerValidate" ValidateEmptyText="true"></asp:CustomValidator>
                                <br />
                                <asp:TextBox ID="TextBoxRetypePassword" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorRetypePassword0" runat="server" ControlToValidate="TextBoxRetypePassword" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidatorPassword" runat="server" ControlToCompare="TextBoxPassword" ControlToValidate="TextBoxRetypePassword" ErrorMessage="Both passwords don't math." ForeColor="Red" ValidateEmptyText="true"></asp:CompareValidator>
                                <br />
                                <asp:TextBox ID="TextBoxMailAddress" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="TextBoxMailAddress" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:CustomValidator ID="CustomValidatorEmail" runat="server" ControlToValidate="TextBoxMailAddress" ErrorMessage="Invalid email address." ForeColor="Red" OnServerValidate="CustomValidatorEmail_ServerValidate" ValidateEmptyText="true"></asp:CustomValidator>
                            </td>
                        </tr>
                    </table>
                    <asp:LinkButton ID="LinkButtonAddUser" runat="server" OnClick="LinkButtonAddUser_Click">Register</asp:LinkButton>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" ConnectionString="<%$ ConnectionStrings:forumConnectionString %>" ProviderName="<%$ ConnectionStrings:forumConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [User]" InsertCommand="INSERT INTO [User] (userName, datejoined, UserType, [password], email, loggedIn) VALUES (name, passwordParam, 2, dateParam, emailParam, 0)">
            <InsertParameters>
                <asp:ControlParameter ControlID="TextBoxName" Name="name" PropertyName="Text" />
                <asp:SessionParameter Name="dateParam" SessionField="Date" />
                <asp:ControlParameter ControlID="TextBoxPassword" Name="passwordParam" PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBoxMailAddress" Name="emailParam" PropertyName="Text" />
            </InsertParameters>
        </asp:SqlDataSource>
        <br />
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style14">
                                &nbsp;</td>
                        </tr>
                    </table>
    </form>
</body>
</html>
