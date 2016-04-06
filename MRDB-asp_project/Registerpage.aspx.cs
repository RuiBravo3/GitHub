using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MRDB
{
    public partial class Registerpage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegisterNow_Click(object sender, EventArgs e)
        {
            
            OleDbConnection con = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|database.mdb;");
            OleDbCommand cmd = con.CreateCommand();
            String name, psw1, Email1, firstName1, lastName1, utype;
            name = usrNameBox.Text;
            psw1 = passBox.Text;
            Email1 = emailaddBox.Text;
            firstName1 = firstNameTxBox.Text;
            lastName1 = LastNametxtBox.Text;
            utype = "Regular";

            con.Open();
            if (con.State.ToString() == "Open" && name!=null && psw1!=null && Email1!=null && firstName1!=null && lastName1!=null)
            {
                cmd.CommandText = "INSERT INTO [user] ([fName],[lName],[userName],[pass], [email], [type])" + "VALUES('" + firstName1 + "', '" + lastName1 + "', '" + name + "', '" + psw1 + "', '" + Email1 + "', '" + utype + "')";
                cmd.ExecuteNonQuery();
                con.Close();
                registrationComplete.Text = "Registration Finished Seccsesfully!";
                Response.AddHeader("REFRESH", "3;URL=index.aspx");
            }
            else
            {
                registrationComplete.Text = "Registration comes with errors , please check and try again!";
            }
        }
    }
}