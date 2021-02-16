USE [sqlDB]
GO



CREATE TABLE [dbo].[backup_userTbl](
	[userID] [char](8) NOT NULL primary key,
	[username] [nvarchar](10) NOT NULL,
	[birthYear] [int] NOT NULL,
	[addr] [nchar](2) NOT NULL,
	[mobile1] [char](3) NULL,
	[mobile2] [char](8) NULL,
	[height] [smallint] NULL,
	[mDate] [date] NULL,
	modeType nchar(2), -- 변경된 타입
	modDate date, -- 변경된 날짜
	modUser nvarchar(256) -- 변경한 사용자
	
)
GO


