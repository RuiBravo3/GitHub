<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModifyMovie.aspx.cs" Inherits="MRDB.ModifyMovie" %>
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
                                <asp:HyperLink ID="modifyMov" runat="server" NavigateUrl="~/ModifyMovie.aspx">Modify Movie</asp:HyperLink>
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

            <div class="news_box"><div id="title_news"><img src="images/news.png" style="height: 19px; width: 22px"/> Modify Movie</div>

            <div id="news_content">
                     
                    Please Select the Movie you would like to modify from the list below<br />
                    <table class="auto-style2">
                        <tr>
                            <td class="auto-style4">Movie Name:</td>
                            <td>
                                <asp:DropDownList ID="mdropdown" runat="server" DataSourceID="movNamedb" DataTextField="mName" DataValueField="mName">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">&nbsp;</td>
                            <td>
                                <asp:Button ID="btmSelected" runat="server" OnClick="btmSelected_Click" Text="Select" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4" colspan="2">
                                <asp:GridView ID="selectedMovieGridm" runat="server" AutoGenerateColumns="False" DataKeyNames="mName" DataSourceID="movieSelecteddb" Visible="False">
                                    <Columns>
                                        <asp:BoundField DataField="mName" HeaderText="mName" SortExpression="mName" />
                                        <asp:BoundField DataField="mLength" HeaderText="mLength" SortExpression="mLength" />
                                        <asp:BoundField DataField="mYear" HeaderText="mYear" SortExpression="mYear" />
                                        <asp:BoundField DataField="mReview" HeaderText="mReview" SortExpression="mReview" />
                                        <asp:BoundField DataField="image" HeaderText="image" SortExpression="image" />
                                        <asp:CommandField ShowEditButton="True" />
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </div>

            </div>
                
            </div>
        <asp:SqlDataSource ID="movNamedb" runat="server" ConnectionString="<%$ ConnectionStrings:MDBdatabase %>" ProviderName="<%$ ConnectionStrings:MDBdatabase.ProviderName %>" SelectCommand="SELECT [mName], [mId] FROM [movie]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="movieSelecteddb" runat="server" ConnectionString="<%$ ConnectionStrings:MDBdatabase %>" ProviderName="<%$ ConnectionStrings:MDBdatabase.ProviderName %>" SelectCommand="SELECT * FROM [movie] where mName=mname1" UpdateCommand="UPDATE [movie] SET mName=@mName, mLength = @mLength, mYear=@mYear,mReview = @mReview WHERE (mName=@mName)" DeleteCommand="DELETE FROM movie where mName=@mName">
            <SelectParameters>
                <asp:ControlParameter ControlID="mdropdown" Name="mname1" PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="selectedMovieGridm" Name="nm" PropertyName="SelectedValue" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
