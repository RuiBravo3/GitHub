using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Bullet_Trajectory
{
    /// <summary>
    /// object Bullet - cossists of bullet's mass in kg, bullet's ressistance coefficient and bullet's velocity
    /// vector.
    /// </summary>
    class Bullet
    {
        private double mass;
        private double ressistance;
        private  VelocityVector velocityVector;


        /// <summary>
        /// Bullet constractor
        /// </summary>
        /// <param name="mass">get the values for mass</param>
        /// <param name="ressistance">get the values for ressistamce</param>
        /// <param name="velocityVector">get the values for velocity vector</param>
        public Bullet(double mass, double ressistance, VelocityVector velocityVector)
        {
            this.mass = mass;
            this.ressistance = ressistance;
            this.velocityVector = velocityVector;
        }
        /// <summary>
        /// geter and seters for mass.
        /// </summary>
        public double Mass
        {
            get { return this.mass; }
            set { this.mass = value; }
        }
        /// <summary>
        /// geter and seters for Ressistance.
        /// </summary>
        public double Ressistance
        {
            get { return this.ressistance; }
            set { this.ressistance = value; }
        }
        /// <summary>
        /// geter and seters for VelocityVector.
        /// </summary>
        public VelocityVector VelocityVector
        {
            get { return this.velocityVector; }
            set { this.velocityVector = value; }
        }

        /// <summary>
        /// Calculates bullet's velocity or location in a given direction and time.
        /// </summary>
        /// <param name="calc">Defines whether velocity or location needs to be calculated.</param>
        /// <param name="direction">the direction</param>
        /// <param name="wind">Wind can influence the bullet on the X axis.</param>
        /// <param name="t">Time t - measured in seconds.</param>
        /// <returns>bullet's velocity or location in a given direction and time</returns>
        public double CalcByDirection(Calculate calc, Direction direction, Wind wind,
            double t)
        {
            double k = this.ressistance;//ressistance
            double m = this.mass;//mass
            double b = k / m;//ressistance over mass
            double g = 0;//Gravity
            double v = 0;//Initial speed

            //Define initial speed abd gravity based on the given direction.
            switch (direction)
            {
                case Direction.X:
                    v = this.velocityVector.XVelocity + wind.Velocity;
                    break;
                case Direction.Y:
                    v = this.velocityVector.YVelocity * -1;
                    g = 9.8;
                    break;
                case Direction.Z:
                    v = this.velocityVector.ZVelocity;
                    break;
            }

            double output = 0;
            //Chooses the needed formula according to the given parameters.
            switch (calc)
            {
                case Calculate.LOCATION:
                    if (k != 0) //if the ressistance not zero
                        output = (-g + b * g * t + b * v + (g - b * v) * Math.Pow(Math.E, -b * t)) / 
                            Math.Pow(b, 2);
                    else // the ressistance is zero
                        output = (g * Math.Pow(t, 2) + 2 * t * v) / 2;
                    break;
                case Calculate.VELOCITY:
                    if (k != 0) //if the ressistance not zero
                        output = ((g / b) + (Math.Pow(Math.E, -b * t) * (v - (g / b))));
                    else // the ressistance is zero
                        output = g * t + v;
                    break;
            }

            if (direction == Direction.Y)
                output *= -1;

            return output;
        }
    }
}
