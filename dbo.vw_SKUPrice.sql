CREATE VIEW vw_SKUPrice(ID, Code, Name, Price)
AS
SELECT SKU.ID, SKU.Code, SKU.Name, [dbo].[udf_GetSKUPrice](SKU.ID)
FROM SKU;