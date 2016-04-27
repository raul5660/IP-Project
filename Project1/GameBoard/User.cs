using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project1.GameBoard
{
    public class User
    {

        public User(int uID, String uName, String ufirstName, String ulastName, String uemail,  String uaccountType)
        {
            this.ID = uID;
            this.Username = uName;
            this.FirstName = ufirstName;
            this.LastName = ulastName;
            this.Email = uemail;
            this.Type = uaccountType;
            this.SolvedChallenges = Database.getSolvedChallengesbyUserID(uID);
        }

        public int ID { get; set; }
        public String Username { get; set; }
        public String FirstName { get; set; }
        public String LastName { get; set; }
        public String Email { get; set; }
        public String Type { get; set; }
        public List<Challenge> SolvedChallenges { get; set; }

    }
}