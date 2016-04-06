<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="WebForum.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
        }
        .auto-style2 {
            font-size: xx-large;
            height: 40px;
            width: 3647px;
        }
        .auto-style5 {
            height: 40px;
            width: 423px;
        }
        .auto-style6 {
            width: 423px;
        }
        .auto-style7 {
            height: 40px;
            width: 1015px;
        }
        .auto-style8 {
            width: 1015px;
        }
        .auto-style9 {
            width: 3647px;
        }
        .auto-style10 {
            width: 126px;
        }
        .auto-style11 {
            width: 100%;
        }
    </style>
</head>
<body style="margin-right: 0px">
    <form id="form1" runat="server">
        <table class="auto-style1" id="GridView1">
            
            <tr>
                <RowStyle HorizontalAlign="Left">
                <td class="auto-style5">
                    <asp:LinkButton ID="LinkButtonUsersList" runat="server" OnClick="LinkButtonUsersList_Click">View all users</asp:LinkButton>
                    </td>
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
                <td id="GridView1" class="auto-style9">
                    <table class="auto-style11">
                        <tr>   
                            <td><center>CPUs</center></td>
                        </tr>
                        <tr>
                            <td><center>
                                <asp:GridView ID="GridViewCPUs" runat="server" AutoGenerateColumns="False" DataKeyNames="category,TopicTitle" DataSourceID="SqlDataSourceCPUs" OnDataBound="GridViewCPUs_DataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Topic" SortExpression="TopicTitle">
                                            <EditItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("TopicTitle") %>'></asp:Label>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButtonTopic" runat="server" OnClick="LinkButtonTopicCPUs_Click"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Threads"></asp:TemplateField>
                                        <asp:TemplateField HeaderText="Views"></asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                &nbsp;</center></td>
                        </tr>
                        <tr>
                            <td><center>GPUs</center></td>
                        </tr>
                        <tr>
                            <td><center>

                                <asp:GridView ID="GridViewGPUs" runat="server" AutoGenerateColumns="False" DataKeyNames="category,TopicTitle" DataSourceID="SqlDataSourceGPUs" OnDataBound="GridViewGPUs_DataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Topic" SortExpression="TopicTitle">
                                            <EditItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("TopicTitle") %>'></asp:Label>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButtonTopic" runat="server" OnClick="LinkButtonTopicGPUs_Click"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Threads"></asp:TemplateField>
                                        <asp:TemplateField HeaderText="Views"></asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                </center>
                                </td>
                        </tr>
                        <tr>
                            <td><center>Cooling</center></td>
                        </tr>
                        <tr>
                            <td>
                                <center>
                                <asp:GridView ID="GridViewCooling" runat="server" AutoGenerateColumns="False" DataKeyNames="category,TopicTitle" DataSourceID="SqlDataSourceCooling" OnDataBound="GridViewCooling_DataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Topic" SortExpression="TopicTitle">
                                            <EditItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("TopicTitle") %>'></asp:Label>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButtonTopic" runat="server" OnClick="LinkButtonTopicCooling_Click"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Threads"></asp:TemplateField>
                                        <asp:TemplateField HeaderText="Views"></asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                </center>
                                </td>
                        </tr>
                        <tr>
                            <td><center>Memory</center></td>
                        </tr>
                        <tr>
                            <td>
                                <center>
                                <asp:GridView ID="GridViewMemory" runat="server" AutoGenerateColumns="False" DataKeyNames="category,TopicTitle" DataSourceID="SqlDataSourceMemory" OnDataBound="GridViewMemory_DataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Topic" SortExpression="TopicTitle">
                                            <EditItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("TopicTitle") %>'></asp:Label>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButtonTopic" runat="server" OnClick="LinkButtonTopicMemory_Click"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Threads"></asp:TemplateField>
                                        <asp:TemplateField HeaderText="Views"></asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                </center>
                                </td>
                        </tr>
                        <tr>
                            <td><center>Components</center></td>
                        </tr>
                        <tr>
                            <td>&nbsp;<center><asp:GridView ID="GridViewComponents" runat="server" AutoGenerateColumns="False" DataKeyNames="category,TopicTitle" DataSourceID="SqlDataSourceComponents" OnDataBound="GridViewComponents_DataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Topic" SortExpression="TopicTitle">
                                            <EditItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("TopicTitle") %>'></asp:Label>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButtonTopic" runat="server" OnClick="LinkButtonTopicComponents_Click"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Threads"></asp:TemplateField>
                                        <asp:TemplateField HeaderText="Views"></asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                </center>
                                </td>
                        </tr>
                    </table>
                </td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            
        </table>
        <asp:SqlDataSource ID="SqlDataSourceCPUs" runat="server" ConnectionString="<%$ ConnectionStrings:forumConnectionString %>" ProviderName="<%$ ConnectionStrings:forumConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Topic] WHERE category = 'CPUs'"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceGPUs" runat="server" ConnectionString="<%$ ConnectionStrings:forumConnectionString %>" ProviderName="<%$ ConnectionStrings:forumConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Topic] WHERE category = 'GPUs'"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceCooling" runat="server" ConnectionString="<%$ ConnectionStrings:forumConnectionString %>" ProviderName="<%$ ConnectionStrings:forumConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Topic] WHERE category = 'Cooling'"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceMemory" runat="server" ConnectionString="<%$ ConnectionStrings:forumConnectionString %>" ProviderName="<%$ ConnectionStrings:forumConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Topic] WHERE category = 'Memory'"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceComponents" runat="server" ConnectionString="<%$ ConnectionStrings:forumConnectionString %>" ProviderName="<%$ ConnectionStrings:forumConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Topic] WHERE category = 'Components'"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" ConnectionString="<%$ ConnectionStrings:forumConnectionString %>" ProviderName="<%$ ConnectionStrings:forumConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [User] WHERE userName = name_param" InsertCommand="INSERT INTO [User] (userName, datejoined, UserType, [password], email, loggedIn, picFilePath) VALUES (name, passwordParam, userTypeParam, dateParam, emailParam, loggedInParam, picFilePathParam)" DeleteCommand="DELETE FROM [User] WHERE userName = name_param" UpdateCommand="UPDATE [User]
 SET userName = @userName, 
