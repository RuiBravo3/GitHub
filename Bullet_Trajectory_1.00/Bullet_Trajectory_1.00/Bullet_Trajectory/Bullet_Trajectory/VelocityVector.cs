using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Bullet_Trajectory
{
    /// <summary>
    /// Velocity vector - 3D vector which consists of velocites on the X, Y and Z axis.
    /// </summary>
    class VelocityVector
    {
        private double xVelocity;
        private double yVelocity;
        private double zVelocity;
        /// <summary>
        /// Velocity vector constractor 
        /// </summary>
        /// <param name="xVelocity">x velocity</param>
        /// <param name="yVelocity">y velocity</param>
        /// <param name="zVelocity">z velocity</param>
        public VelocityVector(double xVelocity = 0, double yVelocity = 0, double zVelocity = 0)
        {
            this.xVelocity = xVelocity;
            this.yVelocity = yVelocity;
            this.zVelocity = zVelocity;
        }

        /// <summary>
        /// Defines the vector by xAngle, yAngle, and vector magnitude.
        /// </summary>
        /// <param name="xAngle">Vector's angle on the X axis.</param>
        /// <param name="yAngle">Vector's angle on the Y axis.</param>
        /// <param name="initVelocity">Vector's magnitude.</param>
        public void defineByAngles(double xAngle, double yAngle , double initVelocity )
        {
            xAngle = toRadians(xAngle);
            yAngle = toRadians(yAngle);

            this.xVelocity = ((initVelocity * Math.Tan(xAngle)) / Math.Sqrt(1 + Math.Pow(Math.Tan(xAngle), 2) + Math.Pow( Math.Tan(yAngle), 2)));
            this.yVelocity = ((initVelocity * Math.Tan(yAngle)) / Math.Sqrt(1 + Math.Pow(Math.Tan(xAngle), 2) + Math.Pow(Math.Tan(yAngle), 2)));
            this.zVelocity = (initVelocity /  Math.Sqrt(1 + Math.Pow(Math.Tan(xAngle), 2) + Math.Pow(Math.Tan(yAngle), 2)));
        }
        /// <summary>
        /// Get angle in degrees and returns the radians.
        /// </summary>
        /// <param name="angle">the angle in degrees</param>
        /// <returns>angle in radians</returns>
        private double toRadians(double angle)
        {
            return (Math.PI/180)* angle;
        }
        /// <summary>
        /// Geter and seter for x velocity
        /// </summary>
        public double XVelocity
        {
            get { return this.xVelocity; }
            set { this.xVelocity = value;}
        }
        /// <summary>
        /// Geter and seter for y velocity
        /// </summary>
        public double YVelocity
        {
            get { return this.yVelocity; }
            set { this.yVelocity = value; }
        }
        /// <summary>
        /// Geter and seter for z velocity
        /// </summary>
        public double ZVelocity
        {
            get { return this.zVelocity; }
            set { this.zVelocity = value; }
        }
        /// <summary>
        /// Returns vector's magnitude.
        /// </summary>
        /// <returns></returns>
        public double getVelocity()
        {
            return Math.Sqrt(Math.Pow(xVelocity, 2) + Math.Pow(yVelocity, 2) + Math.Pow(zVelocity, 2));
        }
    }
}
