CREATE TABLE [dbo].[Challenge](
	[Challenge_ID] [int] IDENTITY(1,1) NOT NULL,
	[Category_ID] [int] NOT NULL,
	[Challenge_Name] [nvarchar](50) NOT NULL,
	[Challenge_Points] [int] NOT NULL,
	[Challenge_Answer] [nvarchar](50) NOT NULL,
	[Challenge_Solution] [nvarchar](max) NOT NULL,
	[Challenge_Question] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Challenge] PRIMARY KEY CLUSTERED 
(
	[Challenge_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Challenge]  WITH CHECK ADD  CONSTRAINT [FK_Challenge_Category] FOREIGN KEY([Category_ID])
REFERENCES [dbo].[Category] ([Category_ID])
GO

ALTER TABLE [dbo].[Challenge] CHECK CONSTRAINT [FK_Challenge_Category]