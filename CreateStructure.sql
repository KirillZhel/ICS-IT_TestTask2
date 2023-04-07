CREATE TABLE SKU
(
    ID INT PRIMARY KEY IDENTITY,
    Code AS CONCAT('s', ID) UNIQUE,
    Name NVARCHAR(50) NOT NULL
);

CREATE TABLE Family
(
    ID INT PRIMARY KEY IDENTITY,
    SurName VARCHAR(255),
    BudgetValue DECIMAL(18, 2)
);

CREATE TABLE Basket
(
  ID INT IDENTITY,
  ID_SKU INT REFERENCES SKU (ID),
  ID_Family INT REFERENCES Family (ID),
  Quantity INT,
  Value DECIMAL(18, 2),
  PurchaseDate DATE DEFAULT GETDATE(),
  DiscountValue DECIMAL(18, 2),
  CHECK(Value >= 0 AND Quantity >= 0)
);