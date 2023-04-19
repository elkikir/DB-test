CREATE VIEW SKU_Price AS
SELECT  SKU.ID AS ID,
		SKU.Code AS Code, 
		SKU.Name AS Name,
		dbo.udf_GetSKUPrice(SKU.ID) AS VALUE
FROM SKU