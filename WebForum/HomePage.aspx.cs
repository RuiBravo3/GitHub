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
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GlobalFunctions.Instance().showControllers(this.LinkButtonAccount, this.LinkButtonRegister,
                 this.LinkButtonSignIn, this.LinkButtonSignOut);
            
            //Update user's logged in status.
            if (Session["updateUser"] == null)
                Session["updateUser"] = false;
            if ((bool)Session["updateUser"])
            {
                this.SqlDataSourceUsers.Update();
                Session["updateUser"] = false;
            }

            //Print message if needed.
            GlobalFunctions.Instance().showMessage();
        }

        protected void LinkButtonSignOut_Click(object sender, EventArgs e)
        {
            GlobalFunctions.Instance().signOut(this.LinkButtonAccount, this.LinkButtonRegister,
                 this.LinkButtonSignIn, this.LinkButtonSignOut);
        }

        protected void LinkButtonAccount_Click(object sender, EventArgs e)
        {
            Session["APUserName"] = Session["UserName"].ToString();
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

        protected void GridViewCPUs_DataBound(object sender, EventArgs e)
        {
            this.addLinkButtons(this.SqlDataSourceCPUs, this.GridViewCPUs);
            this.updateGridTopic(this.GridViewCPUs, "CPUs");
        }

        protected void GridViewGPUs_DataBound(object sender, EventArgs e)
        {
            this.addLinkButtons(this.SqlDataSourceGPUs, this.GridViewGPUs);
            this.updateGridTopic(this.GridViewGPUs, "GPUs");
        }

        protected void GridViewCooling_DataBound(object sender, EventArgs e)
        {
            this.addLinkButtons(this.SqlDataSourceCooling, this.GridViewCooling);
            this.updateGridTopic(this.GridViewCooling, "Cooling");
        }

        protected void GridViewMemory_DataBound(object sender, EventArgs e)
        {
            this.addLinkButtons(this.SqlDataSourceMemory, this.GridViewMemory);
            this.updateGridTopic(this.GridViewMemory, "Memory");
        }

        protected void GridViewComponents_DataBound(object sender, EventArgs e)
        {
            this.addLinkButtons(this.SqlDataSourceComponents, this.GridViewComponents);
            this.updateGridTopic(this.GridViewComponents, "Components");
        }

        protected void LinkButtonTopicCPUs_Click(object sender, EventArgs e)
        {
            this.redirectToTopicPage("CPUs", ((LinkButton)sender).Text);
        }

        protected void LinkButtonTopicGPUs_Click(object sender, EventArgs e)
        {
            this.redirectToTopicPage("GPUs", ((LinkButton)sender).Text);
        }

        protected void LinkButtonTopicCooling_Click(object sender, EventArgs e)
        {
            this.redirectToTopicPage("Cooling", ((LinkButton)sender).Text);
        }

        protected void LinkButtonTopicMemory_Click(object sender, EventArgs e)
        {
            this.redirectToTopicPage("Memory", ((LinkButton)sender).Text);
        }

        protected void LinkButtonTopicComponents_Click(object sender, EventArgs e)
        {
            this.redirectToTopicPage("Components", ((LinkButton)sender).Text);
        }

        /// <summary>
        /// Assigns topic names to linkButtons
        /// </summary>
        /// <param name="source"></param>
        /// <param name="gridView"></param>
        private void addLinkButtons(SqlDataSource source, GridView gridView)
        {
            GridView gridTemp = new GridView();
            gridTemp.DataSource = source;
            gridTemp.DataBind();

            for (int i = 0; i < gridTemp.Rows.Count; i++)
                ((LinkButton)gridView.Rows[i].Cells[0].FindControl("LinkButtonTopic")).Text =
                    gridTemp.Rows[i].Cells[1].Text;
        }

        /// <summary>
        /// Updates number of threads and number views in each topic.
        /// </summary>
        /// <param name="gridView"></param>
        /// <param name="category"></param>
        private void updateGridTopic(GridView gridView, string category)
        {
            for (int i = 0; i < gridView.Rows.Count; i++)
            {
                string TopicTitle = ((LinkButton)gridView.Rows[i].Cells[0].
                    FindControl("LinkButtonTopic")).Text.ToString();
                GridView gridViews = new GridView();
                string selectQuery = "SELECT * FROM [Thread] WHERE (category = '" + category +
                    "' AND TopicTitle = '" + TopicTitle + "')";
                OleDbConnection objConnect = new OleDbConnection(System.Configuration.ConfigurationManager.
                    ConnectionStrings["forumConnectionString"].ConnectionString);
                objConnect.Open();
                OleDbCommand objCommand = new OleDbCommand(selectQuery, objConnect);
                OleDbDataReader objDataReader = objCommand.ExecuteReader();
                gridViews.DataSource = objDataReader;
                gridViews.DataBind();
                //Count number of views in each thread.
                int count = 0;
                for (int j = 0; j < gridViews.Rows.Count; j++)
                    count += Convert.ToInt32(gridViews.Rows[j].Cells[4].Text.ToString());

                //Update number of threads in each topic.
                gridView.Rows[i].Cells[1].Text = Convert.ToString(gridViews.Rows.Count);
                //Update number of views in each topic.
                gridView.Rows[i].Cells[2].Text = Convert.ToString(count);
            }
        }

        /// <summary>
        /// Updates Category and Topic in Sessions and redirects to TopicPage.
        /// </summary>
        /// <param name="Category"></param>
        /// <param name="Topic"></param>
        private void redirectToTopicPage(string Category, string Topic)
        {
            Session["Category"] = Category;
            Session["Topic"] = Topic;
            Response.Redirect("TopicPage.aspx");
        }

        protected void LinkButtonTekJunkies_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }

        protected void LinkButtonUsersList_Click(object sender, EventArgs e)
        {
            Response.Redirect("UsersListPage.aspx");
        }
    }
}