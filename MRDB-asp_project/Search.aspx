<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="MRDB.Search" %>
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
            height: 26px;
        }
        .auto-style3 {
            height: 30px;
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

            <div class="news_box"><div id="title_news"><a href="Search.aspx" class="button"><img src="images/search.png" style="height: 20px; width: 20px" /></a> Search Section</div>

               <div id="news_content"> 
                     
                    Hey, Here you can search for movies by 2 methods, select the one you preffer and run it.<br />
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style2">Search by:</td>
                            <td class="auto-style2"></td>
                        </tr>
                        <tr>
                            <td>Movie Name</td>
                            <td>
                                <asp:TextBox ID="mvName" runat="server"></asp:TextBox>
                                <asp:SqlDataSource ID="byName" runat="server" ConnectionString="<%$ ConnectionStrings:MDBdatabase %>" ProviderName="<%$ ConnectionStrings:MDBdatabase.ProviderName %>" SelectCommand="SELECT * FROM [movie] where Mname Like movPara">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="mvName" Name="movPara" PropertyName="Text" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td>OR</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>Movie Category</td>
                            <td>
                                <asp:DropDownList ID="categoryDropDlist" runat="server" DataSourceID="cateName" DataTextField="cName" DataValueField="cName">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="srcByCateg" runat="server" ConnectionString="<%$ ConnectionStrings:MDBdatabase %>" ProviderName="<%$ ConnectionStrings:MDBdatabase.ProviderName %>" SelectCommand="SELECT movie.mId, movie.mName, movie.mLength, movie.mYear, movie.mReview, movie.[image], movieCategory.mName AS Expr1, movieCategory.cName FROM (movie INNER JOIN movieCategory ON movie.mName = movieCategory.mName) WHERE (movieCategory.cName = csname)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="categoryDropDlist" Name="csname" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="cateName" runat="server" ConnectionString="<%$ ConnectionStrings:MDBdatabase %>" ProviderName="<%$ ConnectionStrings:MDBdatabase.ProviderName %>" SelectCommand="SELECT cName FROM mCategory"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3"></td>
                            <td class="auto-style3">
                                <asp:Button ID="Srcbt" runat="server" Text="Search" OnClick="Srcbt_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                              
                                <asp:Label ID="srchrsult" runat="server" ForeColor="Black"></asp:Label>
                                <br />
                              
                                <asp:GridView ID="srcbyNameGrid" runat="server" AutoGenerateColumns="False" DataSourceID="byName" Visible="False">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Movie Name" SortExpression="mName">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("mName") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:HyperLink ID="movLink" runat="server" NavigateUrl='<%# "MovieInfo.aspx?mID=" + Eval("mID") %>' Text='<%# Bind("mName") %>' Font-Names="Buxton Sketch" ForeColor="Black"></asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="mLength" HeaderText="Movie Length" SortExpression="mLength" />
                                        <asp:BoundField DataField="mYear" HeaderText="Publiched Year" SortExpression="mYear" />
                                        <asp:TemplateField SortExpression="image">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("image") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Image ID="mimg" runat="server" ImageUrl='<%# Bind("image") %>' Height="120px" Width="100px" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        no image
                                    </EmptyDataTemplate>
                                </asp:GridView>
                                 
                                <asp:GridView ID="srcbyCategrid" runat="server" AutoGenerateColumns="False" DataKeyNames="mName" DataSourceID="srcByCateg" Visible="False">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Movie Name" SortExpression="mName">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("mName") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:HyperLink ID="mNamec" runat="server" NavigateUrl='<%# "MovieInfo.aspx?mID=" + Eval("mID") %>' Text='<%# Bind("mName") %>'></asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="mLength" HeaderText="Length" SortExpression="mLength" />
                                        <asp:BoundField DataField="mYear" HeaderText="Year" SortExpression="mYear" />
                                        <asp:TemplateField SortExpression="image">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("image") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Image ID="Image1" runat="server" Height="120px" ImageUrl='<%# Bind("image") %>' Width="100px" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                 
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
