using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Bullet_Trajectory
{
    /// <summary>
    /// Simulation - consists of a Bullts, Wind and a Target. Simulation generates all the data needed 
    /// in order to simulate Bullet's trajectory.
    /// </summary>
    class Simulation
    {

        private Bullet bullet;
        private Wind wind;
        private Target target;

        /// <summary>
        /// Simulation constractor
        /// </summary>
        /// <param name="bullet">get bullet values</param>
        /// <param name="wind">get wind values</param>
        /// <param name="target">get target values</param>
        public Simulation(Bullet bullet, Wind wind, Target target)
        {
            this.bullet = bullet;
            this.wind = wind;
            this.target = target;
        }
        /// <summary>
        /// Geter and seters for bullet
        /// </summary>
        public Bullet _bullet
        {
            get { return this.bullet; }
            set { this.bullet = value; }
        }
        /// <summary>
        /// Geter and seters for wind
        /// </summary>
        public Wind _wind
        {
            get { return this.wind; }
            set { this.wind = value; }
        }
        /// <summary>
        /// Geter and seters for target
        /// </summary>
        public Target _target
        {
            get { return this.target; }
            set { this.target = value; }
        }

        /// <summary>
        /// Calculat x, y, z direction by sending the velocity starting direction the wind and the time 
        /// </summary>
        /// <param name="t">time</param>
        /// <returns>new bellet's velocity vector at any time given.</returns>
        public double getBulletVelocity(double t)
        {
            double x = this.bullet.CalcByDirection(Calculate.VELOCITY, Direction.X, this.wind, t);
            double y = this.bullet.CalcByDirection(Calculate.VELOCITY, Direction.Y, this.wind, t);
            double z = this.bullet.CalcByDirection(Calculate.VELOCITY, Direction.Z, this.wind, t);

            return new VelocityVector(x, y, z).getVelocity();
        }
        /// <summary>
        /// Get the time and use the bullet location direction and the wind
        /// </summary>
        /// <param name="t">time</param>
        /// <returns>new cordinates of x, y, z</returns>
        public Cordinates getBulletCordinates(double t)
        {
            double x = this.bullet.CalcByDirection(Calculate.LOCATION, Direction.X, this.wind, t);
            double y = this.bullet.CalcByDirection(Calculate.LOCATION, Direction.Y, this.wind, t);
            double z = this.bullet.CalcByDirection(Calculate.LOCATION, Direction.Z, this.wind, t);

            return new Cordinates(x, y, z);
        }

        /// <summary>
        /// Function will calculat time to bullet to hit the target
        /// </summary>
        /// <returns>time that takes to bullet to hit target.</returns>
        public double getHitTime()
        {
            double v = this._bullet.VelocityVector.ZVelocity;
            double m = this._bullet.Mass;
            double x = this._target.Distance;
            double k = this._bullet.Ressistance;

            if (k != 0)
            {
                //If k * x >= m * v then bullet can not reach target. In that case return -1.
                if (k * x >= m * v)
                    return -1;
                return (m * Math.Log((m * v) / (m * v - k * x))) / k;
            }
            else
                return x / v;
        }
    }
}
