<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SiteMessages.aspx.cs" Inherits="MRDB.SiteMesseges" %>
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

            <div class="news_box"><div id="title_news"><img src="images/news.png" style="height: 19px; width: 22px"/> Site Movie</div>

            <div id="news_content">
                     
                    Here You Can Edit, Delete, or add site Messages.<br />
                    <table class="auto-style2">
                        <tr>
                            <td class="auto-style4" colspan="2">
                                <asp:GridView ID="msgGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="msgName" DataSourceID="msgGridView">
                                    <Columns>
                                        <asp:BoundField DataField="msgName" HeaderText="Mssage Name" SortExpression="msgName" />
                                        <asp:BoundField DataField="PostDate" HeaderText="Post Date" SortExpression="PostDate" />
                                        <asp:TemplateField HeaderText="Mssage Body" SortExpression="msgBody">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Height="112px" Text='<%# Bind("msgBody") %>' TextMode="MultiLine" Width="225px"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("msgBody") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="False">
                                            <EditItemTemplate>
                                                <asp:LinkButton ID="udptBt" runat="server" CausesValidation="True" CommandName="Update" OnClick="udptBt_Click" Text="Update"></asp:LinkButton>
                                                &nbsp;<asp:LinkButton ID="cnBt" runat="server" CausesValidation="False" CommandName="Cancel" OnClick="cnBt_Click" Text="Cancel"></asp:LinkButton>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="editbt" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="dbt" runat="server" CausesValidation="False" CommandName="Delete" OnClick="dbt_Click" Text="Delete"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                                <asp:Label ID="oklbl" runat="server" ForeColor="#006600"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style4" colspan="2">
                                Add New Message:</td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                                Message Title:</td>
                            <td class="auto-style4">
                                <asp:TextBox ID="msgTitleBox" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                                Date:</td>
                            <td class="auto-style4">
                                <asp:TextBox ID="DateBox" runat="server"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="DateBox" ErrorMessage="(dd/mm/yyyy)" ForeColor="#CC0000" ValidationExpression="^(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                                Message Body:</td>
                            <td class="auto-style4">
                                <asp:TextBox ID="BodyBox" runat="server" Height="145px" TextMode="MultiLine" Width="310px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                                &nbsp;</td>
                            <td class="auto-style4">
                                <asp:Button ID="addMsg" runat="server" OnClick="addMsg_Click" Text="Add Message" ValidateRequestMode="Enabled" Width="175px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                                <asp:Label ID="oklblm" runat="server" ForeColor="#006600"></asp:Label>
                            </td>
                            <td class="auto-style4">
                                &nbsp;</td>
                        </tr>
                    </table>
                </div>

            </div>
                
            </div>
        <asp:SqlDataSource ID="msgGridView" runat="server" ConnectionString="<%$ ConnectionStrings:MDBdatabase %>" DeleteCommand="DELETE FROM [messages] WHERE (msgName = @msgName)" ProviderName="<%$ ConnectionStrings:MDBdatabase.ProviderName %>" SelectCommand="SELECT * FROM [messages]" UpdateCommand="UPDATE messages SET msgName=@msgName,  postDate=@postDate, msgBody=@msgBody where msgName=@msgName"></asp:SqlDataSource>
    </form>
</body>
</html>
