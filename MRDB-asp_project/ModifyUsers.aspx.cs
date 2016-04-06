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
    public partial class ModifyUsers : System.Web.UI.Page
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

        protected void goModifbt_Click(object sender, EventArgs e)
        {
            userModgrid.Visible = true;

        }

        protected void updBt_Click(object sender, EventArgs e)
        {
            secclb.Text = "Update Done Seccsesfully!";
            userModgrid.Visible = false;
            Response.AddHeader("REFRESH", "1;URL=ModifyUsers.aspx");
        }

        protected void cenBt_Click(object sender, EventArgs e)
        {
            secclb.Text = "The Action Was Cenceled Seccsesfully!";
            userModgrid.Visible = false;
            Response.AddHeader("REFRESH", "1;URL=ModifyUsers.aspx");
        }

        protected void delBt_Click(object sender, EventArgs e)
        {
            secclb.Text ="User Deleted Seccsesfully!";
            userModgrid.Visible = false;
            Response.AddHeader("REFRESH", "1;URL=ModifyUsers.aspx");
        }

        protected void adduserBt_Click(object sender, EventArgs e)
        {
            OleDbConnection con = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|database.mdb;");
            OleDbCommand cmd = con.CreateCommand();
            String name, psw1, Email1, firstName1, lastName1, utype;
            name = unamebox.Text;
            psw1 = passnamebox.Text;
            Email1 = emailbox.Text;
            firstName1 = fnamebox.Text;
            lastName1 = lnamebox.Text;
            if (permission.SelectedValue.ToString() == "1")
            {
                utype = "Admin";
            }
            else
            {
                utype = "Regular";
            }

            con.Open();
            if (con.State.ToString() == "Open" && name != null && psw1 != null && Email1 != null && firstName1 != null && lastName1 != null)
            {
                cmd.CommandText = "INSERT INTO [user] ([fName],[lName],[userName],[pass], [email], [type])" + "VALUES('" + firstName1 + "', '" + lastName1 + "', '" + name + "', '" + psw1 + "', '" + Email1 + "', '" + utype + "')";
                cmd.ExecuteNonQuery();
                con.Close();
                secclb.Text = "User Added Seccsesfully!";
                Response.AddHeader("REFRESH", "3;URL=ModifyUsers.aspx");
            }
            else
            {
                secclb.ForeColor = Color.PaleVioletRed;
                secclb.Text = "Registration comes with errors , please check and try again!";
            }
        }
    }

}