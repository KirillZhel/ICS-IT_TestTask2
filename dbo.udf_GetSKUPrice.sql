CREATE FUNCTION udf_GetSKUPrice(@ID_SKU INT)
RETURNS DECIMAL(18, 2)
BEGIN
  DECLARE @ret DECIMAL(18, 2);
    SELECT @ret = SUM(Value) / SUM(quantity)
    FROM Basket
    WHERE id_sku = @ID_SKU;
    RETURN @ret;
END;