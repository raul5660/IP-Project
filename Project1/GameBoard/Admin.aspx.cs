using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
                if (!Database.IsSessionValid(Request.Cookies.Get("UserSession")))
                {
                    Response.Redirect("../Default.aspx");
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
            UserSqlDataSource.InsertParameters["User_AccountType"].DefaultValue = ((DropDownList)UserGridView.FooterRow.FindControl("InsertUserType")).SelectedValue;
            UserSqlDataSource.Insert();
        }
    }
}