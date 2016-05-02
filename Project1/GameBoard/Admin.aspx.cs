using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project1.GameBoard
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Session["UID"] = Request.Cookies.Get("UserSession").Value.ToString();
                ProfileFormView.ChangeMode(FormViewMode.Edit);
                if (Database.IsSessionValid(Request.Cookies.Get("UserSession")))
                {
                    String type = Database.GetUserType(Session["UID"].ToString());
                    if (type == null)
                    {
                        Response.Redirect("../Default.aspx");
                    }
                    else if (type.ToLower() == "user")
                    {
                        Response.Redirect("./User.aspx");
                    }
                    else if (type.ToLower() != "admin")
                    {
                        Response.Redirect("../Default.aspx");
                    }
                }
            } catch
            {
                Response.Redirect("../Default.aspx");
            }
        }

        protected void InsertUserButton_Click(object sender, EventArgs e)
        {
            UserSqlDataSource.InsertParameters["User_UserName"].DefaultValue = ((TextBox)UserGridView.FooterRow.FindControl("InsertUserUserName")).Text;
            UserSqlDataSource.InsertParameters["User_Password"].DefaultValue = System.Web.Security.Membership.GeneratePassword(10, 2).ToString();
            UserSqlDataSource.InsertParameters["User_FirstName"].DefaultValue = ((TextBox)UserGridView.FooterRow.FindControl("InsertUserFirstName")).Text;
            UserSqlDataSource.InsertParameters["User_LastName"].DefaultValue = ((TextBox)UserGridView.FooterRow.FindControl("InsertUserLastName")).Text;
            UserSqlDataSource.InsertParameters["User_Email"].DefaultValue = ((TextBox)UserGridView.FooterRow.FindControl("InsertUserEmail")).Text;
            UserSqlDataSource.InsertParameters["User_AccountType"].DefaultValue = ((DropDownList)UserGridView.FooterRow.FindControl("InsertUserAccountType")).SelectedValue;
            UserSqlDataSource.Insert();
        }

        protected void InsertGameButton_Click(object sender, EventArgs e)
        {
            GamesSqlDataSource.InsertParameters["Game_Name"].DefaultValue = ((TextBox)GamesGridView.FooterRow.FindControl("InsertGameName")).Text;
            GamesSqlDataSource.Insert();
        }

        protected void InsertCategoryButton_Click(object sender, EventArgs e)
        {
            CategoriesSqlDataSource.InsertParameters["Game_ID"].DefaultValue = ((DropDownList)CategoriesGridView.FooterRow.FindControl("InsertGameID")).SelectedValue;
            CategoriesSqlDataSource.InsertParameters["Category_Name"].DefaultValue = ((TextBox)CategoriesGridView.FooterRow.FindControl("InsertCategoryName")).Text;
            CategoriesSqlDataSource.Insert();
        }

        protected void InsertChallenge_Click(object sender, EventArgs e)
        {
            ChallengeSqlDataSource.InsertParameters["Category_ID"].DefaultValue = ((DropDownList)ChallengesGridView.FooterRow.FindControl("InsertCategoryID")).SelectedValue; ;
            ChallengeSqlDataSource.InsertParameters["Challenge_Name"].DefaultValue = ((TextBox)ChallengesGridView.FooterRow.FindControl("InsertChallengeName")).Text;
            ChallengeSqlDataSource.InsertParameters["Challenge_Points"].DefaultValue = ((TextBox)ChallengesGridView.FooterRow.FindControl("InsertChallengePoints")).Text;
            ChallengeSqlDataSource.InsertParameters["Challenge_Answer"].DefaultValue = ((TextBox)ChallengesGridView.FooterRow.FindControl("InsertChallengeAnswer")).Text;
            ChallengeSqlDataSource.InsertParameters["Challenge_Solution"].DefaultValue = ((TextBox)ChallengesGridView.FooterRow.FindControl("InsertChallengeSolution")).Text;
            ChallengeSqlDataSource.InsertParameters["Challenge_Question"].DefaultValue = ((TextBox)ChallengesGridView.FooterRow.FindControl("InsertChallengeQuestion")).Text;
            ChallengeSqlDataSource.Insert();
        }

        [WebMethod]
        public static String GetTopTen()
        {
            return new JavaScriptSerializer().Serialize(Database.GetTopTenUsers());
        }
    }
}