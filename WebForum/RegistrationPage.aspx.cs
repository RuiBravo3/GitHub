using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebForum
{
    public partial class RegistrationPage : System.Web.UI.Page
    {
        /// <summary>
        /// If all the input is valid add user to datebase and reidrect to home page.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void LinkButtonAddUser_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                this.SqlDataSourceUsers.Insert();
                Session["Message"] = true;
                Session["MessageContent"] = "RegistrationSuccessful";
                Response.Redirect("HomePage.aspx");
            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserType"] == null || (USERTYPE)Session["UserType"] == USERTYPE.GUEST)
                Session["UserType"] = USERTYPE.GUEST;
            else
                Response.Redirect("AccessDenied.aspx");

            Session["Date"] = DateTime.Now.ToString("dd-MMM-yy");
        }

        /// <summary>
        /// Validator that checks that user name is unique and is between 3 to 12 characters.
        /// </summary>
        /// <param name="source"></param>
        /// <param name="args"></param>
        protected void CustomValidatorName_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string userName = Convert.ToString(args.Value);

            GridView grid = new GridView();
            string strSelectQuery = "SELECT * FROM [User] WHERE (userName = '" + userName + "')";
            this.SqlDataSourceUsers.SelectCommand = strSelectQuery;
            grid.DataSource = this.SqlDataSourceUsers;
            grid.DataBind();

            if (grid.Rows.Count > 0 || userName.Length < 3 || userName.Length > 12)
                args.IsValid = false;
            else
                args.IsValid = true;
        }

        /// <summary>
        /// Validator that checks that password is between 6 to 12 characters.
        /// </summary>
        /// <param name="source"></param>
        /// <param name="args"></param>
        protected void CustomValidatorPassword_ServerValidate(object source, ServerValidateEventArgs args)
        {
            GlobalFunctions.Instance().CustomValidatorPassword(args);
        }

        /// <summary>
        /// Validator that checks that email address is valid.
        /// </summary>
        /// <param name="source"></param>
        /// <param name="args"></param>
        protected void CustomValidatorEmail_ServerValidate(object source, ServerValidateEventArgs args)
        {
            GlobalFunctions.Instance().CustomValidatorEmail(args);
        }

        protected void LinkButtonTekJunkies_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }
    }
}