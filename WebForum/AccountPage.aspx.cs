using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace WebForum
{
    public partial class AccountPage : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            GlobalFunctions.Instance().showControllers(this.LinkButtonAccount, this.LinkButtonRegister,
                 this.LinkButtonSignIn, this.LinkButtonSignOut);
            this.LinkButtonAccount.Visible = false;

            if (Session["APUserName"] == null)
                Response.Redirect("AccessDeniedPage.aspx");
            if (Session["UserName"] == null)
                Session["UserName"] = "";

            //Don't allow to change information if entering another user's account page.
            if (!Session["APUserName"].ToString().Equals(Session["UserName"].ToString()))
            {
                this.LinkButtonUploadFile.Visible = false;
                this.LinkButtonChangeMail.Visible = false;
                this.LinkButtonChangePassword.Visible = false;
                this.LinkButtonInbox.Visible = false;
                this.LinkButtonOutbox.Visible = false;
                //Don't allow guests to send PMs.
                if ((USERTYPE)Session["UserType"] == USERTYPE.GUEST)
                    this.LinkButtonShowPMDialog.Visible = false;
                //Enable admin to delete other users.
                if ((USERTYPE)Session["UserType"] == USERTYPE.ADMIN)
                    this.ButtonDeleteUser.Visible = true;
            }

            //Print message if needed.
            GlobalFunctions.Instance().showMessage();

            //Get all user's information.
            GridView gridUser = new GridView();
            gridUser.DataSource = this.SqlDataSourceUsers;
            gridUser.DataBind();

            GridView gridPosts = new GridView();
            gridPosts.DataSource = this.SqlDataSourcePosts;
            gridPosts.DataBind();

            //Update controllers.
            this.LabelAccountName.Text = Session["APUserName"].ToString();
            this.LabelJoinedIn.Text = gridUser.Rows[0].Cells[3].Text.ToString();
            this.LabelPosts.Text = Convert.ToString(gridPosts.Rows.Count);
            this.LabelEmail.Text = gridUser.Rows[0].Cells[4].Text.ToString();
            this.ImageAvatar.ImageUrl = gridUser.Rows[0].Cells[6].Text.ToString();
            if (this.ImageAvatar.ImageUrl.StartsWith("&"))
                this.ImageAvatar.Visible = false;
            this.LabelThreadsUserName.Text = Session["APUserName"].ToString();
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

        protected void CustomValidatorEmail_ServerValidate(object source, ServerValidateEventArgs args)
        {
            GlobalFunctions.Instance().CustomValidatorEmail(args);
        }

        protected void CustomValidatorPassword_ServerValidate(object source, ServerValidateEventArgs args)
        {
            GlobalFunctions.Instance().CustomValidatorPassword(args);
        }
        
        /// <summary>
        /// Shows controllers assosiated with changing email.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void LinkButtonChangeMail_Click(object sender, EventArgs e)
        {
            this.LinkButtonChangeMail.Visible = true;
            this.LabelnewEmail.Visible = true;
            this.TextBoxNewEmail.Visible = true;
            this.LinkButtonConfirmEmail.Visible = true;
        }

        /// <summary>
        /// if everything is valid update user's email.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void LinkButtonConfirmEmail_Click(object sender, EventArgs e)
        {
            if (this.RequiredFieldValidatorEmail.IsValid && this.CustomValidatorEmail.IsValid)
            {
                Session["email"] = this.TextBoxNewEmail.Text.ToString();
                this.updateUserInfo("Email address changed.");
            }
            else
            {
                this.RequiredFieldValidatorEmail.Visible = true;
                this.CustomValidatorEmail.Visible = true;
            }
        }

        /// <summary>
        /// Shows controllers assosiated with changing password.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void LinkButtonChangePassword_Click(object sender, EventArgs e)
        {
            this.LabelnewTypePassword.Visible = true;
            this.TextBoxNewPassword.Visible = true;
            this.LabelnewReTypePassword.Visible = true;
            this.TextBoxRetypePassword.Visible = true;
            this.LinkButtonConfirmPassword.Visible = true;
            this.LinkButtonChangePassword.Visible = false;
        }

        /// <summary>
        /// if everything is valid update user's password.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void LinkButtonConfirmPassword_Click(object sender, EventArgs e)
        {
            if (this.RequiredFieldValidatorPassword.IsValid &&
                this.RequiredFieldValidatorRetypePassword0.IsValid &&
                this.CustomValidatorPassword.IsValid && this.CompareValidatorPassword.IsValid)
            {
                Session["Password"] = this.TextBoxNewPassword.Text.ToString();
                this.updateUserInfo("Password changed.");
            }
            else
            {
                this.RequiredFieldValidatorPassword.Visible = true;
                this.RequiredFieldValidatorRetypePassword0.Visible = true;
                this.CustomValidatorPassword.Visible = true;
                this.CompareValidatorPassword.Visible = true;
            }
        }

        /// <summary>
        /// Shows controllers assosiated with uploading an image file.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void LinkButtonUploadFile_Click(object sender, EventArgs e)
        {
            this.LinkButtonUploadFile.Visible = false;
            this.FileUploadPic.Visible = true;
            this.ButtonUploadFile.Visible = true;
        }

        /// <summary>
        /// Uploads a given image file to the server.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ButtonUploadFile_Click(object sender, EventArgs e)
        {
            if (this.FileUploadPic.HasFile)
            {
                string str2Save = "", str2write = "", strTimestamp = "", strTemp = "";
                strTimestamp = DateTime.Now.ToFileTime().ToString();
                str2Save = Server.MapPath(strTemp) + "\\" + strTimestamp + this.FileUploadPic.FileName.ToString();
                str2write = "~\\" + strTimestamp + this.FileUploadPic.FileName.ToString();

                this.FileUploadPic.SaveAs(str2Save);
                this.ImageAvatar.ImageUrl = str2write;
                this.ImageAvatar.Visible = true;

                Session["picFilePath"] = str2write;
                this.updateUserInfo("Avatar uploaded successfully.");
            }
        }

        /// <summary>
        /// Validates that the given user is in database.
        /// </summary>
        /// <param name="source"></param>
        /// <param name="args"></param>
        protected void CustomValidatorUserNotFound_ServerValidate(object source, ServerValidateEventArgs args)
        {
            GridView gridUser = new GridView();
            gridUser.DataSource = this.SqlDataSourceAllUsers;
            gridUser.DataBind();

            string userName = Convert.ToString(args.Value);
            bool inGrid = false;

            for (int i = 0; i < gridUser.Rows.Count; i++)
                if (gridUser.Rows[i].Cells[0].Text.ToString().Equals(userName))
                {
                    inGrid = true;
                    break;
                }
            if (inGrid)
                args.IsValid = true;
            else
                args.IsValid = false;
        }

        /// <summary>
        /// If everything is valid sends PM.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ButtonSendPM_Click(object sender, EventArgs e)
        {
            if (this.RequiredFieldValidatorPMUserName.IsValid &&
                this.RequiredFieldValidatorPMUMessage.IsValid && this.CustomValidatorUserNotFound.IsValid)
            {
                GridView gridPM = new GridView();
                gridPM.DataSource = this.SqlDataSourcePM;
                gridPM.DataBind();

                Session["PMID"] = gridPM.Rows.Count + 1;
                Session["Date"] = DateTime.Now.ToString("dd-MMM-yy");

                this.SqlDataSourcePM.Insert();
                Session["Message"] = true;
                Session["MessageContent"] = "PM sent.";
                Response.Redirect("AccountPage.aspx");
            }
            else
            {
                this.RequiredFieldValidatorPMUserName.Visible = true;
                this.RequiredFieldValidatorPMUMessage.Visible = true;
                this.CustomValidatorUserNotFound.Visible = true;
            }
        }

        /// <summary>
        /// Shows controllers assosiated with sending a PM.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void LinkButtonShowPMDialog_Click(object sender, EventArgs e)
        {
            if (!Session["APUserName"].ToString().Equals(Session["UserName"].ToString()))
                this.TextBoxPMUserName.Text = Session["APUserName"].ToString();
            else
            {
                this.TextBoxPMUserName.Visible = true;
                this.LabelSendTo.Visible = true;
            }

            this.LinkButtonShowPMDialog.Visible = false;
            this.LabelMessage.Visible = true;
            this.ButtonSendPM.Visible = true;
            this.TextBoxMessage.Visible = true;
        }

        /// <summary>
        /// Shows incoming PMs.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void LinkButtonInbox_Click(object sender, EventArgs e)
        {
            this.LinkButtonInbox.Visible = false;
            this.LinkButtonOutbox.Visible = true;
            this.GridViewOutbox.Visible = false;
            this.GridViewInbox.Visible = true;
        }

        /// <summary>
        /// Shows sent PMs.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void LinkButtonOutbox_Click(object sender, EventArgs e)
        {
            this.LinkButtonOutbox.Visible = false;
            this.LinkButtonInbox.Visible = true;
            this.GridViewOutbox.Visible = true;
            this.GridViewInbox.Visible = false;
        }

        /// <summary>
        /// Updates user information and refreshes the page.
        /// </summary>
        /// <param name="message"></param>
        private void updateUserInfo(string message)
        {
            this.SqlDataSourceUsers.Update();
            Session["Message"] = true;
            Session["MessageContent"] = message;
            Response.Redirect("AccountPage.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            this.redirectToUP(((LinkButton)sender).Text.ToString());
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            this.redirectToUP(((LinkButton)sender).Text.ToString());
        }

        /// <summary>
        /// Redirects to a given user's account page.
        /// </summary>
        /// <param name="UserName"></param>
        private void redirectToUP(string UserName)
        {
            Session["APUserName"] = UserName;
            Response.Redirect("AccountPage.aspx");
        }

        /// <summary>
        /// Removes user from database and redirects to home page.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ButtonDeleteUser_Click(object sender, EventArgs e)
        {
            Session["Message"] = true;
            Session["MessageContent"] = "User " + Session["APUserName"].ToString() + "removed successfully.";
            this.SqlDataSourceUsers.Delete();
            Response.Redirect("HomePage.aspx");
        }

        protected void LinkButtonTekJunkies_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }

        protected void GridViewThreads_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridViewThreads_DataBound(object sender, EventArgs e)
        {
            //this.GridViewThreads.Columns[3].Visible = false;

            GridView gridPosts = new GridView();
            gridPosts.DataSource = this.SqlDataSourcePosts;
            gridPosts.DataBind();

            GridView gridThreads = new GridView();
            gridThreads.DataSource = this.SqlDataSourceAllTHreads;
            gridThreads.DataBind();

            //Remove rows that show threads that don't contain any of the user's posts.
            for (int i = 0; i < this.GridViewThreads.Rows.Count; i++)
            {
                bool inThreads = false;

                for (int j = 0; j < gridPosts.Rows.Count; j++)
                    if (gridThreads.Rows[i].Cells[0].Text.Equals(gridPosts.Rows[j].Cells[0].Text)
                        && gridThreads.Rows[i].Cells[1].Text.Equals(gridPosts.Rows[j].Cells[1].Text)
                        && gridThreads.Rows[i].Cells[3].Text.Equals(gridPosts.Rows[j].Cells[2].Text))
                        inThreads = true;

                if (!inThreads)
                    this.GridViewThreads.Rows[i].Visible = false;
            }
        }

        protected void LinkButtonTopic_Click(object sender, EventArgs e)
        {
            Session["Topic"] = ((LinkButton)sender).Text.ToString();
            for (int i = 0; i < this.GridViewThreads.Rows.Count; i++)
                ((LinkButton)this.GridViewThreads.Rows[i].Cells[1].FindControl("LinkButtonTopic")).Text = 
                    Convert.ToString(i);
            Session["Category"] = this.GridViewThreads.Rows[Convert.ToInt32(((LinkButton)sender).
                Text.ToString())].Cells[0].Text.ToString();

            Response.Redirect("TopicPage.aspx");
        }

        protected void LinkButtonThread_Click(object sender, EventArgs e)
        {
            Session["ThreadTitle"] = ((LinkButton)sender).Text.ToString();
            for (int i = 0; i < this.GridViewThreads.Rows.Count; i++)
                ((LinkButton)this.GridViewThreads.Rows[i].Cells[2].FindControl("LinkButtonThread")).Text =
                    Convert.ToString(i);
            Session["Category"] = this.GridViewThreads.Rows[Convert.ToInt32(((LinkButton)sender).
                Text.ToString())].Cells[0].Text.ToString();
            Session["Topic"] = ((LinkButton)this.GridViewThreads.Rows[Convert.ToInt32(((LinkButton)sender).
                Text.ToString())].Cells[1].FindControl("LinkButtonTopic")).Text.ToString();
            Session["ThreadNumber"] = Convert.ToInt32(((Label)this.GridViewThreads.Rows[Convert.ToInt32(((LinkButton)sender).Text.ToString())].Cells[3].FindControl("LabelThreadNumber")).Text.ToString());

            Response.Redirect("ThreadPage.aspx");
        }
    }
}