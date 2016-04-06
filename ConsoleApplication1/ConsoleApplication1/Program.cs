using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("start" + DateTime.Now.ToString());
            Board newGame = new Board();
            String ops = "0";

            do
            {
                Console.WriteLine(" 1 - Print Board.");
                Console.WriteLine(" 2 - Print Cost Board");
                Console.WriteLine(" 3 - print Value of Total Board Cost");
                Console.WriteLine(" 4 - All Starting Move.");
                Console.WriteLine(" 5 - Choose Starting Move.");
                Console.WriteLine(" 6 - The Solve");
                Console.WriteLine(" 7 - Print Solution");
                Console.WriteLine(" 8 - Reset Bord");
                Console.WriteLine(" 9 - Exit.");
                ops = Console.ReadLine();
                
                switch (ops)
                {
                    case "1":
                        newGame.printBoard();
                        break;
                    case "2":
                        newGame.printCostBoard();
                        break;
                    case "3":
                        newGame.getBoardCost();
                        break;
                    case "4":

                        break;
                    case "5":
                        break;
                    case "6":
                        break;
                    case "7":
                        break;
                    case "8":
                        newGame = new Board();
                        break;
                    case "9":
                        System.Console.WriteLine("Good By.");
                        break;
                }
            } while (ops != "9");
            Console.WriteLine(" End " + DateTime.Now.ToString());
            Console.Read();
        }
    }
}
