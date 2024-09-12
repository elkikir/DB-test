USE TEST_TASK;
GO

CREATE PROCEDURE MakeFamilyPurchase
    @FamilySurName varchar(255)
AS
IF EXISTS(SELECT * FROM Family WHERE Family.SurName = @FamilySurName)
BEGIN
UPDATE Family
SET Family.BudgetValue -= Basket.Value
FROM Basket
WHERE Family.ID = Basket.ID_Family
END
ELSE THROW 50404, 'There is no family by the specified surname', 1;