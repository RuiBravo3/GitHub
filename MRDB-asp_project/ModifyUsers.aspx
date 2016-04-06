<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModifyUsers.aspx.cs" Inherits="MRDB.ModifyUsers" %>
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

            <div class="news_box"><div id="title_news"><img src="images/news.png" style="height: 19px; width: 22px"/> Modify Users</div>

            <div id="news_content">
                     
                    Here by Select user, you will be able to do the following: Remove, Add, and modify fileds from an exists user.(Dont forget the user type &quot;Regular&quot; for regular user and &quot;Admin&quot; for super user for both change or add users.<br />
                    <table class="auto-style2">
                        <tr>
                            <td class="auto-style4">
                                Select user to modify:</td>
                            <td>
                                <asp:DropDownList ID="userDropls" runat="server" DataSourceID="allusersdb" DataTextField="userName" DataValueField="userName">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">&nbsp;</td>
                            <td>
                                <asp:Button ID="goModifbt" runat="server"  Text="Go" OnClick="goModifbt_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4" colspan="2">
                                <asp:GridView ID="userModgrid" runat="server" AutoGenerateColumns="False" DataKeyNames="userName" DataSourceID="usersdb" Visible="False">
                                    <Columns>
                                        <asp:TemplateField HeaderText="fName" SortExpression="fName">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Height="16px" Text='<%# Bind("fName") %>' Width="57px"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="fName" runat="server" Text='<%# Bind("fName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="lName" SortExpression="lName">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server" Height="16px" Text='<%# Bind("lName") %>' Width="57px"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("lName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="userName" SortExpression="userName">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox3" runat="server" Height="16px" Text='<%# Bind("userName") %>' Width="57px"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("userName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="pass" SortExpression="pass">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox4" runat="server" Height="16px" Text='<%# Bind("pass") %>' Width="57px"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("pass") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="email" SortExpression="email">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox5" runat="server" Height="16px" Text='<%# Bind("email") %>' Width="57px"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="type" SortExpression="type">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox6" runat="server" Height="16px" Text='<%# Bind("type") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("type") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="False">
                                            <EditItemTemplate>
                                                <asp:LinkButton ID="updBt" runat="server" CausesValidation="True" CommandName="Update" OnClick="updBt_Click" Text="Update"></asp:LinkButton>
                                                &nbsp;<asp:LinkButton ID="cenBt" runat="server" CausesValidation="False" CommandName="Cancel" OnClick="cenBt_Click" Text="Cancel"></asp:LinkButton>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="editBt" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="delBt" runat="server" CausesValidation="False" CommandName="Delete" OnClick="delBt_Click" Text="Delete"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4" colspan="2">
                                Adding new user:</td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                                First Name:</td>
                            <td class="auto-style4">
                                <asp:TextBox ID="fnamebox" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                                Last Name:</td>
                            <td class="auto-style4">
                                <asp:TextBox ID="lnamebox" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                                Username:</td>
                            <td class="auto-style4">
                                <asp:TextBox ID="unamebox" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                                Password:</td>
                            <td class="auto-style4">
                                <asp:TextBox ID="passnamebox" runat="server" TextMode="Password"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                                Email:</td>
                            <td class="auto-style4">
                                <asp:TextBox ID="emailbox" runat="server"></asp:TextBox>
&nbsp;<asp:RegularExpressionValidator ID="emailval" runat="server" ControlToValidate="emailbox" ErrorMessage="Email Incorrect!" ForeColor="#CC0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                                type:</td>
                            <td class="auto-style4">
                                <asp:DropDownList ID="permission" runat="server">
                                    <asp:ListItem Value="1">Regular</asp:ListItem>
                                    <asp:ListItem Value="2">Admin</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                                &nbsp;</td>
                            <td class="auto-style4">
                                <asp:Button ID="adduserBt" runat="server" OnClick="adduserBt_Click" Text="ADD USER" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4" colspan="2">
                                <asp:Label ID="secclb" runat="server" ForeColor="#006600"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>

            </div>
                
            </div>
        <asp:SqlDataSource ID="usersdb" runat="server" ConnectionString="<%$ ConnectionStrings:MDBdatabase %>" ProviderName="<%$ ConnectionStrings:MDBdatabase.ProviderName %>" SelectCommand="SELECT * FROM [user] where userName = usern" DeleteCommand="DELETE FROM [user] WHERE (userName = @userName)" UpdateCommand="UPDATE [user] SET fName = @fName, lName = @lName, userName = @userName, pass=@pass ,email = @email, type=@type WHERE (userName = @userName)">
            <SelectParameters>
                <asp:ControlParameter ControlID="userDropls" Name="usern" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="allusersdb" runat="server" ConnectionString="<%$ ConnectionStrings:MDBdatabase %>" ProviderName="<%$ ConnectionStrings:MDBdatabase.ProviderName %>" SelectCommand="SELECT * FROM [user]"></asp:SqlDataSource>
    </form>
</body>
</html>
