using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Bullet_Trajectory
{
    /// <summary>
    /// Calculate is used in Bullet.CalcByDirection method as a parameter.
    /// Gives the option to choose whether we want to calculate bullet's location or velocity in
    /// a given direction and time.
    /// </summary>
    enum Calculate { LOCATION, VELOCITY }
}
