<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccessDeniedPage.aspx.cs" Inherits="WebForum.AccessDeniedPage" %>

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
        </style>
</head>
<body>
    <form id="form2" runat="server">
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
                    <asp:Label ID="Title" runat="server" Text="Access Denied" style="font-size: 20pt"></asp:Label>
                        </center>
                    </td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            
        </table>
    </form>
</body>
</html>
