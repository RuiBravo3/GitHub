using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MRDB
{
    public partial class MovieInfo : System.Web.UI.Page
    {
      bool  IsLogin = false;
        protected void Page_Load(object sender, EventArgs e)
        {

            Session["PreviousPage"] = Request.Url.ToString();
            if (Session["FirstName"] != null)
            {
                usrIflog.Text = Session["FirstName"].ToString();
                IsLogin = true;
                Loginbt.Visible = false;
                logout.Visible = true;
                registerBt.Visible = false;

            }
            else if (Session["Admins"] != null)
            {
                usrIflog.Text = Session["Admins"].ToString();
                IsLogin = true;
      

                Loginbt.Visible = false;
                logout.Visible = true;

                registerBt.Visible = false;
            }
            else
            {
                usrIflog.Text = "Only Members can post reviews - please login or register!";
                postRevbt.Enabled = false;
            }
           
          
        }

        protected void postRevbt_Click(object sender, EventArgs e)
        {
            int movId = -1;
            movId = Convert.ToInt32(Request.QueryString["mId"]);
            String info;
            String movieName = "";
            OleDbConnection con = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|database.mdb;");
            OleDbCommand cmd = con.CreateCommand();
            OleDbCommand cmd2 = con.CreateCommand();
            try
            {
                con.Open();
                cmd2.CommandText = "SELECT * FROM [movie] where mId="+movId+" ";
                
                OleDbDataReader dr = cmd2.ExecuteReader();
                while (dr.Read())
                {
                    movieName = dr["mName"].ToString();
                }

                dr.Close();
                con.Close();
                Session["MovieName"] = movieName;
                
            }
            catch(ArgumentNullException) { }
            int rate = -1;
            String name = "";
            try
            {
                if (Session["FirstName"] != null)
                {
                    name = Session["FirstName"].ToString();
                }
                else
                {
                    name = Session["Admins"].ToString();
                }
            }
            catch (NullReferenceException) { }
            info = reviewBox.Text;
            rate = Convert.ToInt32(ratebox.Text);
            con.Open();
            if (con.State.ToString() == "Open" && IsLogin == true && info != null && rate != -1)
            {
                cmd.CommandText = "INSERT INTO [rating] ([username],[mName],[uRating],[comments])" + "VALUES('" + name + "', '" + movieName + "', "+rate+" , '" + info + "')";
                cmd.ExecuteNonQuery();
                con.Close();
                msgOk.Text = "Thank you for your review!";
                Response.AddHeader("REFRESH", "1;URL=MovieInfo.aspx?mID="+movId+"");
            }
            else
            {
                msg.Text = "Could not send the review , please check and try again!";
            }
        }
    }
}