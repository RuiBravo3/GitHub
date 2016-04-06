using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MRDB
{
    public partial class ModifyMovie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admins"] != null)
            {
                sitelbInex.Visible = true;
                Loginbt.Visible = false;
                registerBt.Visible = false;
                logout.Visible = true;

            }
            else
            {
                Response.Redirect("ERROR404.aspx");
            }
        }

        protected void btmSelected_Click(object sender, EventArgs e)
        {
           // selectedMovieGridm.DataBind();
            selectedMovieGridm.Visible = true;
            Session["getTheNAME"] = mdropdown.SelectedValue.ToString();
        }
    }
}