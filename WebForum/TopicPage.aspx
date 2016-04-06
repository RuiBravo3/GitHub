<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TopicPage.aspx.cs" Inherits="WebForum.TopicPage" %>

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
            width: 1283px;
        }
        .auto-style10 {
            width: 126px;
        }
        .auto-style6 {
            width: 186px;
        }
        .auto-style9 {
            width: 3647px;
        }
        .auto-style8 {
            width: 1283px;
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
                    <asp:GridView ID="GridViewThreads" runat="server" DataSourceID="SqlDataSourceThreads" AutoGenerateColumns="False" OnDataBound="GridViewThreads_DataBound">
                        <Columns>
                            <asp:TemplateField HeaderText="Thread" SortExpression="ThreadTitle">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ThreadTitle") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButtonThread" runat="server" OnClick="LinkButtonThread_Click"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Replies"></asp:TemplateField>
                            <asp:BoundField DataField="ThreadViews" HeaderText="Views" SortExpression="ThreadViews" />
                        </Columns>
                    </asp:GridView>
                        <br />
                        <br />
                        <asp:LinkButton ID="LinkButtonCreateThread" runat="server" OnClick="LinkButtonCreateThread_Click">Create new thread</asp:LinkButton>
                        <br />
                    </center>
                </td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            
        </table>
        <asp:SqlDataSource ID="SqlDataSourceThreads" runat="server" ConnectionString="<%$ ConnectionStrings:forumConnectionString %>" ProviderName="<%$ ConnectionStrings:forumConnectionString.ProviderName %>" SelectCommand="SELECT ThreadTitle, ThreadViews, ThreadNumber, DateCreated FROM Thread WHERE (Category = CategoryParam) AND (TopicTitle = TopicParam)" DeleteCommand="DELETE FROM Thread WHERE ThreadNumber = ThreadNumberParam" InsertCommand="INSERT INTO Thread(Category, TopicTitle, ThreadTitle, ThreadNumber, ThreadViews, DateCreated) VALUES (CategoryParam, TopicParam, ThreadTitleParam, ThreadNumberParam, ThreadViewsParam, ThreadDateCreatedParam)" UpdateCommand="UPDATE Thread SET Category =@Category, TopicTitle =@TopicTitle, ThreadTitle =@ThreadTitle, ThreadNumber =@ThreadNumber, ThreadViews =@ThreadViews, DateCreated =@DateCreated WHERE Category =@Category AND TopicTitle =@TopicTitle AND ThreadNumber =@ThreadNumber">
            <DeleteParameters>
                <asp:SessionParameter Name="ThreadNumberParam" SessionField="ThreadNumber" />
            </DeleteParameters>
            <InsertParameters>
                <asp:SessionParameter Name="CategoryParam" SessionField="Category" />
                <asp:SessionParameter Name="TopicParam" SessionField="Topic" />
                <asp:SessionParameter Name="ThreadTitleParam" SessionField="ThreadTitle" />
                <asp:SessionParameter Name="ThreadNumberParam" SessionField="ThreadNumber" />
                <asp:SessionParameter Name="ThreadViewsParam" SessionField="ThreadViews" />
                <asp:SessionParameter Name="ThreadDateCreatedParam" SessionField="ThreadDateCreated" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="CategoryParam) " SessionField="Category" />
                <asp:SessionParameter Name="TopicParam" SessionField="Topic" />
            </SelectParameters>
            <UpdateParameters>
                <asp:SessionParameter Name="Category" SessionField="Category" />
                <asp:SessionParameter Name="TopicTitle" SessionField="Topic" />
                <asp:SessionParameter Name="ThreadTitle" SessionField="ThreadTitle" />
                <asp:SessionParameter Name="ThreadNumber" SessionField="ThreadNumber" />
                <asp:SessionParameter Name="ThreadViews" SessionField="ThreadViews" />
                <asp:SessionParameter Name="DateCreated" SessionField="ThreadDateCreated" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
