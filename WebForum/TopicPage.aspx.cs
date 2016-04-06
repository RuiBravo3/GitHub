using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.OleDb;

namespace WebForum
{
    public partial class TopicPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Category"] == null || Session["Topic"] == null)
                Response.Redirect("AccessDeniedPage.aspx");

            GlobalFunctions.Instance().showControllers(this.LinkButtonAccount, this.LinkButtonRegister,
                 this.LinkButtonSignIn, this.LinkButtonSignOut);
            if (Session["UserType"] == null)
                Session["UserType"] = USERTYPE.GUEST;
            if ((USERTYPE)Session["UserType"] == USERTYPE.GUEST)
                this.LinkButtonCreateThread.Visible = false;
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

        protected void GridViewThreads_DataBound(object sender, EventArgs e)
        {
            GridView gridTemp = new GridView();
            gridTemp.DataSource = this.SqlDataSourceThreads;
            gridTemp.DataBind();

            for (int i = 0; i < this.GridViewThreads.Rows.Count; i++)
            {
                //Assigns thread names to linkButtons.
                ((LinkButton)this.GridViewThreads.Rows[i].Cells[0].FindControl("LinkButtonThread")).Text =
                    gridTemp.Rows[i].Cells[0].Text;

                //GridView gridReplies = new GridView();
                string selectQuery = "SELECT * FROM [Post] WHERE (Category = '" +
                    Session["Category"].ToString() + "' AND TopicTitle = '" + Session["Topic"] +
                    "' AND ThreadNumber = " + gridTemp.Rows[i].Cells[2].Text + ")";

                GridView gridReplies = GlobalFunctions.Instance().getGridView(selectQuery);

                //Update number of replies in each thread.
                this.GridViewThreads.Rows[i].Cells[1].Text = Convert.ToString(gridReplies.Rows.Count);
            }
        }

        protected void LinkButtonThread_Click(object sender, EventArgs e)
        {
            GridView gridTemp = new GridView();
            gridTemp.DataSource = this.SqlDataSourceThreads;
            gridTemp.DataBind();

            for (int i = 0; i < this.GridViewThreads.Rows.Count; i++)
                ((LinkButton)this.GridViewThreads.Rows[i].Cells[0].FindControl("LinkButtonThread")).Text =
                    gridTemp.Rows[i].Cells[2].Text;

            Session["ThreadNumber"] = Convert.ToInt32(((LinkButton)sender).Text);

            for (int i = 0; i < gridTemp.Rows.Count; i++)
                if (gridTemp.Rows[i].Cells[2].Text.Equals(Session["ThreadNumber"].ToString()))
                {
                    Session["ThreadTitle"] = gridTemp.Rows[i].Cells[0].Text;
                    Session["ThreadViews"] = Convert.ToString(Convert.ToInt32(gridTemp.Rows[i].Cells[1].Text) + 1);
                    Session["ThreadDateCreated"] = gridTemp.Rows[i].Cells[3].Text;
                    break;
                }
            //Update view count.
            this.SqlDataSourceThreads.Update();

            Response.Redirect("ThreadPage.aspx");
        }

        protected void LinkButtonCreateThread_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateThread.aspx");
        }

        protected void LinkButtonTekJunkies_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }
    }
}