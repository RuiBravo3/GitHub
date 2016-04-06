<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddNewCategory.aspx.cs" Inherits="MRDB.AddNewCategory" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" rel="stylesheet" href="StyleSheet1.css" />
    <style type="text/css">
        .auto-style1 {
            font-size: large;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            width: 13px;
        }
        .auto-style4 {
            width: 150px;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">
        <div id="content">
                <div class="header">
                  <p>MRDB- Movies Review Database&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p> 
                </div>
            
        <div class="bar"><asp:Label id="registerBt" runat="server"><img src="images/register.png" style="height: 20px; width: 20px"/><a href='Registerpage.aspx'>Register-</a></asp:Label><img src="images/login.png" style="height: 20px; width: 20px" /><asp:Label id="Loginbt" runat="server"><a href='Login.aspx'>Login</a></asp:Label><asp:Label id="logout" runat="server" Visible="False"><a href='Logout.aspx'>Logout</a></asp:Label>
            -<a href="Search.aspx" class="button"><img src="images/search.png" style="height: 20px; width: 20px" /> Search</a>-<a href="Contact.aspx" class="button"><img src="images/contact.png" style="height: 20px; width: 20px"/> Contact</a></div>
            &nbsp;<div class="left_menu">
                <div class="title"><img src="images/login.png" style="height: 20px; width: 18px" /> <span class="auto-style1">Menu list</span></div>
                <div class="leftbox">
                    <table class="auto-style2">
                        <tr>
                            <td class="auto-style3">
                                <asp:Image ID="Image1" runat="server" Height="20px" ImageUrl="images/arrow1.png" Width="20px" />
                            </td>
                            <td style="text-align: left">
                                <asp:HyperLink ID="addNewMovlb" runat="server" NavigateUrl="~/AddNewMovie.aspx">Add New Movie</asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <asp:Image ID="Image2" runat="server" Height="20px" ImageUrl="images/arrow1.png" Width="20px" />
                            </td>
                            <td>
                                <asp:HyperLink ID="newCatlb" runat="server" NavigateUrl="~/AddNewCategory.aspx">Add New Category</asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <asp:Image ID="Image3" runat="server" Height="20px" ImageUrl="images/arrow1.png" Width="20px" />
                            </td>
                            <td>
                                <asp:HyperLink ID="removeMovlb" runat="server" NavigateUrl="~/RemoveMovie.aspx">Remove Movie</asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <asp:Image ID="Image4" runat="server" Height="20px" ImageUrl="images/arrow1.png" Width="20px" />
                            </td>
                            <td>
                                <asp:HyperLink ID="rmvcat" runat="server" NavigateUrl="~/RemoveCategory.aspx">Remove Category</asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <asp:Image ID="Image5" runat="server" Height="20px" ImageUrl="images/arrow1.png" Width="20px" />
                            </td>
                            <td>
                                <asp:HyperLink ID="modusrlb" runat="server" NavigateUrl="~/ModifyUsers.aspx">Modify Users</asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <asp:Image ID="Image6" runat="server" Height="20px" ImageUrl="images/arrow1.png" Width="20px" />
                            </td>
                            <td>
                                <asp:HyperLink ID="comdif" runat="server" NavigateUrl="~/ModifyComments.aspx">Modify Comments</asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <asp:Image ID="Image7" runat="server" Height="20px" ImageUrl="images/arrow1.png" Width="20px" />
                            </td>
                            <td>
                                <asp:HyperLink ID="modifyMov" runat="server">Modify Movie</asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <asp:Image ID="Image8" runat="server" Height="20px" ImageUrl="images/arrow1.png" Width="20px" />
                            </td>
                            <td>
                                <asp:HyperLink ID="modfSiteMsg" runat="server" NavigateUrl="~/SiteMessages.aspx">Site Messages</asp:HyperLink>
                            </td>
                        </tr>
                    </table>
                    </div>
            </div>

                <div class="welcome">
                    <asp:HyperLink ID="sitelbInex" runat="server" NavigateUrl="~/index.aspx">Site Index</asp:HyperLink>
                    <asp:Label ID="comalb" runat="server" Text="|"></asp:Label>
                    <asp:HyperLink ID="adminpindex" runat="server" NavigateUrl="AdminPanel.aspx">Admin Panel Index</asp:HyperLink>
                </div>

            <div class="news_box"><div id="title_news"><img src="images/news.png" style="height: 19px; width: 22px"/> Add New Category</div>

            <div id="news_content">
                     
                    Please Insert Bellow the category name you wish to add:<br />
                    <table class="auto-style2">
                        <tr>
                            <td class="auto-style4">
                                <asp:Label ID="lbcname" runat="server" Text="Category Name"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="catTextbox" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">&nbsp;</td>
                            <td>
                                <asp:Button ID="addCat" runat="server" OnClick="addCat_Click" Text="ADD" Width="125px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">&nbsp;</td>
                            <td>
                                <asp:Label ID="catex" runat="server" ForeColor="#CC3300" Text="This Category already Exists!" Visible="False"></asp:Label>
                                <asp:Label ID="okmsg" runat="server" ForeColor="#006600" Text="The Category Added Seccsesffuly!" Visible="False"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>

            </div>
                
            </div>
    </form>
</body>
</html>
