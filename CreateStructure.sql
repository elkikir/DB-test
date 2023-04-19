CREATE TABLE [dbo].[SKU]
(
	ID INT PRIMARY KEY IDENTITY(1,1) ,
	Code AS 's'+ID UNIQUE,
	Name VARCHAR(20)
);

CREATE TABLE [dbo].[Family]
(
	ID INT PRIMARY KEY IDENTITY(1,1) ,
	BudgetValue FLOAT,
	SurName NVARCHAR(20)
);

CREATE TABLE [dbo].[Basket]
(
	ID INT PRIMARY KEY IDENTITY(1,1) ,
	ID_SKU INT REFERENCES SKU (ID),
	ID_Family INT REFERENCES Family (ID),
	Quantity INT,
	Value FLOAT,
	PurchaseDate DATE DEFAULT(GETDATE()),
	DiscountValue FLOAT,
	CHECK(Quantity>0 AND Value>0)
);