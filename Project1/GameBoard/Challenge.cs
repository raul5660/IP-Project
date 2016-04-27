using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project1.GameBoard
{
    //SELECT TOP 1000 [CID]
    //  ,[Category_ID]
    //  ,[CName]
    //  ,[CPoints]
    //  ,[CAnswer]
    //  ,[CSolution]
    //  ,[CQuestion]
    //FROM[CTF].[dbo].[Challenge]
    public class Challenge
    {
        int ChallengeID, ChallengePoints;
        String ChallengeName, ChallengeAnswer, ChallengeSolution, ChallengeQuestion;

        public Challenge(int CID, String CName, int CPoints, String CAnswer, String CSolution, String CQuestion)
        {
            this.ID = CID;
            this.Points = CPoints;
            this.Name = CName;
            this.Answer = CAnswer;
            this.Solution = CSolution;
            this.Question = CQuestion;
        }
        public int ID
        {
            get { return this.ChallengeID; }
            set { this.ChallengeID = value; }
        }

        public int Points
        {
            get { return this.ChallengePoints; }
            set { this.ChallengePoints = value; }
        }
        public String Name
        {
            get { return this.ChallengeName; }
            set { this.ChallengeName = value; }
        }
        public String Answer
        {
            get { return this.ChallengeAnswer; }
            set { this.ChallengeAnswer = value; }
        }
        public String Solution
        {
            get { return this.ChallengeSolution; }
            set { this.ChallengeSolution = value; }
        }
        public String Question
        {
            get { return this.ChallengeQuestion; }
            set { this.ChallengeQuestion = value; }
        }
    }
}