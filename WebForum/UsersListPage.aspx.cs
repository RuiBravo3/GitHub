using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebForum
{
    public partial class UsersListPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GlobalFunctions.Instance().showControllers(this.LinkButtonAccount, this.LinkButtonRegister,
                 this.LinkButtonSignIn, this.LinkButtonSignOut);
            //Enable admin to view all offline users.
            if ((USERTYPE)Session["UserType"] == USERTYPE.ADMIN)
                this.GridViewOffline.Visible = true;
        }

        protected void LinkButtonSignOut_Click(object sender, EventArgs e)
        {
            GlobalFunctions.Instance().signOut(this.LinkButtonAccount, this.LinkButtonRegister,
                 this.LinkButtonSignIn, this.LinkButtonSignOut);
        }

        protected void LinkButtonAccount_Click(object sender, EventArgs e)
        {
            Response.Redirect("AccountPage.aspx");
        }

        protected void LinkButtonRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegistrationPage.aspx");
        }

        protected void LinkButtonSignIn_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginPage.aspx");
        }

        protected void LinkButtonTekJunkies_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }

        protected void LinkButtonUsersONline_Click(object sender, EventArgs e)
        {
            Session["APUserName"] = ((LinkButton)sender).Text;
            Response.Redirect("AccountPage.aspx");
        }

        protected void LinkButtonUsersOffline_Click(object sender, EventArgs e)
        {
            Session["APUserName"] = ((LinkButton)sender).Text;
            Response.Redirect("AccountPage.aspx");
        }


    }
}