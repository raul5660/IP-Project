using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project1.GameBoard
{
    public partial class Site2 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            Response.Cookies.Get("UserSession").Expires = DateTime.Now;
            Response.Redirect("../Default.aspx");
        }
    }
}