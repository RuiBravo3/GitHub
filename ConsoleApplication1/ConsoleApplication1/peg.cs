using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ConsoleApplication1
{
    public class peg : position
    {
        public static int indexpeg = 0;
        public position pos;
        //private int index;

        public peg(int x , int y , bool _status) :base(x, y, _status)
        {
            if (indexpeg < 32)
            { 
                indexpeg += 1;
                this.status = _status;
            }
        }

        public void printPeg()
        {
            String murbal = this.status ? " X " : " O ";
            System.Console.Write(murbal);
        }

        public void removePeg(int x, int y)
        {
            if(status)
                status = false;
        }
        public void addPeg(int x, int y)
        {
            if (!status)
                status = true;
            else if (status)
                Console.WriteLine("there is peg on this location. ");
            else
                Console.WriteLine("out of the Board. ");
        }
    }
}