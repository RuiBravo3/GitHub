using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MRDB
{
    public partial class Contect : System.Web.UI.Page
    {
        bool IsLog = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["FirstName"] != null)
            {
                usrIfLoginlb.Text = Session["FirstName"].ToString();
                IsLog = true;

            }
            else
            {
                usrIfLoginlb.Text = "You MUST login in order to contact Or your the site admin!";
            }
        }

        protected void ApplyBt_Click(object sender, EventArgs e)
        {
            OleDbConnection con = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|database.mdb;");
            OleDbCommand cmd = con.CreateCommand();
            String reason, info;
            String name = "";
            try
            {
                name = Session["FirstName"].ToString();
            }
            catch (NullReferenceException) { }
            if (Convert.ToInt32(reasonLst.Text) == 1)
            {
                reason = "FeedBack";
            }
            else if (Convert.ToInt32(reasonLst.Text) == 2)
            {
                reason = "Site Problems";
            }
            else{
                reason = "Review Issuses";
            }
            info = applyText.Text;

            con.Open();
            if (con.State.ToString() == "Open"  && IsLog == true && info != null )
            {
                cmd.CommandText = "INSERT INTO [contact] ([userName],[Reason],[Info])" + "VALUES('" + name + "', '" + reason + "', '" + info + "')";
                cmd.ExecuteNonQuery();
                con.Close();
                msgok.Text = "Your Application sent Seccsesfully!";
                Response.AddHeader("REFRESH", "3;URL=index.aspx");
            }
            else
            {
                msg.Text = "Could not send the application , please check and try again!";
            }
        }

        protected void reasonLst_SelectedIndexChanged(object sender, EventArgs e)
        {

        }


    }
}