using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Bullet_Trajectory
{
    /// <summary>
    /// object Target - represents the target that the bullet is supposed to hit.
    /// Since the target is circular it has a radius measured in meters. Target's distance is also 
    /// measured in meters.
    /// </summary>
    class Target
    {
        private double distance;
        private double radius;
        /// <summary>
        /// Target constractor
        /// </summary>
        /// <param name="distance">get distance value</param>
        /// <param name="radius">get radius value</param>
        public Target(double distance = 0, double radius = 0)
        {
            this.distance = distance;
            this.radius = radius;
        }
        /// <summary>
        /// geter and seter for Distance
        /// </summary>
        public double Distance
        {
            get { return this.distance; }
            set { this.distance = value; }
        }
        /// <summary>
        /// geter and seter for Radius 
        /// </summary>
        public double Radius
        {
            get { return this.radius; }
            set { this.radius = value; }
        }
    }
}
