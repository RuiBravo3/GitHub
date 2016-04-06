<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ERROR404.aspx.cs" Inherits="MRDB.ERROR404" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" rel="stylesheet" href="StyleSheet1.css" />
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
       
                <div class="welcome">
                </div>

            <div class="news_box"><div id="title_news"><img src="images/news.png" style="height: 19px; width: 22px"/> ERROR</div>

            <div id="news_content">
                     
                    ERROR: YOU CANT ACCESS THIS PAGE... YOU ARE NOW MOVING TO THE SITE INDEX!</div>

            </div>
                
            </div>
        <asp:SqlDataSource ID="topRateddb" runat="server" ConnectionString="<%$ ConnectionStrings:MDBdatabase %>" ProviderName="<%$ ConnectionStrings:MDBdatabase.ProviderName %>" SelectCommand="SELECT movie.mName, movie.mLength, movie.mYear FROM (movie INNER JOIN (SELECT mName AS m, AVG(uRating) AS Expr1 FROM rating GROUP BY mName) derivedtbl_1 ON movie.mName = derivedtbl_1.m) WHERE (derivedtbl_1.Expr1 &gt;= 8)"></asp:SqlDataSource>
        <asp:SqlDataSource ID="msgDBcon" runat="server" ConnectionString="<%$ ConnectionStrings:MRDBmessages %>" ProviderName="<%$ ConnectionStrings:MRDBmessages.ProviderName %>" SelectCommand="SELECT * FROM [messages]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="lastRatedBsrc" runat="server" ConnectionString="<%$ ConnectionStrings:MDBdatabase %>" ProviderName="<%$ ConnectionStrings:MDBdatabase.ProviderName %>" SelectCommand="SELECT mName, mLength, mYear FROM movie WHERE mName IN (SELECT TOP 10 mName FROM rating ORDER BY mName ASC)"></asp:SqlDataSource>
    </form>
</body>
</html>
