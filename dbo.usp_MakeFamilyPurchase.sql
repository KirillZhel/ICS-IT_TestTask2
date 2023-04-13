CREATE OR ALTER PROCEDURE usp_MakeFamilyPurchase (@FamilySurName varchar(255))
AS
BEGIN
	WITH sf AS (SELECT id_family, SUM(value) AS sumValue FROM [dbo].[Basket] GROUP BY id_family)
  	UPDATE t1
      SET t1.budgetvalue = t1.budgetvalue - sf.sumValue
       	FROM [dbo].[Family] AS t1
         	INNER JOIN sf ON t1.ID = sf.id_family
        WHERE t1.surname = @FamilySurName;

  IF(NOT EXISTS(SELECT 1 FROM [dbo].[Family] WHERE [dbo].[Family].surname = @FamilySurName))
      RAISERROR('Family %s does not exist in the database', 1, 1, @FamilySurName);
END;
