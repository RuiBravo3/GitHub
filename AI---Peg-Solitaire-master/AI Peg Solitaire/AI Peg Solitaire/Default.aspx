<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AI_Peg_Solitaire._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron" style="text-align: center" >
        <h1>Board View</h1>
        <asp:Panel id="PegBoard" runat="server">
            <asp:RadioButton ID="rb1" Checked="true" runat="server"/>
            <asp:RadioButton ID="rb2" Checked="true" runat="server"/>
            <asp:RadioButton ID="rb3" Checked="true" runat="server"/>
            <br></br>
            <asp:RadioButton ID="rb4" Checked="true" runat="server"/>
            <asp:RadioButton ID="rb5" Checked="true" runat="server"/>
            <asp:RadioButton ID="rb6" Checked="true" runat="server"/>
            <br></br>
            <asp:RadioButton ID="rb7" Checked="true" runat="server"/>
            <asp:RadioButton ID="rb8" Checked="true" runat="server"/>
            <asp:RadioButton ID="rb9" Checked="true" runat="server"/>
            <asp:RadioButton ID="rb10" Checked="true" runat="server"/>
            <asp:RadioButton ID="rb11" Checked="true" runat="server"/>
            <asp:RadioButton ID="rb12" Checked="true" runat="server"/>
            <asp:RadioButton ID="rb13" Checked="true" runat="server"/>
            <asp:RadioButton ID="rb14" Checked="true" runat="server"/>
            <asp:RadioButton ID="rb15" Checked="true" runat="server"/>
            <br></br>
            <asp:RadioButton ID="rb16" Checked="true" runat="server"/>
            <asp:RadioButton ID="rb17" Checked="true" runat="server"/>
            <asp:RadioButton ID="rb18" Checked="true" runat="server"/>
            <asp:RadioButton ID="rb19" Checked="true" runat="server"/>
            <asp:RadioButton ID="rb20" Checked="false" runat="server"/>
            <asp:RadioButton ID="rb21" Checked="true" runat="server"/>
            <asp:RadioButton ID="rb22" Checked="true" runat="server"/>
            <asp:RadioButton ID="rb23" Checked="true" runat="server"/>
            <asp:RadioButton ID="rb24" Checked="true" runat="server"/>
            <br></br>
            <asp:RadioButton ID="rb25" Checked="true" runat="server"/>
            <asp:RadioButton ID="rb26" Checked="true" runat="server"/>
            <asp:RadioButton ID="rb27" Checked="true" runat="server"/>
            <asp:RadioButton ID="rb28" Checked="true" runat="server"/>
            <asp:RadioButton ID="rb29" Checked="true" runat="server"/>
            <asp:RadioButton ID="rb30" Checked="true" runat="server"/>
            <asp:RadioButton ID="rb31" Checked="true" runat="server"/>
            <asp:RadioButton ID="rb32" Checked="true" runat="server"/>
            <asp:RadioButton ID="rb33" Checked="true" runat="server"/>
            <br></br>
            <asp:RadioButton ID="rb34" Checked="true" runat="server"/>
            <asp:RadioButton ID="rb35" Checked="true" runat="server"/>
            <asp:RadioButton ID="rb36" Checked="true" runat="server"/>
            <br></br>
            <asp:RadioButton ID="rb37" Checked="true" runat="server"/>
            <asp:RadioButton ID="rb38" Checked="true" runat="server"/>
            <asp:RadioButton ID="rb39" Checked="true" runat="server"/>
        </asp:Panel>
        <p><Button class="btn btn-primary btn-lg">Solve &raquo;</Button></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>BFS</h2>
            <p>Breadth-first search (BFS) is an algorithm for traversing or searching tree or graph data structures. It starts at the tree root (or some arbitrary node of a graph, sometimes referred to as a 'search key') and explores the neighbor nodes first, before moving to the next level neighbors.</br>BFS was invented in the late 1950s by E. F. Moore, who used it to find the shortest path out of a maze, and discovered independently by C. Y. Lee as a wire routing algorithm (published 1961).<p>
                <a class="btn btn-default" href="https://en.wikipedia.org/wiki/Breadth-first_search">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>DFS</h2>
            <p>The time and space analysis of DFS differs according to its application area. </br>In theoretical computer science, DFS is typically used to traverse an entire graph, and takes time Θ(|V| + |E|), linear in the size of the graph. In these applications it also uses space O(|V|) in the worst case to store the stack of vertices on the current search path as well as the set of already-visited vertices.</br> Thus, in this setting, the time and space bounds are the same as for breadth-first search and the choice of which of these two algorithms to use depends less on their complexity and more on the different properties of the vertex orderings the two algorithms produce.</p>
            <p>
                <a class="btn btn-default" href="https://en.wikipedia.org/wiki/Depth-first_search">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>A*</h2>
            <p>
                A* uses a best-first search and finds a least-cost path from a given initial node to one goal node (out of one or more possible goals).</br> As A* traverses the graph, it builds up a tree of partial paths. The leaves of this tree (called the open set or fringe) are stored in a priority queue that orders the leaf nodes by a cost function, which combines a heuristic estimate of the cost to reach a goal and the distance traveled from the initial node.</p>
            <p>
                <a class="btn btn-default" href="https://en.wikipedia.org/wiki/A*_search_algorithm">Learn more &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
