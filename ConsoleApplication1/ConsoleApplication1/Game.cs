using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ConsoleApplication1
{
    public class Game
    {
        public position move(position start, string diraction)
        {
            if (diraction == "U")
            {
                start.x = start.x;
                start.y = start.y - 2;
            }
            else if (diraction == "D")
            {
                start.x = start.x;
                start.y = start.y + 2;
            }
            else if (diraction == "L")
            {
                start.x = start.x - 2;
                start.y = start.y;
            }
            else if (diraction == "R")
            {
                start.x = start.x + 2;
                start.y = start.y;
            }
            position end = start;
            return end;
        }

        private bool canMove()
        {
            return false;
        }

        private bool checkNighber(position pos, string diraction)
        {
            switch(diraction)
            {
                case "U":
                {
                    break;
                }
                case "D":
                {
                    break;
                }
                case "L":
                {
                    break;
                }
                case "R":
                {
                    break;
                }
            }
            return false;
        }

        private bool checkEnd(position pos, string diraction)
        {
            return pos.status;
        }
    }
}