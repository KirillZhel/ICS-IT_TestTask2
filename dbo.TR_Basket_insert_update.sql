CREATE TRIGGER TR_Basket_insert_update
ON [dbo].[Basket] 
AFTER INSERT, UPDATE
AS
IF EXISTS(SELECT * FROM Inserted)
BEGIN
  UPDATE [dbo].[Basket] 
    SET [dbo].[Basket].discountvalue = [dbo].[Basket].value * 0.05
    WHERE [dbo].[Basket].id_sku IN (SELECT Inserted.id_sku FROM Inserted GROUP BY id_sku HAVING COUNT(*) >= 2);
  UPDATE [dbo].[Basket] 
    SET [dbo].[Basket].discountvalue = 0
    WHERE [dbo].[Basket].id_sku IN (SELECT Inserted.id_sku FROM Inserted GROUP BY id_sku HAVING COUNT(*) = 1);
END;
