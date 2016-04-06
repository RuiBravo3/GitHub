using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MRDB
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["FirstName"].ToString() != null || Session["Admin"].ToString() != null)
                {
                    Response.Redirect("index.aspx");
                    Response.AddHeader("REFRESH", "0;URL=index.aspx");
                    return;
                }
            }
            catch (NullReferenceException)
            {
            }
        }

        protected void LoginBt_Click(object sender, EventArgs e)
        {
            
              OleDbConnection con = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|database.mdb;");
              OleDbCommand cmd = con.CreateCommand();
              OleDbCommand cmd2 = con.CreateCommand();
              String name, psw1;
              name = usrTextBox.Text;
              psw1 = pswTextBox.Text;
              string result="";
              string type="";
              con.Open();
              if (con.State.ToString() == "Open")
              {
                  cmd.CommandText = "SELECT userName,pass FROM [user] WHERE userName = '"+name+"' AND pass='"+psw1+"'";
               // cmd.Parameters.AddWithValue("@username", name);
               // cmd.Parameters.AddWithValue("@password", psw1);
                  try
                  {
                      result = cmd.ExecuteScalar().ToString();
                      cmd2.CommandText = "SELECT * from [user] where userName='"+result+"'";        
                       OleDbDataReader dr = cmd2.ExecuteReader();
                     while(dr.Read())
                     {
                         type=dr["type"].ToString();
                     }
                        dr.Close();
                  }
                  catch (NullReferenceException)
                  {
                      loginMsglb.Text = "Error : username or password is Invaild!";
                  }
                con.Close();
              }
              else
              {
                  Response.Write("Something went worng check the database connection!");
              }
              if (String.IsNullOrEmpty(result))
              {
                 loginMsglb.Text = "Error : username or password is Invaild!";
              }
              else
              {
                  //loginmsg.Text="Welcome," +name+ " You'r moving now to the index page!";
                  Response.AddHeader("REFRESH", "2;URL=index.aspx");
                  if (type == "Admin")
                  {
                      Session["Admins"] = name;
                      loginMsglb.Text = "Welcome, " + Session["Admins"] + " You'r moving now to the index page!";


                  }

                  else if(type == "Regular")
                  {
                      Session["FirstName"] = name;
                      loginMsglb.Text = "Welcome, " + Session["FirstName"] + " You'r moving now to the index page!";
 
                  }
                  else
                  {
                      Session["Guest"] = name;
                  }

              }
        }
    }
}