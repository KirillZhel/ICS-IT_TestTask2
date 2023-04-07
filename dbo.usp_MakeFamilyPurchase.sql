CREATE OR ALTER PROCEDURE usp_MakeFamilyPurchase (@FamilySurName varchar(255))
AS
BEGIN
  UPDATE t1
      SET t1.budgetvalue = t1.budgetvalue - t2.sumValue
        FROM [dbo].[Family] AS t1
          INNER JOIN (SELECT id_family, SUM(value) as sumValue FROM [dbo].[Basket] GROUP BY id_family) AS t2
            ON t1.ID = t2.id_family
        WHERE t1.surname = @FamilySurName;
        
  DECLARE @count INT;
    SELECT @count = Count(*) FROM [dbo].[Family] WHERE [dbo].[Family].surname = @FamilySurName;
  IF @count = 0
      RAISERROR('Family %s does not exist in the database', 1, 1, @FamilySurName);
END;