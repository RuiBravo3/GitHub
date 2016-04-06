using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MRDB
{
    public partial class Search : System.Web.UI.Page
    {
        bool isHe = true;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["Admins"].ToString() != null)
                {
                    isHe = false;
                 
                    Loginbt.Visible = false;
                    logout.Visible = true;
                 
                    registerBt.Visible = false;
                 
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
                  //  ifLogin.Text = "Welcome ," + Session["FirstName"].ToString() + "";
                    Loginbt.Visible = false;
                    logout.Visible = true;
                    registerBt.Visible = false;
                }
            }
            catch (NullReferenceException)
            {
            }
        }

        protected void Srcbt_Click(object sender, EventArgs e)
        {
            if (mvName.Text.ToString() != "")
            {
                srcbyNameGrid.DataBind();
                srchrsult.Text = "";
                if (srcbyNameGrid.Rows.Count == 0)
                {
                    srchrsult.Text = "The Movie you tried to look for is not in our database.";
                }
                else
                { 
                    srchrsult.Text = "Your Search Result:";
                    srcbyNameGrid.Visible = true;
                    Session["movieName"] = mvName.Text;
                }
            }
            else if( mvName.Text.ToString() == "" )
            {
                if (srcbyCategrid.Rows.Count == 0)
                {
                    srchrsult.Text = "The Category you reffer to is currectly empty.";
                }
                else
                {
                    srchrsult.Text = "Your Search Result:";
                    srcbyCategrid.Visible = true;
                }
                
            }
        }

    }
}