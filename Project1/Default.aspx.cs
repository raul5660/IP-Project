using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project1
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                HttpCookie CookieSession = Request.Cookies.Get("UserSession");
                Session["UID"] = CookieSession.Value.ToString();
                if (Database.IsSessionValid(CookieSession))
                {
                    String type = Database.GetUserType(CookieSession.Value.ToString());
                    if (type == "user")
                    {
                        Response.Redirect("./GameBoard/User.aspx");
                    }
                    else if (type.ToLower() == "admin")
                    {
                        Response.Redirect("./GameBoard/Admin.aspx");
                    }
                }
            }
            catch
            {
            }
        }

        protected void ButtonSignUp_Click(object sender, EventArgs e)
        {
            if (Database.IsValidEmail(EmailSignUp.Text) &&
             ConfirmPasswordSignUp.Text == PasswordSignUp.Text)
            {
                Database.CreateUser(
                    UserNameSignUp.Text,
                    PasswordSignUp.Text,
                    FirstNameSignup.Text,
                    LastNameSignUp.Text,
                    EmailSignUp.Text,
                    "user");

                // will redirect to appropriate page.
                Response.Redirect(@"GameBoard\User.aspx");
            }
        }

        protected void SignIn_Click(object sender, EventArgs e)
        {
            // Get username and password from navbar sign-in
            String Username = UsernameSignIn.Text;
            String Password = PasswordSignIn.Text;

            // Logs user in if creds are correct
            if (Database.SignIn(Username, Password))
            {
                //creates session in database
                HttpCookie cookie = Database.CreateUserSession(Username);
                // add cookie
                Response.Cookies.Add(cookie);
                // will redirect to appropriate page.
                String type = Database.GetUserType(cookie.Value.ToString());
                if (type == "user")
                {
                    Response.Redirect("./GameBoard/User.aspx");
                }
                else if (type.ToLower() == "admin")
                {
                    Response.Redirect("./GameBoard/Admin.aspx");
                }
            }
        }
    }
}