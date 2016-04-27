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
            cookie.Value = getUserID(Username).ToString();
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

        public static List<int> getGameIDs()
        {
            List<int> GameIDs = new List<int>();
            SqlConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["CTFConnectionString"].ToString());
            SqlCommand command = new SqlCommand();
            command.CommandType = System.Data.CommandType.Text;

            command.CommandText = $"SELECT [Game_ID] FROM [dbo].[Game]";
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
                            GameIDs.Add(Convert.ToInt32(record[0]));
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
            return GameIDs;
        }

        public static String getGameNameFromGameID(int GameID)
        {
            String GameName = null;
            SqlConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["CTFConnectionString"].ToString());
            SqlCommand command = new SqlCommand();
            command.CommandType = System.Data.CommandType.Text;

            command.CommandText = $"SELECT TOP 1 [Game_Name] FROM [dbo].[Game] WHERE [Game_ID] = {GameID}";
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
                            GameName = record[0].ToString();
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
            return GameName;
        }

        public static List<GameBoard.Category> getCategoriesFromGameID(int GameID)
        {
            List<GameBoard.Category> CategoriesList = new List<GameBoard.Category>();
            SqlConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["CTFConnectionString"].ToString());
            SqlCommand command = new SqlCommand();
            command.CommandType = System.Data.CommandType.Text;

            command.CommandText = $"SELECT [Category_ID],[Category_Name] FROM [dbo].[Category] WHERE [Game_ID] = {GameID}";
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
                            CategoriesList.Add(new GameBoard.Category(record[1].ToString(),Convert.ToInt32(record[0]), GameID));
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

            return CategoriesList;
        }

        public static List<GameBoard.Challenge> getChallengesFromGameIDAndCategoryID(int CategoryID)
        {
            List <GameBoard.Challenge> Challenges = new List<GameBoard.Challenge>();
            SqlConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["CTFConnectionString"].ToString());
            SqlCommand command = new SqlCommand();
            command.CommandType = System.Data.CommandType.Text;

            command.CommandText = $"SELECT [Challenge_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question] FROM[CTF].[dbo].[Challenge] WHERE[Category_ID] = {CategoryID} ORDER BY [Challenge_Points]";
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
                            Challenges.Add(new GameBoard.Challenge(
                                Convert.ToInt32(record[0]), //ID
                                record[1].ToString(),       //Name
                                Convert.ToInt32(record[2]), //Points
                                record[3].ToString(),       //Answer
                                record[4].ToString(),       //Solution
                                record[5].ToString()        //Question
                                ));
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

            return Challenges;
        }

        public static List<GameBoard.Challenge> getSolvedChallengesbyUserID(int UserID)
        {
            List<GameBoard.Challenge> Challenges = new List<GameBoard.Challenge>();
            SqlConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["CTFConnectionString"].ToString());
            SqlCommand command = new SqlCommand();
            command.CommandType = System.Data.CommandType.Text;

            command.CommandText = $"SELECT [Challenge].[Challenge_ID],[Challenge].[Challenge_Name],[Challenge].[Challenge_Points],[Challenge].[Challenge_Answer],[Challenge].[Challenge_Solution],[Challenge].[Challenge_Question] FROM [dbo].[Solved] INNER JOIN [dbo].[User] ON [dbo].[Solved].[User_ID] = [dbo].[User].[User_ID] INNER JOIN [dbo].[Challenge] ON [dbo].[Solved].[Challenge_ID] = [dbo].[Challenge].[Challenge_ID] WHERE ([dbo].[Solved].[User_ID] = {UserID})";
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
                            Challenges.Add(new GameBoard.Challenge(
                                Convert.ToInt32(record[0]), //ID
                                record[1].ToString(),       //Name
                                Convert.ToInt32(record[2]), //Points
                                record[3].ToString(),       //Answer
                                record[4].ToString(),       //Solution
                                record[5].ToString()        //Question
                                ));
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

            return Challenges;
        }

        public static GameBoard.User getUserByID(String UID)
        {
            GameBoard.User user = null;
            SqlConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["CTFConnectionString"].ToString());
            SqlCommand command = new SqlCommand();
            command.CommandType = System.Data.CommandType.Text;

            command.CommandText = $"SELECT [User_ID] ,[User_UserName] ,[User_FirstName] ,[User_LastName] ,[User_Email] ,[User_AccountType] FROM[CTF].[dbo].[User] WHERE[User_ID] = {UID}";
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
                            user = new GameBoard.User(
                                Convert.ToInt32(record[0]),
                                record[1].ToString(),
                                record[2].ToString(),
                                record[3].ToString(),
                                record[4].ToString(),
                                record[5].ToString());
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
            return user;
        }
    }
}