CREATE TRIGGER TR_Basket_insert_update
ON [dbo].[Basket] 
AFTER INSERT, UPDATE
AS
BEGIN
  UPDATE [dbo].[Basket]
    SET [dbo].[Basket]TR_Basket_insert_update.discountvalue = IIF(mi.c >= 2, [dbo].[Basket].value * 0.05, 0)
    FROM (select inserted.id_sku as i, COUNT(inserted.id_sku) as c FROM inserted GROUP BY id_sku) as mi
    WHERE mi.i = dbo.[Basket].[id_sku]
END;
