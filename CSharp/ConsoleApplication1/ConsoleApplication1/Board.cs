using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
namespace ConsoleApplication1
{
    public class Board
    {
        public peg[] pegs;
        public Cost cost;
        public Board()
        {
            pegs = new peg[49];
            int index = 0;
            for (int i = 0; i < 7; i++)
            {
                for (int j = 0; j < 7; j++)
                {
                    if (!(((i < 2) && ((j < 2) || (j > 4))) || ((i > 4) && ((j < 2) || (j > 4)))))
                    {
                        pegs[index] = new peg(i, j, index == 24 ? false : true);
                    }
                    index++;
                }
            }
            chooseheuristic();
        }
        public int chooseheuristic()
        {
            int heuristic;
            do
            {
                Console.WriteLine("Please Choose Heuristic: ");
                Console.WriteLine(" 1 - euclidean.");
                Console.WriteLine(" 2 - manhattan.");
                Console.WriteLine(" 3 - pogoda.");
                int.TryParse(Console.ReadLine(), out heuristic);
            } while ((heuristic < 1 && heuristic > 3));
            cost = new Cost(heuristic);
            return heuristic;
        }
        public void printBoard()
        {
            int index = 0;
            System.Console.WriteLine();
            for (int i = 0; i < 7; i++)
            {
                for (int j = 0; j < 7; j++)
                {
                    System.Console.Write(" | ");
                    if (pegs[index] != null)
                        pegs[index].printPeg();
                    else
                        System.Console.Write(" - ");
                    index++;
                }
                System.Console.WriteLine();
            }
        }
        public void printCostBoard()
        {
            System.Console.WriteLine();
            for (int i = 0; i < 7; i++)
            {
                for (int j = 0; j < 7; j++)
                {
                    System.Console.Write("|");
                    if (cost.getCost(i, j) != double.MaxValue)
                    {
                        System.Console.Write(cost.getCost(i, j) < 0 ? cost.getCost(i, j).ToString() : " " + cost.getCost(i, j).ToString() + " ");
                    }
                    else
                    {
                        System.Console.Write(" - ");
                    }
                }
                System.Console.WriteLine("|");
            }
            System.Console.WriteLine();
        }
        public void getBoardCost()
        {
            double boardCost = 0;
            for(int i = 0; i < 7 ; i++)
            {
                for(int j = 0 ; j < 7 ; j++)
                {
                    if(cost.getCost(i, j) != double.MaxValue)
                        boardCost += cost.getCost(i, j);
                }
            }
            Console.WriteLine("boardCost = " + boardCost);
        }

    }
}

