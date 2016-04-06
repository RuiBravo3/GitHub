using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AI_Peg_Solitaire.Class
{
    /*
    public class DFS
    {

        public Board graph { get; set; }
        public DFS()
        {
            graph = new Board();

            graph.list.Add(new Node(0));
            graph.list.ElementAt<Node>(0).AddNeighbor(1);
            graph.list.ElementAt<Node>(0).AddNeighbor(2);
            graph.list.ElementAt<Node>(0).neighbors.ElementAt<Node>(0).AddNeighbor(3);
            GraphTraverseDFS(graph);
        }

        public void GraphTraverseDFS(Board graph)
        {
            Stack<Node> stack = new Stack<Node>();
            stack.Push(graph.list[0]);
            while (stack.Count != 0)
            {
                Node tempNode = stack.Pop();
                Console.WriteLine("Node number: " + tempNode.Index);
                var negibours = tempNode.neighbors;
                foreach (var item in negibours)
                {
                    stack.Push(item);
                }
            }
        }
    }
    */
}