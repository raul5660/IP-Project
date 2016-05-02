using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

namespace Project1.GameBoard
{
    public partial class WebForm1 : System.Web.UI.Page
    {
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
                    GameList = new List<Game>();
                    foreach (int GID in Database.getGameIDs())
                    {
                        GameList.Add(new Game(GID));
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
        public static String LoadGameData(String GameID)
        {
            foreach(Game game in GameList)
            {
                if (game.ID.ToString() == GameID.Replace("#",""))
                {
                    return game.toHTML();
                }
            }
            return "";
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
        [WebMethod]
        public static String GetUsersProgress()
        {
            return new JavaScriptSerializer().Serialize(Database.getUserProgress(user.ID));
        }

        protected void SendEmail(object sender, EventArgs e)
        {
            string from = user.Email;
            string to = "internetprogrammingproject@gmail.com";
            string subject = txtSubject.Text;
            string body = txtBody.Text;

            if (body != "" && subject != "")
            {
                using (MailMessage mm = new MailMessage(from, to))
                {
                    mm.Subject = txtSubject.Text;
                    mm.Body = txtBody.Text;
                    if (fuAttachment.HasFile)
                    {
                        string FileName = System.IO.Path.GetFileName(fuAttachment.PostedFile.FileName);
                        mm.Attachments.Add(new Attachment(fuAttachment.PostedFile.InputStream, FileName));
                    }
                    mm.IsBodyHtml = false;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.EnableSsl = true;
                    NetworkCredential NetworkCred = new NetworkCredential(to, "Defense08$");
                    smtp.UseDefaultCredentials = true;
                    smtp.Credentials = NetworkCred;
                    smtp.Port = 587;
                    smtp.Send(mm);
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Email sent.');", true);
                }
            }
        }
    }
}