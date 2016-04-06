using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebForum
{
    public partial class ThreadPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Category"] == null || Session["Topic"] == null || Session["ThreadNumber"] == null)
                Response.Redirect("AccessDeniedPage.aspx");

            //Show controllers.
            GlobalFunctions.Instance().showControllers(this.LinkButtonAccount, this.LinkButtonRegister,
                 this.LinkButtonSignIn, this.LinkButtonSignOut);
            this.LabelCategory.Text = Session["Category"].ToString();
            this.LinkButtonTopic.Text = Session["Topic"].ToString();
            this.LabelThreadTitle.Text = Session["ThreadTitle"].ToString();

            //Enable users to reply.
            if ((USERTYPE)Session["UserType"] == USERTYPE.USER || (USERTYPE)Session["UserType"] == USERTYPE.ADMIN)
            {
                this.TextBoxReply.Visible = true;
                this.ButtonReply.Visible = true;
            }
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

        protected void GridViewPosts_DataBound(object sender, EventArgs e)
        {
            GridView gridPosts = new GridView();
            gridPosts.DataSource = this.SqlDataSourcePost;
            gridPosts.DataBind();

            GridView gridAllPosts = new GridView();
            gridAllPosts.DataSource = this.SqlDataSourceAllPosts;
            gridAllPosts.DataBind();

            GridView gridUsers = new GridView();
            gridUsers.DataSource = this.SqlDataSourceUsers;
            gridUsers.DataBind();

            for (int i = 0; i < this.GridViewPosts.Rows.Count; i++)
            {
                string userName = gridPosts.Rows[i].Cells[0].Text.ToString();
                string postedOn = gridPosts.Rows[i].Cells[1].Text.ToString();
                string picFilePath = null;
                string dateJoined = null;
                int posts = 0;
                bool loggedIn = false;

                //Count posts.
                for (int j = 0; j < gridAllPosts.Rows.Count; j++)
                    if (gridAllPosts.Rows[j].Cells[6].Text.ToString().Equals(userName))
                        posts++;

                //Get picFilePath, dateJoined and loggedIn.
                for (int j = 0; j < gridUsers.Rows.Count; j++)
                    if (gridUsers.Rows[j].Cells[0].Text.ToString().Equals(userName))
                    {
                        //dateJoined = gridUsers.Rows[j].Cells[3].Text.ToString();
                        loggedIn = Convert.ToBoolean(Convert.ToInt32(gridUsers.Rows[j].Cells[5].
                            Text.ToString()));
                        picFilePath = gridUsers.Rows[j].Cells[6].Text.ToString();
                    }

                //Update the controllers.
                Image avatar = (Image)this.GridViewPosts.Rows[i].Cells[0].FindControl("ImageAvatar");
                avatar.ImageUrl = picFilePath;
                if (avatar.ImageUrl.StartsWith("&"))
                    avatar.Visible = false;

                Label labelDateJoined = (Label)this.GridViewPosts.Rows[i].Cells[0].FindControl("LabelDateJoined");
                labelDateJoined.Text += dateJoined;

                Label labelPosts = (Label)this.GridViewPosts.Rows[i].Cells[0].FindControl("LabelPosts");
                labelPosts.Text += Convert.ToString(posts);

                Label labelPostedOn = (Label)this.GridViewPosts.Rows[i].Cells[0].FindControl("LabelPostDate");
                labelPostedOn.Text += dateJoined;

                Label labelLoggedIn = (Label)this.GridViewPosts.Rows[i].Cells[0].FindControl("LabelLoggedIn");
                if (loggedIn)
                {
                    labelLoggedIn.Text = "Online";
                    labelLoggedIn.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    labelLoggedIn.Text = "offline";
                    labelLoggedIn.ForeColor = System.Drawing.Color.Red;
                }

                ((Button)this.GridViewPosts.Rows[i].Cells[1].FindControl("ButtonDelete")).Text = "Delete";

                switch ((USERTYPE)Session["UserType"])
                {
                    //Guests can't edit/delete any posts
                    case USERTYPE.GUEST:
                        ((Button)this.GridViewPosts.Rows[i].Cells[1].FindControl("ButtonEdit")).Visible =false;
                        ((Button)this.GridViewPosts.Rows[i].Cells[1].FindControl("ButtonDelete")).Visible = false;
                        break;
                    //Normal users can edit/delete only posts
                    case USERTYPE.USER:
                        if (!Session["UserName"].ToString().Equals(userName))
                        {
                            ((Button)this.GridViewPosts.Rows[i].Cells[1].FindControl("ButtonEdit")).Visible = false;
                            ((Button)this.GridViewPosts.Rows[i].Cells[1].FindControl("ButtonDelete")).Visible = false;
                        }
                        break;
                    //Admins can edit/delete any posts.
                    default:
                        break;
                }
            }
        }

        protected void GridViewPosts_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ButtonReply_Click(object sender, EventArgs e)
        {
            Session["Date"] = DateTime.Now.ToString("dd-MMM-yy");
            Session["PostNumber"] = this.GridViewPosts.Rows.Count + 1;
            Session["Content"] = this.TextBoxReply.Text.ToString();
            this.SqlDataSourcePost.Insert();
            this.TextBoxReply.Text = "";
        }

        protected void GridViewPosts_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Deletes a post from the thread.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            GridView gridPosts = new GridView();
            gridPosts.DataSource = this.SqlDataSourcePost;
            gridPosts.DataBind();

            for (int i = 0; i < this.GridViewPosts.Rows.Count; i++)
                ((Button)this.GridViewPosts.Rows[i].Cells[1].FindControl("ButtonDelete")).Text =
                    gridPosts.Rows[i].Cells[3].Text.ToString();

            Session["PostNumber"] = ((Button)sender).Text;
            this.SqlDataSourcePost.Delete();
        }

        protected void ButtonEdit_Click(object sender, EventArgs e)
        {
            GridView gridPosts = new GridView();
            gridPosts.DataSource = this.SqlDataSourcePost;
            gridPosts.DataBind();

             for (int i = 0; i < this.GridViewPosts.Rows.Count; i++)
                 ((Button)this.GridViewPosts.Rows[i].Cells[1].FindControl("ButtonEdit")).Text =
                   gridPosts.Rows[i].Cells[3].Text.ToString();

             for (int i = 0; i < this.GridViewPosts.Rows.Count; i++)
                 if (((Button)this.GridViewPosts.Rows[i].Cells[1].FindControl("ButtonEdit")).Text.Equals
                     (((Button)sender).Text))
                 {
                     //((Button)this.GridViewPosts.Rows[i].Cells[1].FindControl("ButtonEdit")).Text = "Delete";
                     ((Button)this.GridViewPosts.Rows[i].Cells[1].FindControl("ButtonEdit")).Visible = false;
                     ((TextBox)this.GridViewPosts.Rows[i].Cells[1].FindControl("TextBoxEdit")).Text =
                           ((Label)this.GridViewPosts.Rows[i].Cells[1].FindControl("Label2")).Text;
                     ((Label)this.GridViewPosts.Rows[i].Cells[1].FindControl("Label2")).Visible = false;
                     ((TextBox)this.GridViewPosts.Rows[i].Cells[1].FindControl("TextBoxEdit")).Visible = true;
                     ((Button)this.GridViewPosts.Rows[i].Cells[1].FindControl("ButtonSave")).Visible = true;
                     break;
                 }
        }

        protected void ButtonSave_Click(object sender, EventArgs e)
        {
            GridView gridPosts = new GridView();
            gridPosts.DataSource = this.SqlDataSourceAllPosts;
            gridPosts.DataBind();
            int i;

             for (i = 0; i < this.GridViewPosts.Rows.Count; i++)
                 ((Button)this.GridViewPosts.Rows[i].Cells[1].FindControl("ButtonSave")).Text =
                   gridPosts.Rows[i].Cells[3].Text.ToString();

             for (int j = 0; j < this.GridViewPosts.Rows.Count; j++)
                 if (((Button)this.GridViewPosts.Rows[j].Cells[1].FindControl("ButtonSave")).Text.Equals
                     (((Button)sender).Text))
                 {
                     Session["Date"] = gridPosts.Rows[Convert.ToInt32(((Button)sender).Text) - 1].Cells[5].Text.ToString();
                     Session["PostNumber"] = Convert.ToInt32(gridPosts.Rows[Convert.ToInt32
                         (((Button)sender).Text) - 1].Cells[3].Text.ToString());
                     Session["Content"] = ((TextBox)this.GridViewPosts.Rows[j].Cells[1].
                     FindControl("TextBoxEdit")).Text.ToString();
                     break;
                 }
             this.SqlDataSourcePost.Update();
        }

        protected void LinkButtonUserName_Click(object sender, EventArgs e)
        {
            Session["APUserName"] = ((LinkButton)sender).Text.ToString();
            Response.Redirect("AccountPage.aspx");
        }

        protected void LinkButtonTopic_Click(object sender, EventArgs e)
        {
            Response.Redirect("TopicPage.aspx");
        }

        protected void LinkButtonTekJunkies_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }
    }
}