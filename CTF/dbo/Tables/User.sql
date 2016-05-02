CREATE TABLE [dbo].[User](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_UserName] [nvarchar](50) NOT NULL,
	[User_Password] [nvarchar](50) NOT NULL,
	[User_FirstName] [nvarchar](50) NOT NULL,
	[User_LastName] [nvarchar](50) NOT NULL,
	[User_Email] [nvarchar](50) NOT NULL,
	[User_AccountType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]