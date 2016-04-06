using ConsoleApplication1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AI_Peg_Solitaire.Class
{
    /*
    public class Board
    {
        public List<peg> list;
        public Board()
        {
            list = new List<peg>();
        }
    }
    
    public class Node
    {
        public int Index { get; set; }
        public List<peg> neighbors;
        public Node(int index)
        {
            Index = index;
            neighbors = new List<peg>();
        }
        public void AddNeighbor(int index)
        {
            neighbors.Add(new peg(index));
        }
    }
    public class BFS
    {
        public BFS()
        {
            Board graph = new Board();
            graph.list.Add(new peg(0));
            graph.list.ElementAt<Node>(0).AddNeighbor(1);
            graph.list.ElementAt<Node>(0).AddNeighbor(2);
            graph.list.ElementAt<Node>(0).neighbors.ElementAt<Node>(0).AddNeighbor(3);
            GraphTraverseBFS(graph);
        }

        public void GraphTraverseBFS(Board graph)
        {
            Queue<Node> queue = new Queue<Node>();
            queue.Enqueue(graph.list[0]);
            while (queue.Count > 0)
            {
                Node tempNode = queue.Dequeue();
                Console.WriteLine("Node number: " + tempNode.Index);
                foreach (var item in tempNode.neighbors)
                {
                    queue.Enqueue(item);
                }
            }
        }
    }
    */
}

