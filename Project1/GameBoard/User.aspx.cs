using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project1.GameBoard
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private static System.Text.StringBuilder html;
        private static List<Game> GameList;
        public static User user;
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
                    user = Database.getUserByID(CookieSession.Value.ToString());
                    html = new System.Text.StringBuilder();
                    GameList = new List<Game>();
                    foreach (int GID in Database.getGameIDs())
                    {
                        GameList.Add(new Game(GID));
                        html.Append(GameList.Last().toHTML());
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
        [WebMethod]
        public static String LoadGameData()
        {
            return html.ToString();
        }

        [WebMethod]
        public static String SubmitFlag(String ChallengeID, String Flag)
        {
            foreach(Game game in GameList)
            {
                foreach(Category category in game.Categories)
                {
                    foreach(Challenge challenge in category.Challenges)
                    {
                        if (challenge.ID == Convert.ToInt32(ChallengeID))
                        {
                            if(challenge.Answer == Flag)
                            {
                                Database.ChallengeSolved(user.ID,challenge.ID);
                                return "true";
                            }
                        }
                    }
                }
            }
            return "false";
        }

    }
}