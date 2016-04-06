<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsersListPage.aspx.cs" Inherits="WebForum.UsersListPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">


        .auto-style5 {
            height: 40px;
            width: 186px;
        }
        .auto-style2 {
            font-size: xx-large;
            height: 40px;
            width: 3647px;
        }
        .auto-style7 {
            height: 40px;
            width: 843px;
        }
        .auto-style10 {
            width: 89px;
        }
        .auto-style6 {
            width: 186px;
        }
        .auto-style9 {
            width: 3647px;
        }
        .auto-style8 {
            width: 843px;
        }
        .auto-style11 {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1" id="GridView1">
            
            <tr>
                <RowStyle HorizontalAlign="Left">
                <td class="auto-style5"></td>
                <td class="auto-style2">
                    <center>
                        <asp:LinkButton ID="LinkButtonTekJunkies" runat="server" OnClick="LinkButtonTekJunkies_Click">Tek Junkies</asp:LinkButton>
                    </center>
                </td>
                <td class="auto-style7">
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style10">
                                <asp:LinkButton ID="LinkButtonAccount" runat="server" OnClick="LinkButtonAccount_Click">Account Page </asp:LinkButton>
                            </td>
                            <td>
                                <asp:LinkButton ID="LinkButtonSignOut" runat="server" OnClick="LinkButtonSignOut_Click">Sign out </asp:LinkButton>
                            </td>
                            <td>
                                <asp:LinkButton ID="LinkButtonRegister" runat="server" OnClick="LinkButtonRegister_Click">Register</asp:LinkButton>
                                
                            </td>
                            <td>
                                <asp:LinkButton ID="LinkButtonSignIn" runat="server" OnClick="LinkButtonSignIn_Click">Sign in</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                    <br />
                </td>
                </RowStyle>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td id="GridView2" class="auto-style9">
                    <center>
                        <table class="auto-style11">
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:GridView ID="GridViewOnline" runat="server" AutoGenerateColumns="False" DataKeyNames="userName" DataSourceID="SqlDataSourceUsersOnline">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Users Online" SortExpression="userName">
                                                <EditItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("userName") %>'></asp:Label>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButtonUsersONline" runat="server" OnClick="LinkButtonUsersONline_Click" Text='<%# Bind("userName") %>'></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </td>
                                <td>
                                    <asp:GridView ID="GridViewOffline" runat="server" AutoGenerateColumns="False" DataKeyNames="userName" DataSourceID="SqlDataSourceUsersOffline" Visible="False">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Users Offline" SortExpression="userName">
                                                <EditItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("userName") %>'></asp:Label>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButtonUsersOffline" runat="server" OnClick="LinkButtonUsersOffline_Click" Text='<%# Bind("userName") %>'></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        </center>
                    </td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            
        </table>
    
    </div>
        <asp:SqlDataSource ID="SqlDataSourceUsersOnline" runat="server" ConnectionString="<%$ ConnectionStrings:forumConnectionString %>" ProviderName="<%$ ConnectionStrings:forumConnectionString.ProviderName %>" SelectCommand="SELECT userName FROM [User] WHERE (loggedIn = 1)"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceUsersOffline" runat="server" ConnectionString="<%$ ConnectionStrings:forumConnectionString %>" ProviderName="<%$ ConnectionStrings:forumConnectionString.ProviderName %>" SelectCommand="SELECT userName FROM [User] WHERE (loggedIn = 0)"></asp:SqlDataSource>
    </form>
</body>
</html>
