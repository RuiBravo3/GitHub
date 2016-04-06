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
    public sealed class GlobalFunctions
    {
        private static GlobalFunctions instance = null;
        public static GlobalFunctions Instance() 
        {
            if (instance == null)
                instance = new GlobalFunctions();
            return instance;
        }
        
        
        private GlobalFunctions() { }



        public void signOut(LinkButton Account, LinkButton Register, LinkButton SignIn,
            LinkButton SignOut)
        {
            System.Web.HttpContext.Current.Session["UserType"] = USERTYPE.GUEST;
            System.Web.HttpContext.Current.Session["updateUser"] = true;
            System.Web.HttpContext.Current.Session["loggedIn"] = 0;
            this.showControllers(Account, Register, SignIn, SignOut);
            FormsAuthentication.SignOut();
            System.Web.HttpContext.Current.Response.Redirect("HomePage.aspx");
        }

        public void showControllers(LinkButton Account, LinkButton Register, LinkButton SignIn,
            LinkButton SignOut)
        {
            if (System.Web.HttpContext.Current.Session["UserType"] == null ||
                (USERTYPE)System.Web.HttpContext.Current.Session["UserType"] == USERTYPE.GUEST)
            {
                System.Web.HttpContext.Current.Session["UserType"] = USERTYPE.GUEST;
                Account.Visible = false;
                SignOut.Visible = false;
                SignIn.Visible = true;
                Register.Visible = true;
            }
            else
            {
                Account.Text = System.Web.HttpContext.Current.Session["UserName"].ToString() + "'s profile";
                Account.Visible = true;
                Register.Visible = false;
                SignIn.Visible = false;
                SignOut.Visible = true;
            }
        }

        /// <summary>
        /// Checks that email address is valid.
        /// </summary>
        /// <param name="email"></param>
        /// <returns></returns>
        private bool IsValidEmail(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return true;
            }
            catch
            {
                return false;
            }
        }

        /// <summary>
        /// Checks that password is between 6 to 12 characters.
        /// </summary>
        /// <param name="args"></param>
        public void CustomValidatorPassword(ServerValidateEventArgs args)
        {
            string password = Convert.ToString(args.Value);

            if (password.Length < 6 || password.Length > 12)
                args.IsValid = false;
            else
                args.IsValid = true;
        }

        public void CustomValidatorEmail(ServerValidateEventArgs args)
        {
            string email = Convert.ToString(args.Value);

            if (this.IsValidEmail(email))
                args.IsValid = true;
            else
                args.IsValid = false;
        }

        /// <summary>
        /// </summary>
        /// <param name="selectQuery"></param>
        /// <returns>Returns a GridView with the data requested by the select query.</returns>
        public GridView getGridView(string selectQuery)
        {
            GridView gridView = new GridView();
            OleDbConnection objConnect = new OleDbConnection(System.Configuration.ConfigurationManager.
                    ConnectionStrings["forumConnectionString"].ConnectionString);
            objConnect.Open();
            OleDbCommand objCommand = new OleDbCommand(selectQuery, objConnect);
            OleDbDataReader objDataReader = objCommand.ExecuteReader();
            gridView.DataSource = objDataReader;
            gridView.DataBind();

            return gridView;
        }

        /// <summary>
        /// shows a given message.
        /// </summary>
        public void showMessage()
        {
            if (System.Web.HttpContext.Current.Session["Message"] == null ||
                System.Web.HttpContext.Current.Session["MessageContent"] == null)
                System.Web.HttpContext.Current.Session["Message"] = false;
            if ((bool)System.Web.HttpContext.Current.Session["Message"])
            {
                System.Web.HttpContext.Current.Response.Write("<script type=\"text/javascript\">alert('" +
                    System.Web.HttpContext.Current.Session["MessageContent"].ToString() + "');</script>");
                System.Web.HttpContext.Current.Session["Message"] = false;
            }
        }
    }
}