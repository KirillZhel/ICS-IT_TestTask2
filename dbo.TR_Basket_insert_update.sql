CREATE TRIGGER TR_Basket_insert_update
ON [dbo].[Basket] 
AFTER INSERT, UPDATE
AS
BEGIN
	UPDATE [dbo].[Basket]
	SET [dbo].[Basket].discountvalue = IIF(mi.c >= 2, [dbo].[Basket].value * 0.05, 0)
		FROM (
			SELECT
				inserted.id_sku AS i,
				COUNT(inserted.id_sku) AS c 
			FROM inserted 
			GROUP BY id_sku) AS mi
	WHERE mi.i = dbo.[Basket].[id_sku]
END;
