using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project1.GameBoard
{
    public class Category
    {
        private List<Challenge> ChallengesList = new List<Challenge>();
        private String CategoryName;
        private int CategoryID;

        public Category(String catName, int catID, int gameID)
        {
            this.Name = catName;
            this.ID = catID;
            this.ChallengesList = Database.getChallengesFromGameIDAndCategoryID(catID);
        }

        public String Name
        {
            get { return this.CategoryName; }
            set { this.CategoryName = value; }
        }

        public int ID
        {
            get { return this.CategoryID; }
            set { this.CategoryID = value; }
        }

        public List<Challenge> Challenges
        {
            get { return this.ChallengesList; }
            set { this.ChallengesList = value; }
        }
    }
}