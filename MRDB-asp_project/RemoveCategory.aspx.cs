using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MRDB
{
    public partial class RemoveCategory : System.Web.UI.Page
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
            OleDbConnection con = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|database.mdb;");
            OleDbCommand cmd = con.CreateCommand();
            OleDbCommand cmd2 = con.CreateCommand();
            String catName;
            catName = catNamedrop.Text;
            con.Open();
            if (catName != "")
            {
                cmd.CommandText = "DELETE FROM [mCategory] WHERE cName = '" + catName + "'";
                cmd.ExecuteNonQuery();
                cmd2.CommandText = "UPDATE [movieCategory] SET cName = 'None' where cName = '" + catName + "'";
                cmd2.ExecuteNonQuery();
                con.Close();
                okmsg.Visible = true;
                Response.AddHeader("REFRESH", "1;URL=RemoveCategory.aspx");
            }
            else
            {
                errlb.Visible = false;
            }
        }
    }
}