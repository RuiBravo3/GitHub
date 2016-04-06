using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MRDB
{
    public partial class index : System.Web.UI.Page
    {
        bool isHe = true;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (isHe == true)
            {
                ifLogin.Text = "Welcome , Guest - To enjoy all features please Register OR Login!";
            }
            try
            {
                if (Session["Admins"].ToString() != null)
                {
                    isHe = false;
                    ifLogin.Text = "Welcome ," + Session["Admins"].ToString() + "";
                    Loginbt.Visible = false;
                    logout.Visible = true;
                    adminplb.Visible = true;
                    registerBt.Visible = false;
                    comalb.Visible = true;
                }
            }
            catch (NullReferenceException)
            {
            }
            try
            {
                if (Session["FirstName"].ToString() != null)
                {
                    isHe = false;
                    ifLogin.Text = "Welcome ," + Session["FirstName"].ToString() + "";
                    Loginbt.Visible = false;
                    logout.Visible = true;
                    registerBt.Visible = false;
                }
            }
            catch (NullReferenceException)
            {
            }

        }
    }
}