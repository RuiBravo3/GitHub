using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MRDB
{
    public partial class AddNewCategory : System.Web.UI.Page
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

        protected void addCat_Click(object sender, EventArgs e)
        {
            int count = -1;
              OleDbConnection con = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|database.mdb;");
              OleDbCommand cmd = con.CreateCommand();
              OleDbCommand cmd2 = con.CreateCommand();
              String catName;
              catName = catTextbox.Text;
              con.Open();
              if (con.State.ToString() == "Open" && catName != "")
              {
                  cmd.CommandText = "SELECT count(*) FROM [mCategory] WHERE cName = '" + catName + "'";
                  count = (int)cmd.ExecuteScalar();
                  if(count>0){
                      catex.Visible = true;
                      okmsg.Visible = false;
                      con.Close();
                  }
                  else
                  {
                      cmd2.CommandText = "INSERT INTO mCategory ([cName])" + "VALUES('" + catName + "')";
                      cmd2.ExecuteNonQuery();
                      con.Close();
                      catex.Visible = false;
                      okmsg.Visible = true;
                      Response.AddHeader("REFRESH", "1;URL=AddNewCategory.aspx");
                  }
              }
        }
    }
}