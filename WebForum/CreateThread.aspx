<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateThread.aspx.cs" Inherits="WebForum.CreateThread" %>

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
        .auto-style11 {
            width: 100%;
        }
        .auto-style12 {
            width: 78px;
        }
        .auto-style13 {
            width: 77px;
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
                    <asp:Label ID="LabelTopic" runat="server" style="font-size: 18pt"></asp:Label>
                        </center>
                    <br />
                    <table class="auto-style11">
                        <tr>
                            <td class="auto-style12">Topic : </td>
                            <td>
                                <asp:TextBox ID="TextBoxTitle" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorTitle" runat="server" ControlToValidate="TextBoxTitle" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table class="auto-style11">
                        <tr>
                            <td class="auto-style13">Post :&nbsp;&nbsp;&nbsp;&nbsp; </td>
                            <td>
                                <asp:TextBox ID="TextBoxPost" runat="server" TextMode="MultiLine"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorTitle0" runat="server" ControlToValidate="TextBoxPost" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;<asp:Button ID="ButtonSubmitThread" runat="server" Text="Submit" OnClick="ButtonSubmitThread_Click" />
                            </td>
                        </tr>
                    </table>
                    <br />
&nbsp;&nbsp;&nbsp;
                    <br />
&nbsp;<br />
                </td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            
        </table>
    
    </div>
        <asp:SqlDataSource ID="SqlDataSourceThread" runat="server" ConnectionString="<%$ ConnectionStrings:forumConnectionString %>" DeleteCommand="DELETE FROM [Thread] WHERE (([Category] = ?) OR ([Category] IS NULL AND ? IS NULL)) AND (([TopicTitle] = ?) OR ([TopicTitle] IS NULL AND ? IS NULL)) AND (([ThreadNumber] = ?) OR ([ThreadNumber] IS NULL AND ? IS NULL))" InsertCommand="INSERT INTO [Thread] ([Category], [TopicTitle], [ThreadTitle], [ThreadNumber], [ThreadViews], [DateCreated]) VALUES (?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:forumConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Thread] WHERE (([Category] = ?) AND ([TopicTitle] = ?))" UpdateCommand="UPDATE [Thread] SET [ThreadTitle] = ?, [ThreadViews] = ?, [DateCreated] = ? WHERE (([Category] = ?) OR ([Category] IS NULL AND ? IS NULL)) AND (([TopicTitle] = ?) OR ([TopicTitle] IS NULL AND ? IS NULL)) AND (([ThreadNumber] = ?) OR ([ThreadNumber] IS NULL AND ? IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="Category" Type="String" />
                <asp:Parameter Name="TopicTitle" Type="String" />
                <asp:Parameter Name="ThreadNumber" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:SessionParameter Name="Category" SessionField="Category" Type="String" />
                <asp:SessionParameter Name="TopicTitle" SessionField="Topic" Type="String" />
                <asp:ControlParameter ControlID="TextBoxTitle" Name="ThreadTitle" PropertyName="Text" Type="String" />
                <asp:SessionParameter Name="ThreadNumber" SessionField="ThreadNumber" Type="Int32" />
                <asp:Parameter DefaultValue="0" Name="ThreadViews" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="DateCreated" SessionField="Date" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="Category" SessionField="Category" Type="String" />
                <asp:SessionParameter Name="TopicTitle" SessionField="Topic" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="ThreadTitle" Type="String" />
                <asp:Parameter Name="ThreadViews" Type="Int32" />
                <asp:Parameter Name="DateCreated" Type="String" />
                <asp:Parameter Name="Category" Type="String" />
                <asp:Parameter Name="TopicTitle" Type="String" />
                <asp:Parameter Name="ThreadNumber" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourcePost" runat="server" ConnectionString="<%$ ConnectionStrings:forumConnectionString %>" DeleteCommand="DELETE FROM [Post] WHERE (([Category] = ?) OR ([Category] IS NULL AND ? IS NULL)) AND (([TopicTItle] = ?) OR ([TopicTItle] IS NULL AND ? IS NULL)) AND (([ThreadNumber] = ?) OR ([ThreadNumber] IS NULL AND ? IS NULL)) AND (([PostNumber] = ?) OR ([PostNumber] IS NULL AND ? IS NULL))" InsertCommand="INSERT INTO [Post] ([Category], [TopicTItle], [ThreadNumber], [PostNumber], [Content], [PostDate], [UserName]) VALUES (?, ?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:forumConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Post]" UpdateCommand="UPDATE [Post] SET [Content] = ?, [PostDate] = ?, [UserName] = ? WHERE (([Category] = ?) OR ([Category] IS NULL AND ? IS NULL)) AND (([TopicTItle] = ?) OR ([TopicTItle] IS NULL AND ? IS NULL)) AND (([ThreadNumber] = ?) OR ([ThreadNumber] IS NULL AND ? IS NULL)) AND (([PostNumber] = ?) OR ([PostNumber] IS NULL AND ? IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="Category" Type="String" />
                <asp:Parameter Name="TopicTItle" Type="String" />
                <asp:Parameter Name="ThreadNumber" Type="Int32" />
                <asp:Parameter Name="PostNumber" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:SessionParameter Name="Category" SessionField="Category" Type="String" />
                <asp:SessionParameter Name="TopicTItle" SessionField="Topic" Type="String" />
                <asp:SessionParameter Name="ThreadNumber" SessionField="ThreadNumber" Type="Int32" />
                <asp:Parameter DefaultValue="1" Name="PostNumber" Type="Int32" />
                <asp:ControlParameter ControlID="TextBoxPost" DefaultValue="" Name="Content" PropertyName="Text" Type="String" />
                <asp:SessionParameter Name="PostDate" SessionField="Date" Type="String" />
                <asp:SessionParameter Name="UserName" SessionField="UserName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Content" Type="String" />
                <asp:Parameter Name="PostDate" Type="String" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="Category" Type="String" />
                <asp:Parameter Name="TopicTItle" Type="String" />
                <asp:Parameter Name="ThreadNumber" Type="Int32" />
                <asp:Parameter Name="PostNumber" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
