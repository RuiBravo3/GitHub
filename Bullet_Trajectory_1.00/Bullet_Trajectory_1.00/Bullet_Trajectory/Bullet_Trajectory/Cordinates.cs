using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Bullet_Trajectory
{
    /// <summary>
    /// Cordinates - represents an object's location in a 3D space.
    /// </summary>
    class Cordinates
    {
        private double x;
        private double y;
        private double z;
        /// <summary>
        /// Cordinates constractor 
        /// </summary>
        /// <param name="X">get x cordinates</param>
        /// <param name="Y">get y cordinates</param>
        /// <param name="Z">get z cordinates</param>
        public Cordinates(double X = 0, double Y = 0, double Z = 0)
        {
            this.x = X;
            this.y = Y;
            this.z = Z;
        }
        /// <summary>
        /// Geter and seters for x
        /// </summary>
        public double X
        {
            get { return this.x; }
            set { this.x = value; }
        }
        /// <summary>
        /// Geter and seters for y
        /// </summary>
        public double Y
        {
            get { return this.y; }
            set { this.y = value; }
        }
        /// <summary>
        /// Geter and seters for z
        /// </summary>
        public double Z
        {
            get { return this.z; }
            set { this.z = value; }
        }
    }
}
