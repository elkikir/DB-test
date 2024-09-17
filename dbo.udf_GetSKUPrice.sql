CREATE FUNCTION dbo.udf_GetSKUPrice(@ID_SKU INT) 
    RETURNS DECIMAL(18,2)
	BEGIN
		DECLARE @ret DECIMAL(18,2);
        SELECT @ret = Value/Quantity
		FROM dbo.Basket where Basket.ID_SKU = @ID_SKU
        RETURN @ret
    END;