using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Project1.GameBoard
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie Session = Request.Cookies.Get("UserSession");
            if (Database.IsSessionValid(Session))
            {
                String type = Database.GetUserType(Session["uid"]);
                if (type == null)
                {
                    Response.Redirect("../Default.aspx");
                }
                else if (type.ToLower() == "admin")
                {
                    Response.Redirect("../Admin.aspx");
                }
            }
        }

        protected void FlagSubmit_Click(object sender, EventArgs e)
        {
            //SqlConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["CTFConnectionString"].ToString());
            //SqlCommand command = new SqlCommand();
            //command.CommandType = System.Data.CommandType.Text;

            //command.CommandText = $"INSERT [dbo].[Challenge] (Challenge_Answer) VALUES ('{FlagInput.Text}')";
            //command.Connection = db;

            //db.Open();

            //try
            //{
            //    command.ExecuteNonQuery();
            //}
            //catch
            //{

            //}
            //finally
            //{
            //    db.Close();
            //}
        }
    }
}