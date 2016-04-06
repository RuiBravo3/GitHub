<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="WebForum.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <center>
        <asp:LinkButton ID="LinkButtonTekJunkies" runat="server" OnClick="LinkButtonTekJunkies_Click" style="font-size: xx-large">Tek Junkies</asp:LinkButton>
            <br />
        </center>
    </div>
        <center>
        <asp:Login ID="LoginController" runat="server" OnAuthenticate="LoginController_Authenticate">
        </asp:Login>
        </center>
        <asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" ConnectionString="<%$ ConnectionStrings:forumConnectionString %>" ProviderName="<%$ ConnectionStrings:forumConnectionString.ProviderName %>" SelectCommand="SELECT userName, [password], UserType, datejoined, email, loggedIn, picFilePath FROM [User]"></asp:SqlDataSource>
    </form>
</body>
</html>
