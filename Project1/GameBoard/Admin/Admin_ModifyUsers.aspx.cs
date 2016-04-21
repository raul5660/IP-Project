using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project1.GameBoard
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Users_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_ModifyUsers.aspx");
        }
        protected void Games_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Games.aspx");
        }
        protected void Categories_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Categories.aspx");
        }
        protected void Challenges_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Challenges.aspx");
        }
    }
}