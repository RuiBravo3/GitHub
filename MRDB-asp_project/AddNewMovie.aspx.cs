using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MRDB
{
    public partial class AddNewMovie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["Admins"] != null)
                {
                    sitelbInex.Visible = true;
                    Loginbt.Visible = false;
                    registerBt.Visible = false;
                    logout.Visible = true;

                }
                else
                {
                    Response.Redirect("ERROR404.aspx");
                }
            }
            catch (NullReferenceException) { }
        }

        protected void AddmovBt_Click(object sender, EventArgs e)
        {
            int count = -1;
            int mId = -1;
            OleDbConnection con = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|database.mdb;");
            OleDbCommand cmd = con.CreateCommand();
            OleDbCommand cmd2 = con.CreateCommand();
           // OleDbCommand cmd3 = con.CreateCommand();
            String movName,movYear,movLength,movImg,movReview, cName;
            movName=movNmbox.Text;
            movYear = myearbox.Text;
            movLength = movlenbox.Text;
            movImg = imgaddbox.Text;
            movReview = mRevb.Text;
            cName = categodownlist.SelectedValue.ToString();
            con.Open();
            if (movName != "")
            {
                //cmd3.CommandText ="SELECT count(*) FROM [movie]";
                //mId =(int)cmd3.ExecuteScalar()+1;
                cmd.CommandText = "SELECT count(*) FROM [movie] WHERE mName = '" + movName + "'";
                count = (int)cmd.ExecuteScalar();
                if (count > 0)
                {
                    catex.Visible = true;
                    okmsg.Visible = false;
                    con.Close();
                }
                else
                {
                    
                    cmd2.CommandText = "INSERT INTO [movie] ([mName],[mLength],[mYear],[mReview],[image])" + "VALUES('" + movName + "','" + movLength + "','" + movYear + "','" + movReview + "','" + movImg + "')";
                    cmd2.ExecuteNonQuery();
                    cmd2.CommandText = "INSERT INTO movieCategory(mName, cName)"+"VALUES('"+movName+"','"+cName+"')";
                    cmd2.ExecuteNonQuery();
                    con.Close();
                    catex.Visible = false;
                    okmsg.Visible = true;
                    Response.AddHeader("REFRESH", "1;URL=AddNewMovie.aspx");
                }
            }
        }
    }
}