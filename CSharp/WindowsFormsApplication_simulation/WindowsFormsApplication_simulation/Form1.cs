using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;
using System.Windows.Forms.DataVisualization.Charting;

namespace WindowsFormsApplication_simulation
{
    public partial class Form1 : Form
    {
        DataTable dt1 = new DataTable();
        DataTable dt2 = new DataTable();
        DataTable dt3 = new DataTable();
        int average_treatment_stand1;
        int average_time_quequ_stand1;
        int average_treatment_stand2;
        int average_time_quequ_stand2;
        int average_treatment_stand3;
        int average_time_quequ_stand3;

        TimeSpan t1, t2, t3, t4, t5, t6, t7, t8;
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            button1.Hide();
            button2.Hide();
            button3.Hide();
            button4.Hide();
            button5.Hide();
            button6.Hide();
        }
        private void chart1_MouseMove_1(object sender, MouseEventArgs e)
        {
            Point mousePoint = new Point(e.X, e.Y);

            chart1.ChartAreas[0].CursorX.Interval = 0;
            chart1.ChartAreas[0].CursorY.Interval = 0;

            chart1.ChartAreas[0].CursorX.SetCursorPixelPosition(mousePoint, true);
            chart1.ChartAreas[0].CursorY.SetCursorPixelPosition(mousePoint, true);

            HitTestResult result = chart1.HitTest(e.X, e.Y);
            if(result.PointIndex > -1 && result.ChartArea != null)
            {
                label4.Text = "Person num: " + result.Series.Points[result.PointIndex].XValue.ToString();
                label3.Text = "Wating time: " + result.Series.Points[result.PointIndex].YValues[0].ToString();
            }
        }
        //stand1
        private void button1_Click_1(object sender, EventArgs e)
        {
            chart1.Series.Clear();
            chart1.Series.Add("Series1");
            chart1.DataSource = dt1;
            chart1.Series["Series1"].XValueMember = "Id";
            chart1.Series["Series1"].YValueMembers = "wait_time_sec";
            chart1.DataBind();

            label5.Text = "Average time in Check-in 1: " + string.Format("{0:D2}h:{1:D2}m{2:D2}s", t3.Hours, t3.Minutes, t3.Seconds);
            label6.Text = "Average Waiting time in quequ before Check-in 1: " + string.Format("{0:D2}h:{1:D2}m{2:D2}s", t4.Hours, t4.Minutes, t4.Seconds);
        }
        //stand2
        private void button2_Click_1(object sender, EventArgs e)
        {
            chart1.Series.Clear();
            chart1.Series.Add("Series2").Color = Color.Green;
            chart1.DataSource = dt2;
            chart1.Series["Series2"].XValueMember = "Id";
            chart1.Series["Series2"].YValueMembers = "wait_time_sec";
            chart1.DataBind();

            label5.Text = "Average waiting time in Check-In 2: " + string.Format("{0:D2}h:{1:D2}m:{2:D2}s", t5.Hours, t5.Minutes, t5.Seconds);
            label6.Text = "Average waiting time in quequ before Check-In 2: " + string.Format("{0:D2}h:{1:D2}m:{2:D2}s", t6.Hours, t6.Minutes, t6.Seconds);
        }
        //stand3
        private void button3_Click_1(object sender, EventArgs e)
        {
            chart1.Series.Clear();
            chart1.Series.Add("Series3").Color = Color.Red;
            chart1.DataSource = dt3;
            chart1.Series["Series3"].XValueMember = "Id";
            chart1.Series["Series3"].YValueMembers = "wait_time_sec";
            chart1.DataBind();

            label5.Text = "Average waiting time in Check-In 3: " + string.Format("{0:D2}h:{1:D2}m:{2:D2}s", t7.Hours, t7.Minutes, t7.Seconds);
            label6.Text = "Average waiting time in quequ before Check-In 3: " + string.Format("{0:D2}h:{1:D2}m:{2:D2}s", t8.Hours, t8.Minutes, t8.Seconds);
        }
        private void button4_Click_1(object sender, EventArgs e)
        {
            chart1.Series.Clear();
            chart1.Series.Add("Series4");
            chart1.Series["Series4"].ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Pie;
            chart1.DataSource = dt1;
            chart1.Series["Series4"].XValueMember = "Id";
            chart1.Series["Series4"].YValueMembers = "wait_time_sec";
            chart1.DataBind();

            label5.Text = "Average waiting time in Check-In 1: " + string.Format("{0:D2}h:{1:D2}m:{2:D2}s", t3.Hours, t3.Minutes, t3.Seconds);
            label6.Text = "Average waiting time in quequ before Check-In 1: " + string.Format("{0:D2}h:{1:D2}m:{2:D2}s", t4.Hours, t4.Minutes, t4.Seconds);
        }
        private void button5_Click_1(object sender, EventArgs e)
        {
            chart1.Series.Clear();
            chart1.Series.Add("Series5").Color = Color.Green;
            chart1.Series["Series5"].ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Pie;
            chart1.DataSource = dt2;
            chart1.Series["Series5"].XValueMember = "Id";
            chart1.Series["Series5"].YValueMembers = "wait_time_sec";
            chart1.DataBind();

            label5.Text = "Average waiting time in Check-In 2: " + string.Format("{0:D2}h:{1:D2}m:{2:D2}s", t5.Hours, t5.Minutes, t5.Seconds);
            label6.Text = "Average waiting time in quequ before Check-In 2: " + string.Format("{0:D2}h:{1:D2}m:{2:D2}s", t6.Hours, t6.Minutes, t6.Seconds);
        }
        private void button6_Click_1(object sender, EventArgs e)
        {
            chart1.Series.Clear();
            chart1.Series.Add("Series6").Color = Color.Red;
            chart1.Series["Series6"].ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Pie;
            chart1.DataSource = dt3;
            chart1.Series["Series6"].XValueMember = "Id";
            chart1.Series["Series6"].YValueMembers = "wait_time_sec";
            chart1.DataBind();

            label5.Text = "Average waiting time in Check-In 3: " + string.Format("{0:D2}h:{1:D2}m:{2:D2}s", t7.Hours, t7.Minutes, t7.Seconds);
            label6.Text = "Average waiting time in quequ before Check-In 3: " + string.Format("{0:D2}h:{1:D2}m:{2:D2}s", t8.Hours, t8.Minutes, t8.Seconds);
        }
        private void button7_Click_1(object sender, EventArgs e)
        {
            //stand 1
            chart1.Series["Series1"].ChartType = SeriesChartType.Column;
            chart1.Series["Series1"]["DrawingStyle"] = "Emboss";
            chart1.Series["Series1"].IsValueShownAsLabel = true;


            dt1.Columns.Add("Id", typeof(int));
            dt1.Columns.Add("Name", typeof(string));
            dt1.Columns.Add("come_time_sec", typeof(int));//comes to airport
            dt1.Columns.Add("get_check_quequ_sec", typeof(int));//get time quequ before check in
            dt1.Columns.Add("check_wait_sec", typeof(int));//Treatment time in check in
            dt1.Columns.Add("check_end_sec", typeof(int));//end check in 
            dt1.Columns.Add("wait_time_sec", typeof(int));//wait in quequ

            Random rnd = new Random();
            //
            // Here we add 35 DataRows.
            //
            for (int i = 0; i < 35; i++)
            {
                string name = "" + i;
                int come_time_sec = rnd.Next((int)numericUpDown1.Value, (int)numericUpDown2.Value);
                int get_check_quequ_sec = rnd.Next((int)numericUpDown1.Value, (int)numericUpDown2.Value) + 780; //time come to quequ + 13 min = 780 sec
                int check_wait_sec = rnd.Next(30, 120);
                int check_end_sec = 0;
                int wait_time_sec = 0;


                dt1.Rows.Add(i, name, come_time_sec, get_check_quequ_sec, check_wait_sec, check_end_sec, wait_time_sec);
            }
            //Sort come time
            dt1.DefaultView.Sort = "come_time_sec";
            dt1 = dt1.DefaultView.ToTable();

            dt1.Rows[0]["check_end_sec"] = (int)dt1.Rows[0]["come_time_sec"] + (int)dt1.Rows[0]["check_wait_sec"];

            for (int i = 1; i < dt1.Rows.Count; i++)
            {
                if ((int)dt1.Rows[i]["come_time_sec"] >= (int)dt1.Rows[i - 1]["check_end_sec"])
                {
                    dt1.Rows[i]["check_end_sec"] = (int)dt1.Rows[i]["come_time_sec"] + (int)dt1.Rows[i]["check_wait_sec"];
                }
                else
                {
                    dt1.Rows[i]["check_end_sec"] = (int)dt1.Rows[i - 1]["check_end_sec"] + (int)dt1.Rows[i]["check_wait_sec"];
                }
                dt1.Rows[i]["wait_time_sec"] = (int)dt1.Rows[i]["check_end_sec"] - (int)dt1.Rows[i]["check_wait_sec"] - (int)dt1.Rows[i]["come_time_sec"];
            }
            int sum_quequ = 0;
            int sum_treatment = 0;
            for (int i = 1; i < dt1.Rows.Count; i++)
            {
                sum_treatment += (int)dt1.Rows[i]["check_wait_sec"];
                sum_quequ += (int)dt1.Rows[i]["wait_time_sec"];
            }

            average_treatment_stand1 = sum_treatment / dt1.Rows.Count;
            average_time_quequ_stand1 = sum_quequ / dt1.Rows.Count;
            t3 = TimeSpan.FromSeconds(average_treatment_stand1);
            t4 = TimeSpan.FromSeconds(average_time_quequ_stand1);
            //stand 2
            chart1.Series.Add("Series2").ChartType = SeriesChartType.Column;
            chart1.Series["Series2"]["DrawingStyle"] = "Emboss";
            chart1.Series["Series2"].IsValueShownAsLabel = true;

            dt2.Columns.Add("Id", typeof(int));
            dt2.Columns.Add("Name", typeof(string));
            dt2.Columns.Add("come_time_sec", typeof(int));//comes to airport
            dt2.Columns.Add("get_check_quequ_sec", typeof(int));//get time quequ before check in
            dt2.Columns.Add("check_wait_sec", typeof(int));//Treatment time in check in
            dt2.Columns.Add("check_end_sec", typeof(int));//end check in 
            dt2.Columns.Add("wait_time_sec", typeof(int));//wait in quequ

            Random rnd1 = new Random();
            //
            // Here we add 45 DataRows.
            //
            for (int i = 0; i < 45; i++)
            {
                string name = "" + i;
                int come_time_sec = rnd1.Next((int)numericUpDown3.Value, (int)numericUpDown4.Value);
                int get_check_quequ_sec = rnd1.Next((int)numericUpDown3.Value, (int)numericUpDown4.Value) + 780; //time come to quequ + 13 min = 780 sec
                int check_wait_sec = rnd1.Next(30, 120);
                int check_end_sec = 0;
                int wait_time_sec = 0;
                dt2.Rows.Add(i, name, come_time_sec, get_check_quequ_sec, check_wait_sec, check_end_sec, wait_time_sec);
            }
            //Sort come time
            dt2.DefaultView.Sort = "come_time_sec";
            dt2 = dt2.DefaultView.ToTable();

            dt2.Rows[0]["check_end_sec"] = (int)dt2.Rows[0]["come_time_sec"] + (int)dt2.Rows[0]["check_wait_sec"];

            for (int i = 1; i < dt2.Rows.Count; i++)
            {
                if ((int)dt2.Rows[i]["come_time_sec"] >= (int)dt2.Rows[i - 1]["check_end_sec"])
                {
                    dt2.Rows[i]["check_end_sec"] = (int)dt2.Rows[i]["come_time_sec"] + (int)dt2.Rows[i]["check_wait_sec"];
                }
                else
                {
                    dt2.Rows[i]["check_end_sec"] = (int)dt2.Rows[i - 1]["check_end_sec"] + (int)dt2.Rows[i]["check_wait_sec"];
                }
                dt2.Rows[i]["wait_time_sec"] = (int)dt2.Rows[i]["check_end_sec"] - (int)dt2.Rows[i]["check_wait_sec"] - (int)dt2.Rows[i]["come_time_sec"];
            }
            int sum_quequ2 = 0;
            int sum_treatment2 = 0;
            for (int i = 1; i < dt2.Rows.Count; i++)
            {
                sum_treatment2 += (int)dt2.Rows[i]["check_wait_sec"];
                sum_quequ2 += (int)dt2.Rows[i]["wait_time_sec"];
            }
            average_treatment_stand2 = sum_treatment2 / dt2.Rows.Count;
            average_time_quequ_stand2 = sum_quequ2 / dt2.Rows.Count;
            t5 = TimeSpan.FromSeconds(average_treatment_stand2);
            t6 = TimeSpan.FromSeconds(average_time_quequ_stand2);
            //stand 3
            chart1.Series.Add("Series3").ChartType = SeriesChartType.Column;
            chart1.Series["Series3"]["DrawingStyle"] = "Emboss";

            chart1.Series["Series3"].IsValueShownAsLabel = true;


            dt3.Columns.Add("Id", typeof(int));
            dt3.Columns.Add("Name", typeof(string));
            dt3.Columns.Add("come_time_sec", typeof(int));//comes to airport
            dt3.Columns.Add("get_check_quequ_sec", typeof(int));//get time quequ before check in
            dt3.Columns.Add("check_wait_sec", typeof(int));//Treatment time in check in
            dt3.Columns.Add("check_end_sec", typeof(int));//end check in 
            dt3.Columns.Add("wait_time_sec", typeof(int));//wait in quequ

            Random rnd2 = new Random();
            //
            // Here we add 30 DataRows.
            //
            for (int i = 0; i < 30; i++)
            {

                string name = "" + i;
                int come_time_sec = rnd2.Next((int)numericUpDown5.Value, (int)numericUpDown6.Value);
                int get_check_quequ_sec = rnd2.Next((int)numericUpDown5.Value, (int)numericUpDown6.Value) + 780; //time come to quequ + 13 min = 780 sec
                int check_wait_sec = rnd2.Next(30, 120);
                int check_end_sec = 0;
                int wait_time_sec = 0;


                dt3.Rows.Add(i, name, come_time_sec, get_check_quequ_sec, check_wait_sec, check_end_sec, wait_time_sec);
            }
            //Sort come time
            dt3.DefaultView.Sort = "come_time_sec";
            dt3 = dt3.DefaultView.ToTable();

            dt3.Rows[0]["check_end_sec"] = (int)dt3.Rows[0]["come_time_sec"] + (int)dt3.Rows[0]["check_wait_sec"];

            for (int i = 1; i < dt3.Rows.Count; i++)
            {
                if ((int)dt3.Rows[i]["come_time_sec"] >= (int)dt3.Rows[i - 1]["check_end_sec"])
                {
                    dt3.Rows[i]["check_end_sec"] = (int)dt3.Rows[i]["come_time_sec"] + (int)dt3.Rows[i]["check_wait_sec"];
                }
                else
                {
                    dt3.Rows[i]["check_end_sec"] = (int)dt3.Rows[i - 1]["check_end_sec"] + (int)dt3.Rows[i]["check_wait_sec"];
                }
                dt3.Rows[i]["wait_time_sec"] = (int)dt3.Rows[i]["check_end_sec"] - (int)dt3.Rows[i]["check_wait_sec"] - (int)dt3.Rows[i]["come_time_sec"];
            }
            int sum_quequ3 = 0;
            int sum_treatment3 = 0;
            for (int i = 1; i < dt3.Rows.Count; i++)
            {
                sum_treatment3 += (int)dt3.Rows[i]["check_wait_sec"];
                sum_quequ3 += (int)dt3.Rows[i]["wait_time_sec"];
            }
            average_treatment_stand3 = sum_treatment3 / dt3.Rows.Count;
            average_time_quequ_stand3 = sum_quequ3 / dt3.Rows.Count;
            t7 = TimeSpan.FromSeconds(average_treatment_stand3);
            t8 = TimeSpan.FromSeconds(average_time_quequ_stand3);

            int average_treatment = ((sum_treatment / dt1.Rows.Count) + (sum_treatment2 / dt2.Rows.Count) + (sum_treatment3 / dt3.Rows.Count)) / 3;
            int average_time_quequ = ((sum_quequ / dt1.Rows.Count) + (sum_quequ2 / dt2.Rows.Count) + (sum_quequ3 / dt3.Rows.Count)) / 3;

            t1 = TimeSpan.FromSeconds(average_treatment);
            t2 = TimeSpan.FromSeconds(average_time_quequ);

            label1.Text = "Average waiting time in All Check-In: " + string.Format("{0:D2}h:{1:D2}m:{2:D2}s", t1.Hours, t1.Minutes, t1.Seconds);
            label2.Text = "Average waiting time in All quequ before Check-In: " + string.Format("{0:D2}h:{1:D2}m:{2:D2}s", t2.Hours, t2.Minutes, t2.Seconds);
            button1.Visible = true;
            button2.Visible = true;
            button3.Visible = true;
            button4.Visible = true;
            button5.Visible = true;
            button6.Visible = true;
        }
    }
}
