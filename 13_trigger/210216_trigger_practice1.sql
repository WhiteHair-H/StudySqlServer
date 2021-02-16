USE [sqlDB]
GO

UPDATE [dbo].[userTbl]
   SET [username] = 'Á¶°ü¿ì'
 WHERE [userID] = 'JKW';
GO


delete from userTbl
 where userID = 'JKW'

