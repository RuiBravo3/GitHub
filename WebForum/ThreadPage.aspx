<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThreadPage.aspx.cs" Inherits="WebForum.ThreadPage" %>

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
            width: 1738px;
        }
        .auto-style7 {
            height: 40px;
            width: 1556px;
        }
        .auto-style10 {
            width: 89px;
            height: 42px;
        }
        .auto-style6 {
            width: 186px;
        }
        .auto-style9 {
            width: 1738px;
        }
        .auto-style8 {
            width: 1556px;
        }
        .auto-style11 {
            height: 42px;
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
        <asp:LinkButton ID="LinkButtonTekJunkies" runat="server" OnClick="LinkButtonTekJunkies_Click" style="font-size: xx-large">Tek Junkies</asp:LinkButton>
                    </center>
                </td>
                <td class="auto-style7">
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style10">
                                <asp:LinkButton ID="LinkButtonAccount" runat="server" OnClick="LinkButtonAccount_Click">Account Page </asp:LinkButton>
                            </td>
                            <td class="auto-style11">
                                <asp:LinkButton ID="LinkButtonSignOut" runat="server" OnClick="LinkButtonSignOut_Click">Sign out </asp:LinkButton>
                            </td>
                            <td class="auto-style11">
                                <asp:LinkButton ID="LinkButtonRegister" runat="server" OnClick="LinkButtonRegister_Click">Register</asp:LinkButton>
                                
                            </td>
                            <td class="auto-style11">
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
                    &nbsp;<asp:Label ID="LabelCategory" runat="server"></asp:Label>
&nbsp;-
                    <asp:LinkButton ID="LinkButtonTopic" runat="server" OnClick="LinkButtonTopic_Click"></asp:LinkButton>
                    <br></br>
                    <center>
                    <asp:Label ID="LabelThreadTitle" runat="server" style="font-size: xx-large"></asp:Label>
                        <br />
                        <br />
                        <asp:GridView ID="GridViewPosts" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourcePost" OnDataBound="GridViewPosts_DataBound" Height="644px" style="margin-right: 0px" Width="592px">
                            <Columns>
                                <asp:TemplateField HeaderText="Posted by" SortExpression="UserName" >
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("UserName") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButtonUserName" runat="server" OnClick="LinkButtonUserName_Click" Text='<%# Bind("UserName") %>'></asp:LinkButton>
                                        <br />
                                        <asp:Image ID="ImageAvatar" runat="server" Height="100px" Width="100px" />
                                        <br />
                                        <br />
                                        <asp:Label ID="LabelDateJoined" runat="server" Text='Date Joined: '></asp:Label>
                                        <br />
                                        <asp:Label ID="LabelPosts" runat="server" Text="Posts: " ></asp:Label>
                                        <br />
                                        <asp:Label ID="LabelPostDate" runat="server" Text='<%# Bind("PostDate") %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="LabelLoggedIn" runat="server"></asp:Label>
                                    </ItemTemplate>

<ItemStyle Width="35%"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Post" SortExpression="Content" >
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Content") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Content") %>'></asp:Label>
                                        <br />
                                        <asp:TextBox ID="TextBoxEdit" runat="server" TextMode="MultiLine" Visible="False" Text='<%# Bind("Content") %>'></asp:TextBox>
                                        <br />
                                        <br />
                                        <asp:Button ID="ButtonDelete" runat="server" OnClick="ButtonDelete_Click" Text="Delete" />
                                        <asp:Button ID="ButtonEdit" runat="server" OnClick="ButtonEdit_Click" Text="Edit" />
                                        <asp:Button ID="ButtonSave" runat="server" OnClick="ButtonSave_Click" Text="Save" Visible="False" />
                                    </ItemTemplate>

<ItemStyle Width="65%"></ItemStyle>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <br />
                        <asp:TextBox ID="TextBoxReply" runat="server" TextMode="MultiLine" Visible="False"></asp:TextBox>
                        <br />
                        <asp:Button ID="ButtonReply" runat="server" OnClick="ButtonReply_Click" Text="Submit Post" Visible="False" />
                    </center>
                    </td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            
        </table>
    <asp:SqlDataSource ID="SqlDataSourcePost" runat="server" ConnectionString="<%$ ConnectionStrings:forumConnectionString %>" ProviderName="<%$ ConnectionStrings:forumConnectionString.ProviderName %>" SelectCommand="SELECT UserName, PostDate, Content, PostNumber FROM Post WHERE (Category = CategoryParam) AND (TopicTItle = TopicParam) AND (ThreadNumber = ThreadNumberParam)" InsertCommand="INSERT INTO Post(Category, TopicTItle, ThreadNumber, PostNumber, Content, PostDate, UserName) VALUES (CategoryParam, TopicTitleParam, ThreadNumberParam, PostNumberParam, ContentParam, PostDateParam, UserNameParam)" UpdateCommand="UPDATE Post SET Category =@Category , TopicTItle =@TopicTItle , ThreadNumber =@ThreadNumber , PostNumber =@PostNumber , Content =@Content , PostDate =@PostDate , UserName =@UserName WHERE PostNumber =@PostNumber AND ThreadNumber =@ThreadNumber AND TopicTItle =@TopicTItle AND Category =@Category" DeleteCommand="DELETE FROM Post WHERE PostNumber=PostNumberParam">
        <DeleteParameters>
            <asp:SessionParameter Name="PostNumberParam" SessionField="PostNumber" />
        </DeleteParameters>
        <InsertParameters>
            <asp:SessionParameter Name="CategoryParam" SessionField="Category" />
            <asp:SessionParameter Name="TopicTitleParam" SessionField="Topic" />
            <asp:SessionParameter Name="ThreadNumberParam" SessionField="ThreadNumber" />
            <asp:SessionParameter DefaultValue="" Name="PostNumberParam" SessionField="PostNumber" />
            <asp:SessionParameter Name="ContentParam" SessionField="Content" />
            <asp:SessionParameter Name="PostDateParam" SessionField="Date" />
            <asp:SessionParameter Name="UserNameParam" SessionField="UserName" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="CategoryParam" SessionField="Category" />
            <asp:SessionParameter Name="TopicParam" SessionField="Topic" />
            <asp:SessionParameter Name="ThreadNumberParam" SessionField="ThreadNumber" />
        </SelectParameters>
        <UpdateParameters>
            <asp:SessionParameter Name="Category" SessionField="Category" DefaultValue="CPUs" />
            <asp:SessionParameter Name="TopicTItle" SessionField="Topic" DefaultValue="Intel" />
            <asp:SessionParameter Name="ThreadNumber" SessionField="ThreadNumber" DefaultValue="2" />
            <asp:SessionParameter Name="PostNumber" SessionField="PostNumber" DefaultValue="1" />
            <asp:SessionParameter Name="Content" SessionField="Content" DefaultValue="Updated" />
            <asp:SessionParameter Name="PostDate" SessionField="Date" DefaultValue="20-Jan-14" />
            <asp:SessionParameter Name="UserName" SessionField="UserName" DefaultValue="Admin" />
        </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" ConnectionString="<%$ ConnectionStrings:forumConnectionString %>" ProviderName="<%$ ConnectionStrings:forumConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [User]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceAllPosts" runat="server" ConnectionString="<%$ ConnectionStrings:forumConnectionString %>" ProviderName="<%$ ConnectionStrings:forumConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Post]"></asp:SqlDataSource>
    </form>
    </body>
</html>
