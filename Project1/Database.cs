using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Configuration;

namespace Project1
{
    public static class Database
    {
        private static Boolean invalid;
        public static void CreateUser(String Username, String Password, String FirstName, String LastName, String Email, String AccountType)
        {
            SqlConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["CTFConnectionString"].ToString());
            SqlCommand command = new SqlCommand();
            command.CommandType = System.Data.CommandType.Text;

            command.CommandText = $"INSERT [dbo].[User] (User_UserName, User_Password, User_FirstName, User_LastName, User_Email, User_AccountType) VALUES ('{Username}','{Password}','{FirstName}','{LastName}','{Email}','{AccountType}')";
            command.Connection = db;

            db.Open();

            try
            {
                command.ExecuteNonQuery();
            }
            catch
            {
            }
            finally
            {
                db.Close();
            }
        }

        public static int getUserID(String Username)
        {
            int UserID = -1;
            SqlConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["CTFConnectionString"].ToString());
            SqlCommand command = new SqlCommand();
            command.CommandType = System.Data.CommandType.Text;

            command.CommandText = $"SELECT TOP 1 [User_ID] FROM [dbo].[User] WHERE [User_UserName] = '{Username}'";
            command.Connection = db;

            db.Open();

            try
            {
                using (SqlDataReader rdr = command.ExecuteReader())
                {
                    if (rdr.HasRows)
                    {
                        while (rdr.Read())
                        {
                            IDataRecord record = ((IDataRecord)rdr);
                            UserID = Convert.ToInt32(record[0]);
                        }
                    }
                }
            }
            catch
            {
            }
            finally
            {
                db.Close();
            }
            return UserID;
        }

        public static String GetUserType(String UserID)
        {
            String Type = null;
            SqlConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["CTFConnectionString"].ToString());
            SqlCommand command = new SqlCommand();
            command.CommandType = System.Data.CommandType.Text;

            command.CommandText = $"SELECT TOP 1 [User_AccountType] FROM [dbo].[User] WHERE [User_ID] = {UserID}";
            command.Connection = db;

            db.Open();

            try
            {
                using (SqlDataReader rdr = command.ExecuteReader())
                {
                    if (rdr.HasRows)
                    {
                        while (rdr.Read())
                        {
                            IDataRecord record = ((IDataRecord)rdr);
                            Type = record[0].ToString();
                        }
                    }
                }
            }
            catch
            {
            }
            finally
            {
                db.Close();
            }
            return Type;
        }

        public static bool SignIn(String Username, String Password)
        {
            Boolean validUser = false;

            SqlConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["CTFConnectionString"].ToString());
            SqlCommand command = new SqlCommand();
            command.CommandType = System.Data.CommandType.Text;

            command.CommandText = $"SELECT [User_Username],[User_Password] FROM [dbo].[User] WHERE [User_UserName] = '{Username}' AND [User_Password] = '{Password}'";
            command.Connection = db;

            db.Open();

            try
            {
                using (SqlDataReader rdr = command.ExecuteReader())
                {
                    if (rdr.HasRows)
                    {
                        validUser = true;
                    }
                }
            }
            catch
            {
            }
            finally
            {
                db.Close();
            }

            return validUser;
        }

        public static HttpCookie CreateUserSession(String Username)
        {
            HttpCookie cookie = new HttpCookie("UserSession");
            cookie["uid"] = getUserID(Username).ToString();
            cookie.Expires = DateTime.Now.AddDays(1);
            return cookie;
        }

        public static bool IsSessionValid(HttpCookie Session)
        {
            bool valid = false;
            if (Session != null)
            {
                valid = true;
            }
            return valid;
        }

        public static bool IsValidEmail(string strIn)
        {
            invalid = false;
            if (String.IsNullOrEmpty(strIn))
                return false;

            // Use IdnMapping class to convert Unicode domain names.
            strIn = Regex.Replace(strIn, @"(@)(.+)$", DomainMapper);
            if (invalid)
                return false;

            // Return true if strIn is in valid e-mail format.
            return Regex.IsMatch(strIn,
                   @"^(?("")(""[^""]+?""@)|(([0-9a-z]((\.(?!\.))|[-!#\$%&'\*\+/=\?\^`\{\}\|~\w])*)(?<=[0-9a-z])@))" +
                   @"(?(\[)(\[(\d{1,3}\.){3}\d{1,3}\])|(([0-9a-z][-\w]*[0-9a-z]*\.)+[a-z0-9]{2,17}))$",
                   RegexOptions.IgnoreCase);
        }

        private static string DomainMapper(Match match)
        {
            // IdnMapping class with default property values.
            IdnMapping idn = new IdnMapping();

            string domainName = match.Groups[2].Value;
            try
            {
                domainName = idn.GetAscii(domainName);
            }
            catch (ArgumentException)
            {
                invalid = true;
            }
            return match.Groups[1].Value + domainName;
        }

        //isValidFlag function checks the user entered flag
        //with the correct answer in the database
        public static bool isValidFlag(String flag)
        {
            Boolean validFlag = false;

            SqlConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["CTFConnectionString"].ToString());
            SqlCommand command = new SqlCommand();
            command.CommandType = System.Data.CommandType.Text;

            command.CommandText = $"SELECT [Challenge_Answer] FROM [dbo].[Challenge] WHERE [Challenge_Answer] = '{flag}'";
            command.Connection = db;

            db.Open();

            try
            {
                using (SqlDataReader rdr = command.ExecuteReader())
                {
                    if (rdr.HasRows)
                    {
                        validFlag = true;
                    }
                }
            }
            catch
            {
            }
            finally
            {
                db.Close();
            }

            return validFlag;
        }
    }
}