using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace WebForum
{
    public partial class LoginPage : System.Web.UI.Page
    {
        private USERTYPE getUserType(GridView gridLogin)
        {
            switch (Convert.ToInt32(gridLogin.Rows[0].Cells[2].Text.ToString()))
            {
                case 1:
                    return USERTYPE.ADMIN;
                case 2:
                    return USERTYPE.USER;
                default:
                    return USERTYPE.GUEST;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginController_Authenticate(object sender, AuthenticateEventArgs e)
        {
            GridView gridLogin = new GridView();
            string strSelectQuery = "SELECT * FROM [User] WHERE (userName = '" +
                this.LoginController.UserName.ToString() + "' AND password = '" + 
                this.LoginController.Password.ToString() + "')";
            this.SqlDataSourceUsers.SelectCommand = strSelectQuery;
            gridLogin.DataSource = this.SqlDataSourceUsers;
            gridLogin.DataBind();
            if (gridLogin.Rows.Count == 1)
            {
                FormsAuthentication.Authenticate(this.LoginController.UserName.ToString(), 
                    this.LoginController.Password.ToString());
                FormsAuthentication.RedirectFromLoginPage(this.LoginController.UserName.ToString(), 
                    true);
                //Save user details to Session.
                Session["UserName"] = this.LoginController.UserName.ToString();
                Session["UserType"] = this.getUserType(gridLogin);
                Session["UserTypeNum"] = Convert.ToInt32(gridLogin.Rows[0].Cells[2].Text.ToString());
                Session["Password"] = this.LoginController.Password.ToString();
                Session["DateJoined"] = gridLogin.Rows[0].Cells[3].Text.ToString();
                Session["email"] = gridLogin.Rows[0].Cells[4].Text.ToString();
                Session["loggedIn"] = 1;
                Session["picFilePath"] = gridLogin.Rows[0].Cells[6].Text.ToString();
                Session["updateUser"] = true;
            }
        }

        protected void LinkButtonTekJunkies_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }
    }
}