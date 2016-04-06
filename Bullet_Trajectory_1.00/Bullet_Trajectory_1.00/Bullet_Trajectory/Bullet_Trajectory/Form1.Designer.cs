namespace Bullet_Trajectory
{
    partial class MainForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainForm));
            this.shoot = new System.Windows.Forms.Button();
            this.Action = new System.Windows.Forms.GroupBox();
            this.clear = new System.Windows.Forms.Button();
            this.pictureBox2 = new System.Windows.Forms.PictureBox();
            this.X = new System.Windows.Forms.Label();
            this.Y = new System.Windows.Forms.Label();
            this.dataGridView = new System.Windows.Forms.DataGridView();
            this.useWind = new System.Windows.Forms.CheckBox();
            this.labelm = new System.Windows.Forms.Label();
            this.labelVo = new System.Windows.Forms.Label();
            this.labelk = new System.Windows.Forms.Label();
            this.m = new System.Windows.Forms.TextBox();
            this.Angle1 = new System.Windows.Forms.Label();
            this.Vo = new System.Windows.Forms.TextBox();
            this.k = new System.Windows.Forms.TextBox();
            this.theta1 = new System.Windows.Forms.TextBox();
            this.Input = new System.Windows.Forms.GroupBox();
            this.distance = new System.Windows.Forms.TextBox();
            this.radius = new System.Windows.Forms.TextBox();
            this.theta2 = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.targetPicture = new System.Windows.Forms.PictureBox();
            this.resultLabel = new System.Windows.Forms.Label();
            this.WindGroupBox = new System.Windows.Forms.GroupBox();
            this.windSpeed = new System.Windows.Forms.Label();
            this.windDirection = new System.Windows.Forms.Label();
            this.Action.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView)).BeginInit();
            this.Input.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.targetPicture)).BeginInit();
            this.WindGroupBox.SuspendLayout();
            this.SuspendLayout();
            // 
            // shoot
            // 
            this.shoot.Location = new System.Drawing.Point(4, 17);
            this.shoot.Margin = new System.Windows.Forms.Padding(2);
            this.shoot.Name = "shoot";
            this.shoot.Size = new System.Drawing.Size(87, 46);
            this.shoot.TabIndex = 3;
            this.shoot.Text = "Shoot";
            this.shoot.UseVisualStyleBackColor = true;
            this.shoot.Click += new System.EventHandler(this.shoot_Click_1);
            // 
            // Action
            // 
            this.Action.Controls.Add(this.shoot);
            this.Action.Controls.Add(this.clear);
            this.Action.Location = new System.Drawing.Point(82, 340);
            this.Action.Margin = new System.Windows.Forms.Padding(2);
            this.Action.Name = "Action";
            this.Action.Padding = new System.Windows.Forms.Padding(2);
            this.Action.Size = new System.Drawing.Size(150, 67);
            this.Action.TabIndex = 14;
            this.Action.TabStop = false;
            this.Action.Text = "Action";
            // 
            // clear
            // 
            this.clear.Location = new System.Drawing.Point(95, 17);
            this.clear.Margin = new System.Windows.Forms.Padding(2);
            this.clear.Name = "clear";
            this.clear.Size = new System.Drawing.Size(50, 46);
            this.clear.TabIndex = 3;
            this.clear.Text = "Clear";
            this.clear.UseVisualStyleBackColor = true;
            this.clear.Click += new System.EventHandler(this.clear_Click_1);
            // 
            // pictureBox2
            // 
            this.pictureBox2.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox2.Image")));
            this.pictureBox2.Location = new System.Drawing.Point(9, 10);
            this.pictureBox2.Margin = new System.Windows.Forms.Padding(2);
            this.pictureBox2.Name = "pictureBox2";
            this.pictureBox2.Size = new System.Drawing.Size(68, 397);
            this.pictureBox2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox2.TabIndex = 15;
            this.pictureBox2.TabStop = false;
            // 
            // X
            // 
            this.X.AutoSize = true;
            this.X.Location = new System.Drawing.Point(31, 269);
            this.X.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.X.Name = "X";
            this.X.Size = new System.Drawing.Size(83, 13);
            this.X.TabIndex = 16;
            this.X.Text = "Target Distance";
            // 
            // Y
            // 
            this.Y.AutoSize = true;
            this.Y.Location = new System.Drawing.Point(31, 232);
            this.Y.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.Y.Name = "Y";
            this.Y.Size = new System.Drawing.Size(72, 13);
            this.Y.TabIndex = 16;
            this.Y.Text = "Target radius:";
            // 
            // dataGridView
            // 
            this.dataGridView.AllowUserToDeleteRows = false;
            this.dataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.DisableResizing;
            this.dataGridView.Location = new System.Drawing.Point(616, 13);
            this.dataGridView.Name = "dataGridView";
            this.dataGridView.ReadOnly = true;
            this.dataGridView.RowHeadersWidth = 40;
            this.dataGridView.RowHeadersWidthSizeMode = System.Windows.Forms.DataGridViewRowHeadersWidthSizeMode.DisableResizing;
            this.dataGridView.Size = new System.Drawing.Size(243, 290);
            this.dataGridView.TabIndex = 18;
            // 
            // useWind
            // 
            this.useWind.AutoSize = true;
            this.useWind.Location = new System.Drawing.Point(4, 17);
            this.useWind.Margin = new System.Windows.Forms.Padding(2);
            this.useWind.Name = "useWind";
            this.useWind.Size = new System.Drawing.Size(73, 17);
            this.useWind.TabIndex = 0;
            this.useWind.Text = "Use Wind";
            this.useWind.UseVisualStyleBackColor = true;
            // 
            // labelm
            // 
            this.labelm.AutoSize = true;
            this.labelm.Location = new System.Drawing.Point(29, 41);
            this.labelm.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.labelm.Name = "labelm";
            this.labelm.Size = new System.Drawing.Size(35, 13);
            this.labelm.TabIndex = 2;
            this.labelm.Text = "Mass:";
            // 
            // labelVo
            // 
            this.labelVo.AutoSize = true;
            this.labelVo.Location = new System.Drawing.Point(29, 77);
            this.labelVo.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.labelVo.Name = "labelVo";
            this.labelVo.Size = new System.Drawing.Size(83, 13);
            this.labelVo.TabIndex = 3;
            this.labelVo.Text = "Muzzle Velocity:";
            // 
            // labelk
            // 
            this.labelk.AutoSize = true;
            this.labelk.Location = new System.Drawing.Point(31, 194);
            this.labelk.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.labelk.Name = "labelk";
            this.labelk.Size = new System.Drawing.Size(114, 13);
            this.labelk.TabIndex = 4;
            this.labelk.Text = "Ressistance cofficient:";
            // 
            // m
            // 
            this.m.Location = new System.Drawing.Point(31, 57);
            this.m.Margin = new System.Windows.Forms.Padding(2);
            this.m.Name = "m";
            this.m.Size = new System.Drawing.Size(127, 20);
            this.m.TabIndex = 5;
            // 
            // Angle1
            // 
            this.Angle1.AutoSize = true;
            this.Angle1.Location = new System.Drawing.Point(29, 114);
            this.Angle1.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.Angle1.Name = "Angle1";
            this.Angle1.Size = new System.Drawing.Size(86, 13);
            this.Angle1.TabIndex = 4;
            this.Angle1.Text = "Horizontal angle:";
            // 
            // Vo
            // 
            this.Vo.Location = new System.Drawing.Point(31, 93);
            this.Vo.Margin = new System.Windows.Forms.Padding(2);
            this.Vo.Name = "Vo";
            this.Vo.Size = new System.Drawing.Size(127, 20);
            this.Vo.TabIndex = 5;
            // 
            // k
            // 
            this.k.Location = new System.Drawing.Point(31, 210);
            this.k.Margin = new System.Windows.Forms.Padding(2);
            this.k.Name = "k";
            this.k.Size = new System.Drawing.Size(127, 20);
            this.k.TabIndex = 5;
            // 
            // theta1
            // 
            this.theta1.Location = new System.Drawing.Point(31, 130);
            this.theta1.Margin = new System.Windows.Forms.Padding(2);
            this.theta1.Name = "theta1";
            this.theta1.Size = new System.Drawing.Size(127, 20);
            this.theta1.TabIndex = 5;
            // 
            // Input
            // 
            this.Input.Controls.Add(this.distance);
            this.Input.Controls.Add(this.radius);
            this.Input.Controls.Add(this.theta2);
            this.Input.Controls.Add(this.theta1);
            this.Input.Controls.Add(this.X);
            this.Input.Controls.Add(this.k);
            this.Input.Controls.Add(this.Y);
            this.Input.Controls.Add(this.Vo);
            this.Input.Controls.Add(this.label1);
            this.Input.Controls.Add(this.Angle1);
            this.Input.Controls.Add(this.m);
            this.Input.Controls.Add(this.labelk);
            this.Input.Controls.Add(this.labelVo);
            this.Input.Controls.Add(this.labelm);
            this.Input.Controls.Add(this.useWind);
            this.Input.Location = new System.Drawing.Point(420, 10);
            this.Input.Margin = new System.Windows.Forms.Padding(2);
            this.Input.Name = "Input";
            this.Input.Padding = new System.Windows.Forms.Padding(2);
            this.Input.Size = new System.Drawing.Size(190, 325);
            this.Input.TabIndex = 12;
            this.Input.TabStop = false;
            this.Input.Text = "Input";
            // 
            // distance
            // 
            this.distance.Location = new System.Drawing.Point(32, 284);
            this.distance.Margin = new System.Windows.Forms.Padding(2);
            this.distance.Name = "distance";
            this.distance.Size = new System.Drawing.Size(127, 20);
            this.distance.TabIndex = 18;
            // 
            // radius
            // 
            this.radius.Location = new System.Drawing.Point(31, 247);
            this.radius.Margin = new System.Windows.Forms.Padding(2);
            this.radius.Name = "radius";
            this.radius.Size = new System.Drawing.Size(127, 20);
            this.radius.TabIndex = 17;
            // 
            // theta2
            // 
            this.theta2.Location = new System.Drawing.Point(31, 169);
            this.theta2.Margin = new System.Windows.Forms.Padding(2);
            this.theta2.Name = "theta2";
            this.theta2.Size = new System.Drawing.Size(127, 20);
            this.theta2.TabIndex = 5;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(29, 153);
            this.label1.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(74, 13);
            this.label1.TabIndex = 4;
            this.label1.Text = "Vertical angle:";
            // 
            // targetPicture
            // 
            this.targetPicture.Image = ((System.Drawing.Image)(resources.GetObject("targetPicture.Image")));
            this.targetPicture.Location = new System.Drawing.Point(86, 13);
            this.targetPicture.Name = "targetPicture";
            this.targetPicture.Size = new System.Drawing.Size(322, 322);
            this.targetPicture.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.targetPicture.TabIndex = 19;
            this.targetPicture.TabStop = false;
            this.targetPicture.WaitOnLoad = true;
            // 
            // resultLabel
            // 
            this.resultLabel.AutoSize = true;
            this.resultLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.resultLabel.Location = new System.Drawing.Point(237, 357);
            this.resultLabel.Name = "resultLabel";
            this.resultLabel.Size = new System.Drawing.Size(0, 16);
            this.resultLabel.TabIndex = 21;
            // 
            // WindGroupBox
            // 
            this.WindGroupBox.Controls.Add(this.windSpeed);
            this.WindGroupBox.Controls.Add(this.windDirection);
            this.WindGroupBox.Location = new System.Drawing.Point(620, 318);
            this.WindGroupBox.Name = "WindGroupBox";
            this.WindGroupBox.Size = new System.Drawing.Size(238, 88);
            this.WindGroupBox.TabIndex = 22;
            this.WindGroupBox.TabStop = false;
            this.WindGroupBox.Text = "Wind";
            // 
            // windSpeed
            // 
            this.windSpeed.AutoSize = true;
            this.windSpeed.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.windSpeed.Location = new System.Drawing.Point(6, 52);
            this.windSpeed.Name = "windSpeed";
            this.windSpeed.Size = new System.Drawing.Size(0, 20);
            this.windSpeed.TabIndex = 1;
            // 
            // windDirection
            // 
            this.windDirection.AutoSize = true;
            this.windDirection.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.windDirection.Location = new System.Drawing.Point(6, 22);
            this.windDirection.Name = "windDirection";
            this.windDirection.Size = new System.Drawing.Size(0, 20);
            this.windDirection.TabIndex = 0;
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(864, 417);
            this.Controls.Add(this.WindGroupBox);
            this.Controls.Add(this.resultLabel);
            this.Controls.Add(this.targetPicture);
            this.Controls.Add(this.dataGridView);
            this.Controls.Add(this.Action);
            this.Controls.Add(this.Input);
            this.Controls.Add(this.pictureBox2);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Margin = new System.Windows.Forms.Padding(2);
            this.Name = "MainForm";
            this.Text = "Bullet Trajectory";
            this.Action.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView)).EndInit();
            this.Input.ResumeLayout(false);
            this.Input.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.targetPicture)).EndInit();
            this.WindGroupBox.ResumeLayout(false);
            this.WindGroupBox.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button shoot;
        private System.Windows.Forms.GroupBox Action;
        private System.Windows.Forms.Button clear;
        private System.Windows.Forms.PictureBox pictureBox2;
        private System.Windows.Forms.Label X;
        private System.Windows.Forms.Label Y;
        private System.Windows.Forms.DataGridView dataGridView;
        private System.Windows.Forms.CheckBox useWind;
        private System.Windows.Forms.Label labelm;
        private System.Windows.Forms.Label labelVo;
        private System.Windows.Forms.Label labelk;
        private System.Windows.Forms.TextBox m;
        private System.Windows.Forms.Label Angle1;
        private System.Windows.Forms.TextBox Vo;
        private System.Windows.Forms.TextBox k;
        private System.Windows.Forms.TextBox theta1;
        private System.Windows.Forms.GroupBox Input;
        private System.Windows.Forms.TextBox theta2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox distance;
        private System.Windows.Forms.TextBox radius;
        private System.Windows.Forms.PictureBox targetPicture;
        private System.Windows.Forms.Label resultLabel;
        private System.Windows.Forms.GroupBox WindGroupBox;
        private System.Windows.Forms.Label windSpeed;
        private System.Windows.Forms.Label windDirection;
    }
}