[password] = @password, 
UserType = @UserType, 
datejoined = @datejoined, 
email = @email, 
loggedIn = @loggedIn, 
picFilePath = @picFilePath 
WHERE userName = @userName">
            <DeleteParameters>
                <asp:SessionParameter Name="name_param" SessionField="UserName" />
            </DeleteParameters>
            <InsertParameters>
                <asp:SessionParameter Name="name" SessionField="UserName" />
                <asp:SessionParameter Name="dateParam" SessionField="DateJoined" />
                <asp:SessionParameter Name="passwordParam" SessionField="Password" />
                <asp:SessionParameter Name="emailParam" SessionField="email" />
                <asp:SessionParameter Name="loggedInParam" SessionField="loggedIn" />
                <asp:SessionParameter Name="picFilePathParam" SessionField="picFilePath" />
                <asp:SessionParameter Name="userTypeParam" SessionField="UserTypeNum" DefaultValue="2" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="name_param" SessionField="UserName" />
            </SelectParameters>
            <UpdateParameters>
                <asp:SessionParameter Name="userName" SessionField="UserName" />
                <asp:SessionParameter Name="password" SessionField="Password" />
                <asp:SessionParameter Name="UserType" SessionField="UserTypeNum" />
                <asp:SessionParameter Name="datejoined" SessionField="DateJoined" />
                <asp:SessionParameter Name="email" SessionField="email" />
                <asp:SessionParameter Name="loggedIn" SessionField="loggedIn" />
                <asp:SessionParameter Name="picFilePath" SessionField="picFilePath" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
    </form>
</body>
</html>
