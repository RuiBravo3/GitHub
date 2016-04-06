using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MRDB
{
    public partial class SiteMesseges : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
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

        protected void udptBt_Click(object sender, EventArgs e)
        {
            oklbl.ForeColor = Color.Green;
            msgGrid.Visible = false;
            oklbl.Text = "Message Info Updated Secsesfully!";
            Response.AddHeader("REFRESH", "1;URL=SiteMessages.aspx");
        }

        protected void dbt_Click(object sender, EventArgs e)
        {
            oklbl.ForeColor = Color.Green;
            msgGrid.Visible = false;
            oklbl.Text = "Message Deleted Secsesfully!";
            Response.AddHeader("REFRESH", "1;URL=SiteMessages.aspx");
        }

        protected void cnBt_Click(object sender, EventArgs e)
        {
            msgGrid.Visible = false;
            oklbl.ForeColor = Color.Red;
            oklbl.Text = "The Action Cenceled Secsesfully!";
            Response.AddHeader("REFRESH", "1;URL=SiteMessages.aspx");
        }

        protected void addMsg_Click(object sender, EventArgs e)
        {
            oklblm.Text = "";
            OleDbConnection con = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|database.mdb;");
            OleDbCommand cmd = con.CreateCommand();
            String msgTitle, msgDate, msgBody;
            msgTitle = msgTitleBox.Text;
            msgBody = BodyBox.Text;
            msgDate = DateBox.Text;
            con.Open();
            if (con.State.ToString() == "Open" && msgTitle != null && msgDate != null && msgBody != null)
            {
                cmd.CommandText = "INSERT INTO [messages] ([msgName],[postDate],[msgBody])" + "VALUES('" + msgTitle + "', '" + msgDate + "', '" + msgBody + "')";
                cmd.ExecuteNonQuery();
                con.Close();
                oklblm.Text = "The Message Added Seccsesfully!";
                Response.AddHeader("REFRESH", "3;URL=SiteMessages.aspx");
            }
            else
            {
                oklblm.Text = "Couldnt Add the message Please review again all the fileds!";
            }
        }
    }
}