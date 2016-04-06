using System;

namespace ConsoleApplication1
{
    public class position
    {
        public int x { get; set; } // x cordinat.
        public int y { get; set; } // y cordinat.
        public bool status { get; set; } // occupied status.

        public position(int _x , int _y , bool _status)
        {
            x = _x;
            y = _y;
            status = _status;
        }
        public position(position other)
        {
            this.x = other.x;
            this.y = other.y;
        }
        
    }
}