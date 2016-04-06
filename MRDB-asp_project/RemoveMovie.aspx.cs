using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MRDB
{
    public partial class RemoveMovie : System.Web.UI.Page
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

        protected void delBt_Click(object sender, EventArgs e)
        {
            int mId = -1;
            OleDbConnection con = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|database.mdb;");
            OleDbCommand cmd = con.CreateCommand();
            OleDbCommand cmd2 = con.CreateCommand();
            OleDbCommand cmd3 = con.CreateCommand();
            OleDbCommand cmd4 = con.CreateCommand();
            String movName;
            movName = selectMoviedrop.SelectedValue.ToString();
            con.Open();
            if (movName != "")
            {
                cmd.CommandText = "SELECT mId FROM [movie] WHERE mName = '" + movName + "'";
                try
                {
                    mId = (int)cmd.ExecuteScalar();
                }
                catch (NullReferenceException) { }
                cmd2.CommandText = "DELETE FROM [movie] where mId ="+mId+"";
                cmd2.ExecuteNonQuery();
                cmd3.CommandText = "DELETE FROM [movieCategory] where mName = '"+movName+"'";
                cmd3.ExecuteNonQuery();
                cmd4.CommandText = "DELETE FROM [rating] where mName = '" + movName + "'";
                cmd4.ExecuteNonQuery();
                con.Close();
                okmsg.Visible = true;
                Response.AddHeader("REFRESH", "1;URL=RemoveMovie.aspx");
            }
            else
            {
                errlb.Visible = false;
            }
        
        }
    }
}