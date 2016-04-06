using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Bullet_Trajectory
{
    /// <summary>
    /// Direction is used in Bullet.CalcByDirection method as a parameter.
    /// Gives the option to choose the direction in which we want to calculate bullet's location / velocity
    /// in a given time.
    /// </summary>
    enum Direction { X, Y, Z }
}
