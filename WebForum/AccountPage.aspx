<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccountPage.aspx.cs" Inherits="WebForum.AccountPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
        }
        .auto-style7 {
            height: 40px;
            width: 378px;
        }
        .auto-style10 {
            width: 89px;
        }
        .auto-style11 {
            width: 319px;
            height: 40px;
        }
        .auto-style12 {
            width: 1126px;
            height: 40px;
        }
        .auto-style15 {
            width: 1126px;
            height: 123px;
        }
        .auto-style16 {
            width: 100%;
        }
        .auto-style17 {
            width: 140px;
        }
        .auto-style19 {
            height: 26px;
        }
        .auto-style20 {
            width: 319px;
            height: 123px;
        }
        .auto-style21 {
            height: 26px;
            width: 140px;
        }
        .auto-style22 {
            width: 144px;
        }
        .auto-style23 {
            height: 26px;
            width: 144px;
        }
        .auto-style24 {
            width: 144px;
            height: 23px;
        }
        .auto-style25 {
            width: 140px;
            height: 23px;
        }
        .auto-style26 {
            height: 23px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style11"></td>
                <td class="auto-style12">
                    <center>
                        <asp:LinkButton ID="LinkButtonTekJunkies" runat="server" OnClick="LinkButtonTekJunkies_Click" style="font-size: xx-large">Tek Junkies</asp:LinkButton>
                        <br />
                        <br />
                    <asp:Label ID="Title" runat="server" style="font-size: x-large" Text="Account Page"></asp:Label>
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
            </tr>
            <tr>
                <td class="auto-style20"></td>
                <td class="auto-style15">
                    <asp:Label ID="LabelAccountName" runat="server" style="font-size: xx-large"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="ButtonDeleteUser" runat="server" OnClick="ButtonDeleteUser_Click" Text="Delete user" Visible="False" />
                    <br />
                    <br />
                    Joined in :
                    <asp:Label ID="LabelJoinedIn" runat="server"></asp:Label>
                    <br />
                    Posts :
                    <asp:Label ID="LabelPosts" runat="server"></asp:Label>
                    <br />
                    <asp:Image ID="ImageAvatar" runat="server" Height="100px" Width="100px" />
                    <br />
                    <br />
                    <asp:LinkButton ID="LinkButtonUploadFile" runat="server" OnClick="LinkButtonUploadFile_Click">Upload new avatar</asp:LinkButton>
                    <br />
                    <asp:FileUpload ID="FileUploadPic" runat="server" Visible="False" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="ButtonUploadFile" runat="server" OnClick="ButtonUploadFile_Click" Text="Upload file" Visible="False" />
                    <br />
                    <table class="auto-style16">
                        <tr>
                            <td class="auto-style22">
                                <asp:Label ID="LabelEmail" runat="server"></asp:Label>
                            </td>
                            <td class="auto-style17">
                                <asp:LinkButton ID="LinkButtonChangeMail" runat="server" OnClick="LinkButtonChangeMail_Click">Change eMail</asp:LinkButton>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style22">
                                <asp:Label ID="LabelnewEmail" runat="server" style="font-size: 12pt" Text="Type new email :     " Visible="False"></asp:Label>
                            </td>
                            <td class="auto-style17">
                                <asp:TextBox ID="TextBoxNewEmail" runat="server" Visible="False"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="TextBoxNewEmail" ErrorMessage="*" ForeColor="Red" Visible="False"></asp:RequiredFieldValidator>
                                <asp:CustomValidator ID="CustomValidatorEmail" runat="server" ControlToValidate="TextBoxNewEmail" ErrorMessage="Invalid email address." ForeColor="Red" OnServerValidate="CustomValidatorEmail_ServerValidate" ValidateEmptyText="true" Visible="False"></asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style22">
                                <asp:LinkButton ID="LinkButtonConfirmEmail" runat="server" Visible="False" OnClick="LinkButtonConfirmEmail_Click">Confirm</asp:LinkButton>
                            </td>

                        </tr>
                        <tr>
                            <td class="auto-style24">
                                <asp:LinkButton ID="LinkButtonChangePassword" runat="server" OnClick="LinkButtonChangePassword_Click">Change password</asp:LinkButton>
                            </td>
                            <td class="auto-style25"></td>
                            <td class="auto-style26"></td>
                        </tr>
                        <tr>
                            <td class="auto-style22">
                                <asp:Label ID="LabelnewTypePassword" runat="server" style="font-size: 12pt" Text="Type new password :     " Visible="False"></asp:Label>
                            </td>
                            <td class="auto-style17">
                                <asp:TextBox ID="TextBoxNewPassword" runat="server" Visible="False" TextMode="Password"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ControlToValidate="TextBoxNewPassword" ErrorMessage="*" ForeColor="Red" Visible="False"></asp:RequiredFieldValidator>
                                <asp:CustomValidator ID="CustomValidatorPassword" runat="server" ControlToValidate="TextBoxNewPassword" ErrorMessage="Password must be between 6 to 12 characters." ForeColor="Red" OnServerValidate="CustomValidatorPassword_ServerValidate" ValidateEmptyText="true" Visible="False"></asp:CustomValidator>
                                </td>
                        </tr>
                        <tr>
                            <td class="auto-style23">
                                <asp:Label ID="LabelnewReTypePassword" runat="server" style="font-size: 12pt" Text="Retype password :     " Visible="False"></asp:Label>
                            </td>
                            <td class="auto-style21">
                                <asp:TextBox ID="TextBoxRetypePassword" runat="server" Visible="False" TextMode="Password"></asp:TextBox>
                            </td>
                            <td class="auto-style19">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorRetypePassword0" runat="server" ControlToValidate="TextBoxRetypePassword" ErrorMessage="*" ForeColor="Red" Visible="False"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidatorPassword" runat="server" ControlToCompare="TextBoxNewPassword" ControlToValidate="TextBoxRetypePassword" ErrorMessage="Both passwords don't math." ForeColor="Red" ValidateEmptyText="true" Visible="False"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style22">
                                <asp:LinkButton ID="LinkButtonConfirmPassword" runat="server" Visible="False" OnClick="LinkButtonConfirmPassword_Click">Confirm</asp:LinkButton>
                                <br />
                                <br />
                                <td class="auto-style17">
                                    &nbsp;</td>
                                
                            </td>
                        </tr>
                    </table>
                    <td>
                        <asp:Label ID="LabelThreadsUserName" runat="server"></asp:Label>
&nbsp;Posted on the following threads:<br />
                        <br />
                        <asp:GridView ID="GridViewThreads" runat="server" AutoGenerateColumns="False" DataKeyNames="Category,TopicTitle,ThreadNumber" DataSourceID="SqlDataSourceAllTHreads" OnDataBound="GridViewThreads_DataBound" OnSelectedIndexChanged="GridViewThreads_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="Category" HeaderText="Category" ReadOnly="True" SortExpression="Category" />
                                <asp:TemplateField HeaderText="Topic" SortExpression="TopicTitle">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("TopicTitle") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButtonTopic" runat="server" Text='<%# Eval("TopicTitle") %>' OnClick="LinkButtonTopic_Click"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Thread" SortExpression="ThreadTitle">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ThreadTitle") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButtonThread" runat="server" Text='<%# Eval("ThreadTitle") %>' OnClick="LinkButtonThread_Click"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="ThreadNumber" SortExpression="ThreadNumber">
                                    <EditItemTemplate>
                                        <asp:DynamicControl ID="DynamicControl1" runat="server" DataField="ThreadNumber" Mode="Edit" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="LabelThreadNumber" runat="server" Text='<%# Bind("ThreadNumber") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                </td>
                    <tr>
                        <td>
                            <br />
                        </td>
                         <td>
                             <asp:LinkButton ID="LinkButtonShowPMDialog" runat="server" OnClick="LinkButtonShowPMDialog_Click">SendPM</asp:LinkButton>
                             <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             <table class="auto-style16">
                                 <tr>
                                     <td>
                                         <asp:Label ID="LabelSendTo" runat="server" Text="Send to : " Visible="False"></asp:Label>
                                         <br />
                                         <br />
                                         <asp:Label ID="LabelMessage" runat="server" Text="Message : " Visible="False"></asp:Label>
                                         <br />
                                         <br />
                                         <br />
                                     </td>
                                     <td>
                                         <asp:TextBox ID="TextBoxPMUserName" runat="server" Visible="False"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPMUserName" runat="server" ControlToValidate="TextBoxPMUserName" ErrorMessage="*" ForeColor="Red" Visible="False"></asp:RequiredFieldValidator>
                                         <asp:CustomValidator ID="CustomValidatorUserNotFound" runat="server" ControlToValidate="TextBoxPMUserName" ErrorMessage="User name not found." ForeColor="Red" OnServerValidate="CustomValidatorUserNotFound_ServerValidate"></asp:CustomValidator>
                                         <br />
                                         <br />
                                         <asp:TextBox ID="TextBoxMessage" runat="server" TextMode="MultiLine" Visible="False"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPMUMessage" runat="server" ControlToValidate="TextBoxMessage" ErrorMessage="*" ForeColor="Red" Visible="False"></asp:RequiredFieldValidator>
                                         <br />
                                         <br />
                                         <asp:Button ID="ButtonSendPM" runat="server" Text="Send" Visible="False" OnClick="ButtonSendPM_Click" />
                                     </td>
                                 </tr>
                             </table>
                             <br />
                             <asp:LinkButton ID="LinkButtonInbox" runat="server" OnClick="LinkButtonInbox_Click">Show recieved PMs</asp:LinkButton>
                             <br />
                             <asp:LinkButton ID="LinkButtonOutbox" runat="server" OnClick="LinkButtonOutbox_Click">Show sent PMs</asp:LinkButton>
                             <br />
                             <br />
                             <asp:GridView ID="GridViewInbox" runat="server" Visible="False" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSourceInbox">
                                 <Columns>
                                     <asp:TemplateField HeaderText="Sender" SortExpression="Sender">
                                         <EditItemTemplate>
                                             <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Sender") %>'></asp:TextBox>
                                         </EditItemTemplate>
                                         <ItemTemplate>
                                             <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Text='<%# Bind("Sender") %>'></asp:LinkButton>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Reciever" SortExpression="Reciever">
                                         <EditItemTemplate>
                                             <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Reciever") %>'></asp:TextBox>
                                         </EditItemTemplate>
                                         <ItemTemplate>
                                             <asp:LinkButton ID="LinkButton2" runat="server" Text='<%# Bind("Reciever") %>'></asp:LinkButton>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                     <asp:BoundField DataField="PMDate" HeaderText="PMDate" SortExpression="PMDate" />
                                     <asp:BoundField DataField="Content" HeaderText="Content" SortExpression="Content" />
                                 </Columns>
                             </asp:GridView>
                             <asp:GridView ID="GridViewOutbox" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSourceOutbox" Visible="False">
                                 <Columns>
                                     <asp:TemplateField HeaderText="Sender" SortExpression="Sender">
                                         <EditItemTemplate>
                                             <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Sender") %>'></asp:TextBox>
                                         </EditItemTemplate>
                                         <ItemTemplate>
                                             <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton1_Click" Text='<%# Bind("Sender") %>'></asp:LinkButton>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Reciever" SortExpression="Reciever">
                                         <EditItemTemplate>
                                             <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Reciever") %>'></asp:TextBox>
                                         </EditItemTemplate>
                                         <ItemTemplate>
                                             <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click" Text='<%# Bind("Reciever") %>'></asp:LinkButton>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                     <asp:BoundField DataField="PMDate" HeaderText="PMDate" SortExpression="PMDate" />
                                     <asp:BoundField DataField="Content" HeaderText="Content" SortExpression="Content" />
                                 </Columns>
                             </asp:GridView>
                            <br />
                        </td>
                    </tr>
               
                </td>
            </tr>
        </table>
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
                <asp:SessionParameter Name="name_param" SessionField="APUserName" />
            </DeleteParameters>
            <InsertParameters>
                <asp:SessionParameter Name="name" SessionField="APUserName" />
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
                <asp:SessionParameter Name="userName" SessionField="APUserName" />
                <asp:SessionParameter Name="password" SessionField="Password" />
                <asp:SessionParameter Name="UserType" SessionField="UserTypeNum" />
                <asp:SessionParameter Name="datejoined" SessionField="DateJoined" />
                <asp:SessionParameter Name="email" SessionField="email" />
                <asp:SessionParameter Name="loggedIn" SessionField="loggedIn" />
                <asp:SessionParameter Name="picFilePath" SessionField="picFilePath" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceAllUsers" runat="server" ConnectionString="<%$ ConnectionStrings:forumConnectionString %>" ProviderName="<%$ ConnectionStrings:forumConnectionString.ProviderName %>" SelectCommand="SELECT [userName] FROM [User]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourcePM" runat="server" ConnectionString="<%$ ConnectionStrings:forumConnectionString %>" ProviderName="<%$ ConnectionStrings:forumConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [PM]" InsertCommand="INSERT INTO PM(ID, PMDate, Content, Sender, Reciever) VALUES (IDParam, PMDateParam, ContentParam, SenderParam, RecieverParam)">
            <InsertParameters>
                <asp:SessionParameter Name="IDParam" SessionField="PMID" />
                <asp:SessionParameter Name="PMDateParam" SessionField="Date" />
                <asp:ControlParameter ControlID="TextBoxMessage" Name="ContentParam" PropertyName="Text" />
                <asp:SessionParameter Name="SenderParam" SessionField="UserName" />
                <asp:ControlParameter ControlID="TextBoxPMUserName" Name="RecieverParam" PropertyName="Text" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceInbox" runat="server" ConnectionString="<%$ ConnectionStrings:forumConnectionString %>" ProviderName="<%$ ConnectionStrings:forumConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [PM] WHERE ([Reciever] = ?)">
            <SelectParameters>
                <asp:SessionParameter Name="Reciever" SessionField="APUserName" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceOutbox" runat="server" ConnectionString="<%$ ConnectionStrings:forumConnectionString %>" ProviderName="<%$ ConnectionStrings:forumConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [PM] WHERE ([Sender] = ?)">
            <SelectParameters>
                <asp:SessionParameter Name="Sender" SessionField="APUserName" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourcePosts" runat="server" ConnectionString="<%$ ConnectionStrings:forumConnectionString %>" ProviderName="<%$ ConnectionStrings:forumConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Post] WHERE ([UserName] = ?)">
            <SelectParameters>
                <asp:SessionParameter Name="UserName" SessionField="APUserName" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceAllTHreads" runat="server" ConnectionString="<%$ ConnectionStrings:forumConnectionString %>" ProviderName="<%$ ConnectionStrings:forumConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Thread]"></asp:SqlDataSource>
    </form>
</body>
</html>
