using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MRDB
{
    public partial class ModifyComments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
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
            catch (NullReferenceException) { }
        }

        protected void showcom_Click(object sender, EventArgs e)
        {
            oklbl.Text = "";
            commentsGrid.DataBind();
            if (commentsGrid.Rows.Count == 0)
            {
                oklbl.ForeColor = Color.Red;
                oklbl.Text = "The selected user never left any comment in any movie!";
            }
            else
            {
                commentsGrid.Visible = true;
            }
        }

        protected void updbt_Click(object sender, EventArgs e)
        {
            oklbl.ForeColor = Color.Green;
            commentsGrid.Visible = false;
            oklbl.Text = "Comment Updated Secsesfully!";
            Response.AddHeader("REFRESH", "1;URL=ModifyComments.aspx");
        }

        protected void cnbt_Click(object sender, EventArgs e)
        {
            commentsGrid.Visible = false;
            oklbl.ForeColor = Color.Red;
            oklbl.Text = "Updated Cenceled Secsesfully!";
            Response.AddHeader("REFRESH", "1;URL=ModifyComments.aspx");
        }

        protected void delbt_Click(object sender, EventArgs e)
        {
            oklbl.ForeColor = Color.Green;
            commentsGrid.Visible = false;
            oklbl.Text = "User Comment Deleted Secsesfully!";
            Response.AddHeader("REFRESH", "1;URL=ModifyComments.aspx");
        }
    }
}