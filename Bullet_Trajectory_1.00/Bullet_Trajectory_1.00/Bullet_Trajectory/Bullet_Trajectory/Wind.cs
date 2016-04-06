using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Bullet_Trajectory
{
    /// <summary>
    /// A wind can influence the bullet's trajectory. The wind can be either in left or right direction. 
    /// A positive value means right and and a negative one means left. Wind's velocity and direction
    /// is generated randomly. 
    /// </summary>
    class Wind
    {
        private double velocity;//Measured in meters per second.
        
        /// <summary>
        /// Constructor
        /// A random velocity is genetated between -10 to 10 m/s
        /// </summary>
        public Wind()
        {
            Random rnd = new Random();
            this.velocity = rnd.Next(-10, 10);
        }
        /// <summary>
        /// geter and seter for velocity
        /// </summary>
        public double Velocity
        {
            get { return this.velocity; }
            set { this.velocity = value; }
        }

        /// <summary>
        /// Returns a string that represents the wind's direction.
        /// </summary>
        /// <returns>wind is Right or Left or no wind</returns>
        public string getDirection()
        {
            if (this.velocity > 0)
                return "Right";
            else if (this.velocity < 0)
                return "Left";
            else
                return "None";
        }
    }
}
