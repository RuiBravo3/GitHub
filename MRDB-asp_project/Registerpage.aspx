<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registerpage.aspx.cs" Inherits="MRDB.Registerpage" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" rel="stylesheet" href="StyleSheet1.css" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 59px;
        }
        .auto-style4 {
        }
        .auto-style5 {
            width: 189px;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">
        <div id="content">
                <div class="header">
                  <p>MRDB- Movies Review Database&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p> 
                </div>
            
        <div class="bar"><asp:Label id="registerBt" runat="server"><img src="images/register.png" style="height: 20px; width: 20px"/><a href='Registerpage.aspx'>Register-</a></asp:Label><img src="images/login.png" style="height: 20px; width: 20px" /><asp:Label id="login" runat="server"><a href='Login.aspx'>Login</a></asp:Label><asp:Label id="logout" runat="server" Visible="False"><a href='Logout.aspx'>Logout</a></asp:Label>
            -<a href="Search.aspx" class="button"><img src="images/search.png" style="height: 20px; width: 20px" /> Search</a>-<a href="Contact.aspx" class="button"><img src="images/contact.png" style="height: 20px; width: 20px"/> Contact</a></div>
            &nbsp;<div class="left_menu">
                <div class="title"><img src="images/toprated.png" style="height: 22px; width: 26px" /> Top Rated</div>
                <div class="leftbox">
                <p>
                    
                        <tr>
                            <td>
                    <asp:GridView ID="topRatedgrid" runat="server" AutoGenerateColumns="False" DataSourceID="topRateddb">
                        <Columns>
                            <asp:BoundField DataField="mName" HeaderText="Name Name" SortExpression="mName" />
                            <asp:BoundField DataField="mLength" HeaderText="Length" SortExpression="mLength" />
                           
                            <asp:BoundField DataField="mYear" HeaderText="Year" SortExpression="mYear" />
                           
                        </Columns>
                        <EmptyDataTemplate>
                            <asp:Label ID="Label1" runat="server" Text="No Data Yet"></asp:Label>
                        </EmptyDataTemplate>
                    </asp:GridView>
                            </td>
                        </tr>
                    </p>
                    </div>
            </div>

              <div class="right_menu">
                <div class="title_r">Last Rates <img src="images/toprr.png" style="height: 20px; width: 21px" /></div>
                  <div class="rightbox">
                <p>
                    
                    <asp:GridView ID="lastRatesGrid" runat="server" AutoGenerateColumns="False" DataSourceID="lastRatedBsrc">
                        <Columns>
                            <asp:BoundField DataField="mYear" HeaderText="Year" SortExpression="mYear" />
                            <asp:BoundField DataField="mLength" HeaderText="Length" SortExpression="mLength" />
                            <asp:BoundField DataField="mName" HeaderText="Movie Name" SortExpression="mName" />
                        </Columns>
                    </asp:GridView>
                    </p>
                      </div>
            </div>
       
                <div class="welcome"><asp:HyperLink ID="sitelbInex" runat="server" NavigateUrl="~/index.aspx">Site Index</asp:HyperLink></div>

            <div class="news_box"><div id="title_news"><img src="images/news.png" style="height: 19px; width: 22px"/> Login Section</div>

                <div id="news_content">
                     
                    Welcome to the register page, please fill the information bellow correcrly in order to process the site and enjoy the real features.<br />
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style4" colspan="3">
                                <asp:Label ID="fnameLb" runat="server" Text="First Name"></asp:Label>
                            &nbsp;&nbsp;
                            </td>
                            <td>
                                <asp:TextBox ID="firstNameTxBox" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldfirst" runat="server" ControlToValidate="firstNameTxBox" ErrorMessage="Must Enter First Name" ForeColor="#CC3300" ValidateRequestMode="Enabled">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4" colspan="3">
                                <asp:Label ID="lastNamelb" runat="server" Text="Last Name"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="LastNametxtBox" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldlast" runat="server" ControlToValidate="LastNametxtBox" ErrorMessage="Must Enter Last Name" ForeColor="#CC3300" ValidateRequestMode="Enabled">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style5" colspan="2">
                                <asp:Label ID="usrNamelb" runat="server" Text="User Name"></asp:Label>
                            </td>
                            <td class="auto-style4" colspan="2">
                                <asp:TextBox ID="usrNameBox" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldusr" runat="server" ControlToValidate="usrNameBox" ErrorMessage="You Must Enter User Name" ForeColor="#CC3300" ValidateRequestMode="Enabled">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">
                                <asp:Label ID="emailLb" runat="server" Text="Email"></asp:Label>
                            </td>
                            <td colspan="3">
                                <center style="text-align: left">
                                    <asp:TextBox ID="emailaddBox" runat="server"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="emailExpchk" runat="server" ControlToValidate="emailaddBox" ErrorMessage="Email Address is worng" ForeColor="#CC3300" ValidateRequestMode="Enabled" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                                </center>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">
                                <asp:Label ID="pswLb" runat="server" Text="Password"></asp:Label>
                            </td>
                            <td colspan="3">
                                <asp:TextBox ID="passBox" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldpass" runat="server" ControlToValidate="passBox" ErrorMessage="You Must Enter Password" ForeColor="#CC3300">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">&nbsp;</td>
                            <td colspan="3">
                                <asp:Label ID="registrationComplete" runat="server"></asp:Label>
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">&nbsp;</td>
                            <td colspan="3">
                                <asp:Button ID="RegisterNow" runat="server" Text="Register NOW!" Width="194px" OnClick="RegisterNow_Click" />
                            </td>
                        </tr>
                    </table>
                     
                </div>
                    </div>

            </div>
        <asp:SqlDataSource ID="topRateddb" runat="server" ConnectionString="<%$ ConnectionStrings:MDBdatabase %>" ProviderName="<%$ ConnectionStrings:MDBdatabase.ProviderName %>" SelectCommand="SELECT movie.mName, movie.mLength, movie.mYear FROM (movie INNER JOIN (SELECT mName AS m, AVG(uRating) AS Expr1 FROM rating GROUP BY mName) derivedtbl_1 ON movie.mName = derivedtbl_1.m) WHERE (derivedtbl_1.Expr1 &gt;= 8)"></asp:SqlDataSource>
        <asp:SqlDataSource ID="lastRatedBsrc" runat="server" ConnectionString="<%$ ConnectionStrings:MDBdatabase %>" ProviderName="<%$ ConnectionStrings:MDBdatabase.ProviderName %>" SelectCommand="SELECT mName, mLength, mYear FROM movie WHERE mName IN (SELECT TOP 10 mName FROM rating ORDER BY mName ASC)"></asp:SqlDataSource>
    </form>
</body>
</html>
