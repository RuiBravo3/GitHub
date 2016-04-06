using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebForum
{
    public partial class CreateThread : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Category"] == null || Session["Topic"] == null || (USERTYPE)Session["UserType"]
                == USERTYPE.GUEST)
                Response.Redirect("AccessDeniedPage.aspx");

            GlobalFunctions.Instance().showControllers(this.LinkButtonAccount, this.LinkButtonRegister,
                 this.LinkButtonSignIn, this.LinkButtonSignOut);
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

        /// <summary>
        /// Submit thread and redirect to it.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ButtonSubmitThread_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                GridView gridThread = new GridView();
                gridThread.DataSource = this.SqlDataSourceThread;
                gridThread.DataBind();

                Session["ThreadNumber"] = gridThread.Rows.Count + 1;
                Session["Date"] = DateTime.Now.ToString("dd-MMM-yy");
                Session["ThreadTitle"] = this.TextBoxTitle.Text.ToString();
                this.SqlDataSourceThread.Insert();
                this.SqlDataSourcePost.Insert();
                Response.Redirect("ThreadPage.aspx");
            }
        }

        protected void LinkButtonTekJunkies_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }


    }
}