USE TEST_TASK;
GO

CREATE TRIGGER TR_Basket_insert_update
ON dbo.Basket
AFTER INSERT
AS
	DECLARE @duplicate_fields TABLE(ID_SKU INT, COU INT)
	INSERT @duplicate_fields 
	SELECT ID_SKU, COUNT(*) AS COU 
	FROM inserted
	GROUP BY ID_SKU
	HAVING COUNT(*) > 1

	IF (SELECT COUNT(*) FROM @duplicate_fields)>0
BEGIN
   UPDATE dbo.Basket  
   SET DiscountValue = Value * 0.05
   WHERE ID_SKU IN (SELECT ID_SKU FROM @duplicate_fields)
END
	ELSE 
BEGIN
   UPDATE dbo.Basket  
   SET DiscountValue = 0
   WHERE ID_SKU IN (SELECT ID_SKU FROM @duplicate_fields)
END;