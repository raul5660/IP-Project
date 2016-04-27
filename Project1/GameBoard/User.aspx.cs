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
            try
            {
                HttpCookie CookieSession = Request.Cookies.Get("UserSession");
                Session["UID"] = CookieSession.Value.ToString();
                ProfileFormView.ChangeMode(FormViewMode.Edit);
                if (Database.IsSessionValid(CookieSession))
                {
                    String type = Database.GetUserType(CookieSession.Value.ToString());
                    if (type == null)
                    {
                        Response.Redirect("../Default.aspx");
                    }
                    else if (type.ToLower() == "admin")
                    {
                        Response.Redirect("./Admin.aspx");
                    }
                }
                else
                {
                    Response.Redirect("../Default.aspx");
                }
            }
            catch
            {
                Response.Redirect("../Default.aspx");
            }
        }
    }
}