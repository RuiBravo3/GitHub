using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Bullet_Trajectory
{
    public partial class MainForm : Form
    {
        private Simulation simulation;

        public MainForm()
        {
            InitializeComponent();
        }

        /// <summary>
        /// Runs when the user presses the "Shoot" button.
        /// Check for invalid inputs, calculates bullet's trajectory and shows the results.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void shoot_Click_1(object sender, EventArgs e)
        {
            //Checks for invalid inputs and informs the user which values need to be changed (if there are any).
            string message = inputIsValid();
            if (message.Length > 0)
            {
                MessageBox.Show(message, "Ivalid input");
                return;
            }

            //Builds simulation object.
            buildSimulation();

            //Checks if the bullet reached to target distance.
            if (!reachedTarget())
                return;

            //Fill DataGrid and paint the crosshair on the target.
            fillDataGrid();
            paintCrossHairAndShowResults();
        }

        /// <summary>
        /// Checks if the bullet reached to target distance.
        /// If the bullet did not reach target distance clear this.dataGridView and inform the user.
        /// </summary>
        /// <returns>Boolean value</returns>
        private bool reachedTarget()
        {
            if (this.simulation.getHitTime() == -1)
            {
                this.dataGridView.DataSource = null;
                this.targetPicture.Refresh();
                showLabelResults(0, false);
                return false;
            }
            else
                return true;
        }

        /// <summary>
        /// Builds simulation object from all the user's inputs
        /// </summary>
        private void buildSimulation()
        {
            //Bullet:
            double mass = Convert.ToDouble(this.m.Text);
            double velocity = Convert.ToDouble(this.Vo.Text);
            double xAngle = Convert.ToDouble(this.theta1.Text);
            double yAngle = Convert.ToDouble(this.theta2.Text);
            VelocityVector velocityVector = new VelocityVector();
            velocityVector.defineByAngles(xAngle, yAngle, velocity);
            double ressistance = Convert.ToDouble(this.k.Text);
            //Wind:
            Wind wind = new Wind();
            if (this.useWind.CheckState == CheckState.Unchecked)
                wind.Velocity = 0;
            //Target:
            double radius = Convert.ToDouble(this.radius.Text);
            double distance = Convert.ToDouble(this.distance.Text);
            //Build Simulation object:
            this.simulation = new Simulation(new Bullet(mass, ressistance, velocityVector),
               wind, new Target(distance, radius));
        }

        /// <summary>
        /// Creates a table that shows bullet's location and velocity as a function of time from 
        /// t = 0 bullt's hit time.
        /// </summary>
        private void fillDataGrid()
        {
            double hitTime = this.simulation.getHitTime();

            DataTable table = new DataTable();
            //Add table colums.
            table.Columns.Add("t", typeof(double));
            table.Columns.Add("X", typeof(double));
            table.Columns.Add("Y", typeof(double));
            table.Columns.Add("Z", typeof(double));
            table.Columns.Add("Vt", typeof(double));

            //Fill table rows with the requiered data from t = 0 till bullt's hit time 
            //and round all the numbers.
            for (double i = 0; i <= 1; i += 0.1)
            {
                double t = hitTime * i;
                Cordinates cord = this.simulation.getBulletCordinates(t);
                table.Rows.Add(Math.Round(t, 3), Math.Round(cord.X, 3), Math.Round(cord.Y, 3),  
                    Math.Round(cord.Z, 3), Math.Round(this.simulation.getBulletVelocity(t), 3));
            }

            this.dataGridView.DataSource = table;
            this.dataGridView.AutoResizeColumns();
        }

        /// <summary>
        /// Check if a given string is a number.
        /// </summary>
        /// <param name="val"></param>
        /// <returns></returns>
        private bool isNumeric(string val)
        {
            Double result;
            return Double.TryParse(val, System.Globalization.NumberStyles.Number,
                System.Globalization.CultureInfo.CurrentCulture, out result);
        }

        /// <summary>
        /// Checks that all the input is valid.
        /// </summary>
        /// <returns>string that describes all the invalid inputs.</returns>
        private string inputIsValid()
        {
            string message = "";

            //If text boxes are empty write 0.
            if (this.theta1.Text.Length == 0)
                this.theta1.Text = "0";
            if (this.theta2.Text.Length == 0)
                this.theta2.Text = "0";
            if (this.k.Text.Length == 0)
                this.k.Text = "0";
            
            /*Test all inputs and Values*/
            //Check mass is valid:
            if (!(isNumeric(this.m.Text) && Convert.ToDouble(this.m.Text) > 0))
                message += "Mass value is invalid - enter a positive value.\n";
            //Check muzzle velocity is valid:
            if (!(isNumeric(this.Vo.Text) && Convert.ToDouble(this.Vo.Text) > 0))
                message += "Muzzle velocity value is invalid - enter a positive value.\n";
            //Check horizontal angle is valid:
            if (!(isNumeric(this.theta1.Text) && Math.Abs(Convert.ToDouble(this.theta1.Text)) <= 10))
                message += "Horizontal angle value is invalid - enter a value between -10 to 10.\n";
            //Check vertical angle is valid:
            if (!(isNumeric(this.theta2.Text) && Math.Abs(Convert.ToDouble(this.theta2.Text)) <= 10))
                message += "Vertical angle value is invalid - enter a value between -10 to 10.\n";
            //Check Ressistance cofficient value is valid:
            if (!(isNumeric(this.k.Text) && Convert.ToDouble(this.k.Text) >= 0))
                message += "Ressistance cofficient value is invalid - enter zero or a positive value.\n";
            //Check target radius is valid:
            if (!(isNumeric(this.radius.Text) && Convert.ToDouble(this.radius.Text) >= 0))
                message += "Target radius value is invalid - enter a positive value.\n";
            //Check target distance is valid:
            if (!(isNumeric(this.distance.Text) && Convert.ToDouble(this.distance.Text) >= 0))
                message += "Target distance value is invalid - enter a positive value.\n";

            return message;
        }

        /// <summary>
        /// Paint a crosshair on targetPicture that shows the bullet's hit location relatively to 
        /// the targe't center.
        /// Shows also information about distance from bullet's hit location to target's center, 
        /// wind speed and direction.
        /// </summary>
        private void paintCrossHairAndShowResults()
        {
            //Get bullet hit cordinates.
            Cordinates hitCord = this.simulation.getBulletCordinates(this.simulation.getHitTime());
            double distanceFromCenter = Math.Sqrt(Math.Pow(hitCord.X, 2) + Math.Pow(hitCord.Y, 2));

            //Return if bullet missed target.
            if (distanceFromCenter > this.simulation._target.Radius)
            {
                showLabelResults(distanceFromCenter, true);
                //Redraw image.
                this.targetPicture.Refresh();
                return;
            }
            //Get ratio between picture size and target's radius.
            double xRatio = this.targetPicture.Width / (this.simulation._target.Radius * 2);
            double yRatio = this.targetPicture.Height / (this.simulation._target.Radius * 2);
            //Get hit location on the picture.
            Point hitPoint = new Point();
            hitPoint.X = (int)((this.targetPicture.Width / 2) + (hitCord.X * xRatio));
            hitPoint.Y = (int)((this.targetPicture.Height / 2) - (hitCord.Y * yRatio));
            
            using (Graphics crossHair = this.targetPicture.CreateGraphics())
            {
                //Redraw image.
                this.targetPicture.Refresh();
                //Paint crosshair:
                Pen p = new Pen(System.Drawing.Color.Red, 2);
                crossHair.DrawLine(p, hitPoint.X - 15, hitPoint.Y, hitPoint.X + 15, hitPoint.Y);
                crossHair.DrawLine(p, hitPoint.X, hitPoint.Y - 15, hitPoint.X, hitPoint.Y + 15);
            }

            //Show results.
            showLabelResults(distanceFromCenter, true);
        }

        /// <summary>
        /// Provides the user with the following information:
        /// - Bullet's distance from target's center (assuming the bullet hits the target)
        /// - Wind's direction
        /// - Wind's speed
        /// </summary>
        /// <param name="distanceFromCenter"></param>
        /// <param name="reachTarget">Describes whether the bullet managed to reach to target distance.</param>
        private void showLabelResults(double distanceFromCenter, bool reachTarget)
        {
            if (reachTarget == false)
                this.resultLabel.Text = "Bullet did not reach target.Try to increase muzzle velocity / mass\n" +
                    "or reduce target distance / ressistance cofficient.";
            else
            {
                if (distanceFromCenter > this.simulation._target.Radius)
                    this.resultLabel.Text = "Bullet missed target";
                else
                    //Print distance from target.
                    this.resultLabel.Text = "Distance from target center: " + Math.Round(distanceFromCenter, 3)
                        + " meters";
            }

            //Print wind direction and speed.
            this.windDirection.Text = "Wind direction: " + this.simulation._wind.getDirection();
            this.windSpeed.Text = "Wind speed: " + Convert.ToString(Math.Abs(this.simulation._wind.Velocity)) +
                " m/s";
        }

        /// <summary>
        /// Runs when the user presses the "Clear" button.
        /// Clears all the input fields and all the shown results.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void clear_Click_1(object sender, EventArgs e)
        {
            this.targetPicture.Refresh();
            this.useWind.CheckState = CheckState.Unchecked;
            this.m.Text = "";
            this.Vo.Text = "";
            this.theta1.Text = "";
            this.theta2.Text = "";
            this.k.Text = "";
            this.radius.Text = "";
            this.distance.Text = "";
            this.resultLabel.Text = "";
            this.windDirection.Text = "";
            this.windSpeed.Text = "";
            this.dataGridView.DataSource = null;
        }
    }
}
