<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MovieInfo.aspx.cs" Inherits="MRDB.MovieInfo" %>
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
            width: 123px;
        }
        .auto-style3 {
            width: 138px;
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

            <div class="news_box"><div id="title_news"><img src="images/news.png" style="height: 19px; width: 22px"/> Movie Information</div>
               
               <div id="news_content"> 
                     
                    <asp:GridView ID="rateGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="mName" DataSourceID="getrate">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    Movie Rate:
                                    <asp:Label ID="movRate" runat="server" Text='<%# Bind("rate") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <asp:Label ID="notrated" runat="server" ForeColor="#FFCC00" Text="Not rated yet."></asp:Label>
                        </EmptyDataTemplate>
                    </asp:GridView>
                    <asp:GridView ID="movieInfoGrid" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <table class="auto-style1">
                                        <tr>
                                            <td class="auto-style2">Movie Name:
                                                <asp:Label ID="mName" runat="server" style="font-size: x-large" Text='<%# Bind("mName") %>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Image ID="Image1" runat="server" Height="150px" ImageUrl='<%# Bind("image") %>' Width="120px" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Movie Length:<asp:Label ID="mlength" runat="server" Text='<%# Bind("mLength") %>'></asp:Label>
                                                min</td>
                                            <td>Published on:<asp:Label ID="mYear" runat="server" Text='<%# Bind("mYear") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">Review:
                                                <asp:Label ID="mReview" runat="server" Text='<%# Bind("mReview") %>'></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    Users Reviews:<br />
                    <asp:GridView ID="cmtGrid" runat="server" AutoGenerateColumns="False" DataSourceID="usrRevdb">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <table class="auto-style1">
                                        <tr id="back_">
                                            <td class="auto-style3">User name:<asp:Label ID="uNamec" runat="server" Text='<%# Bind("username") %>'></asp:Label>
                                            </td>
                                            <td>rate:
                                                <asp:Label ID="ratel" runat="server" Text='<%# Bind("uRating") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">comment:
                                                <asp:Label ID="cmtl" runat="server" Text='<%# Bind("comments") %>'></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <br />
                    Post Review:<br />
                    <table class="auto-style1">
                        <tr>
                            <td>User Name:</td>
                            <td>
                                <asp:Label ID="usrIflog" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>Rate:</td>
                            <td> 

                                <asp:TextBox ID="ratebox" runat="server" Width="24px"></asp:TextBox>
&nbsp;<asp:RangeValidator ID="rangeval" runat="server" ControlToValidate="ratebox" ErrorMessage="Rate is between 1 - 10" ForeColor="#CC3300" MaximumValue="10" MinimumValue="1" Type="Integer"></asp:RangeValidator>

                            </td>
                        </tr>
                        <tr>
                            <td>Review:</td>
                            <td>
                                <asp:TextBox ID="reviewBox" runat="server" Height="133px" Width="379px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Button ID="postRevbt" runat="server" OnClick="postRevbt_Click" Text="Post Review" Width="217px" />
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Label ID="msg" runat="server" ForeColor="#CC3300"></asp:Label>
                                <asp:Label ID="msgOk" runat="server" ForeColor="#006600"></asp:Label>
                            </td>
                        </tr>
                    </table>
                     
                </div>
            <!-- <div id="footer">All rights reserved to MRDB<asp:Label id="adminPn" runat="server" Visible="False" class="welcome"><img src="images/register.png" style="height: 15px; width: 15px"/><a href='AdminPanel.aspx'>Admin Panel</a></asp:Label>
                <br /></div> -->
              
            </div>  
        </div>
            
        <asp:SqlDataSource ID="topRateddb" runat="server" ConnectionString="<%$ ConnectionStrings:MDBdatabase %>" ProviderName="<%$ ConnectionStrings:MDBdatabase.ProviderName %>" SelectCommand="SELECT movie.mName, movie.mLength, movie.mYear FROM (movie INNER JOIN (SELECT mName AS m, AVG(uRating) AS Expr1 FROM rating GROUP BY mName) derivedtbl_1 ON movie.mName = derivedtbl_1.m) WHERE (derivedtbl_1.Expr1 &gt;= 8)"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MDBdatabase %>" ProviderName="<%$ ConnectionStrings:MDBdatabase.ProviderName %>" SelectCommand="SELECT * FROM [movie] where mID=movID">
            <SelectParameters>
                <asp:QueryStringParameter Name="movID" QueryStringField="mId" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="lastRatedBsrc" runat="server" ConnectionString="<%$ ConnectionStrings:MDBdatabase %>" ProviderName="<%$ ConnectionStrings:MDBdatabase.ProviderName %>" SelectCommand="SELECT mName, mLength, mYear FROM movie WHERE mName IN (SELECT TOP 10 mName FROM rating ORDER BY mName ASC)"></asp:SqlDataSource>
        <asp:SqlDataSource ID="getrate" runat="server" ConnectionString="<%$ ConnectionStrings:MDBdatabase %>" ProviderName="<%$ ConnectionStrings:MDBdatabase.ProviderName %>" SelectCommand="SELECT mName ,avg(uRating) as rate FROM [rating]  where mName = movName group by mName">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="" Name="movName" SessionField="movieName" />
            </SelectParameters>
        </asp:SqlDataSource>
            
        <asp:SqlDataSource ID="usrRevdb" runat="server" ConnectionString="<%$ ConnectionStrings:MDBdatabase %>" ProviderName="<%$ ConnectionStrings:MDBdatabase.ProviderName %>" SelectCommand="SELECT        username, mName, uRating, comments
FROM            rating
WHERE        (mName IN
                             (SELECT        mName
                               FROM            movie
                               WHERE        (mId = id)))">
            <SelectParameters>
                <asp:QueryStringParameter Name="id" QueryStringField="mID" />
            </SelectParameters>
        </asp:SqlDataSource>
            
    </form>

</body>
</html>
