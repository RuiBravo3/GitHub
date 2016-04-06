<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="AI_Peg_Solitaire.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Your contact page.</h3>
    <address>
         Sami Shamoon College of Engineering<br />
        <strong>College:</strong>   <a href="mailto:info@sce.ac.il">info@sce.ac.il</a><br />
        Ashdod, IL 77245<br />
        <abbr title="Phone">P:</abbr>
        1-800-207-777
        <a href="http://www.sce.ac.il/">http://www.sce.ac.il/</a>
    </address>

    <address>
        <strong>Author:</strong>   <a href="mailto:gabrima@ac.sce.ac.il">gabrima@ac.sce.ac.il</a><br />
        <strong>Author:</strong> <a href="mailto:kuturga@gmail.com">kuturga@gmail.com</a>
    </address>
</asp:Content>
