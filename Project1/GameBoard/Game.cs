using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project1.GameBoard
{
    public class Game
    {
        private List<Category> CategoriesList = new List<Category>();
        private String GameName;
        private int GameID;
        public Game(int GameId)
        {
            string gName = Database.getGameNameFromGameID(GameId);
            if (gName != null)
            {
                this.ID = GameId;
                this.Name = gName;
                this.Categories = Database.getCategoriesFromGameID(GameId);
            }
        }

        public int ID
        {
            get { return this.GameID; }
            set { this.GameID = value; }
        }

        public String Name
        {
            get { return this.GameName; }
            set { this.GameName = value; }
        }

        public List<Category> Categories
        {
            get { return this.CategoriesList; }
            set { this.CategoriesList = value; }
        }

        public String toHTML()
        {
            System.Text.StringBuilder html = new System.Text.StringBuilder();
            html.Append($"<div id=\"{this.ID}\" style=\"display: none;\" >");
            html.Append($"<h1 class=\"page-header\">{this.Name}</h1>");
            html.Append("<table class=\"table table-bordered tab-group\">");

            //Table Headings
            html.Append("<tr>");
            foreach(Category category in this.Categories)
            {
                html.Append($"<th style=\"text-align: center;\">{System.Threading.Thread.CurrentThread.CurrentCulture.TextInfo.ToTitleCase(category.Name.ToLower())}</th>");
            }
            html.Append("</tr>");

            int ChallengeMax = 0;
            foreach(Category category in this.Categories)
            {
                if (category.Challenges.Count > ChallengeMax)
                {
                    ChallengeMax = category.Challenges.Count;
                }
            }

            //Add Challenges
            for(int i = 0; i < ChallengeMax; i++)
            {
                html.Append("<tr>");
                foreach (Category category in this.Categories)
                {
                    try
                    {
                        html.Append($"<td align=\"center\" class=\"tab\"><a href=\"#{RemoveSpecialCharacters(category.Challenges[i].Name)}\">{category.Challenges[i].Points}</a></td>");
                    }
                    catch { }
                }
                html.Append("</tr>");
            }
            html.Append("</table>");
            html.Append("</div>");

            //Create Challenges Views
            foreach (Category category in this.Categories)
            {
                foreach(Challenge challenge in category.Challenges)
                {
                    html.Append($"<div id=\"{RemoveSpecialCharacters(challenge.Name)}\" style=\"display: none;\" >");
                    html.Append($"<h1 class=\"page-header\">{challenge.Name}</h1>");
                    html.Append($"<p>{challenge.Question}</p>");
                    html.Append($"<div class=\"form-inline\"><div class=\"form-group\"><label class=\"sr-only\" for=\"FlagSubmission\">Flag</label><input type=\"text\" class=\"form-control\" id=\"FlagSubmission\" placeholder=\"Flag\"></div><button type=\"button\" class=\"btn btn-default\">Submit</button><button type=\"button\" class=\"btn btn-info\" data-toggle=\"collapse\" data-target=\"#{RemoveSpecialCharacters(challenge.Name)}Solution\">Need Help?</button></div>");
                    html.Append($"<div id=\"{RemoveSpecialCharacters(challenge.Name)}Solution\" class=\"collapse\"><h2>Solution</h1>{challenge.Solution}</div>");
                    html.Append("</div>");
                }
            }
            return html.ToString();
        }

        public static string RemoveSpecialCharacters(string str)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            foreach (char c in str)
            {
                if ((c >= '0' && c <= '9') || (c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z'))
                {
                    sb.Append(c);
                }
            }
            return sb.ToString();
        }
    }
}