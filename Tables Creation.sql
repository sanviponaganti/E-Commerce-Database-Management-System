CREATE DATABASE IF NOT EXISTS OnlineShopping;
USE OnlineShopping;

-- 1. Customer Table--

CREATE TABLE Customer
(
	CustomerID int auto_increment PRIMARY KEY,
	FirstName varchar(255) NOT NULL,
	LastName varchar(255) NOT NULL,
	DOB date NOT NULL,
	Email varchar(255) NOT NULL UNIQUE,
	Password varchar(255) NOT NULL,
	Contact varchar(255) NOT NULL
);

-- 2. Country Table --

CREATE TABLE Country
(
	CountryID int auto_increment PRIMARY KEY,
	CountryName varchar(255) NOT NULL
);

-- 3. Province Table --

CREATE TABLE Province
(
	ProvinceID int auto_increment PRIMARY KEY,
	ProvinceName varchar(255) NOT NULL
);

-- 4. City Table --

CREATE TABLE City
(
	CityID int auto_increment PRIMARY KEY,
	CityName varchar(255) NOT NULL
);

-- 5. ZipCode Table --

CREATE TABLE ZipCode
(
	ZipCodeID int auto_increment PRIMARY KEY,
	CityID int NOT NULL,
	ProvinceID int NOT NULL,
	CountryID int NOT NULL,
	FOREIGN KEY (CityID) REFERENCES City(CityID),
	FOREIGN KEY (ProvinceID) REFERENCES Province(ProvinceID),
	FOREIGN KEY (CountryID) REFERENCES Country(CountryID)
);

-- 6. Address Table --

CREATE TABLE Address
(
	AddressID int auto_increment PRIMARY KEY,
	HouseNo varchar(255) NOT NULL,
	Street varchar(255) NOT NULL, -- Changed from INT to VARCHAR
	CustomerID int NOT NULL,
	ZipCodeID int NOT NULL,
	Area varchar(255) NOT NULL,
	FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
	FOREIGN KEY (ZipCodeID) REFERENCES ZipCode(ZipCodeID)
);

-- 7. Category Table --

CREATE TABLE Category
(
	CategoryID int auto_increment PRIMARY KEY,
	CategoryName varchar(255) NOT NULL
);

-- 8. Vendor Table --

CREATE TABLE Vendor
(
	VendorID int auto_increment PRIMARY KEY,
	Name varchar(255) NOT NULL,
	Address text NOT NULL,
	Email varchar(255) NOT NULL UNIQUE,
	Password varchar(255) NOT NULL,
	Contact varchar(255) NOT NULL
);

-- 9. Product Table --

CREATE TABLE Product
(
	ProductID int auto_increment PRIMARY KEY, -- Changed from IDENTITY to auto_increment
	ProductName varchar(255) NOT NULL,
	CategoryID int NOT NULL,
	FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

-- 10. VendorProduct Table --

CREATE TABLE VendorProduct
(
	VendorProductID int auto_increment PRIMARY KEY,
	VendorID int NOT NULL,
	ProductID int NOT NULL,
	Price decimal(19, 2) NOT NULL,
	Quantity int NOT NULL,
	Description text NOT NULL,
	FOREIGN KEY (VendorID) REFERENCES Vendor(VendorID),
	FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- 11. Courier Table --

CREATE TABLE Courier
(
	CourierID int auto_increment PRIMARY KEY,
	Name varchar(255) NOT NULL,
	Contact varchar(255) NOT NULL
);

-- 12. VendorCourier Table --

CREATE TABLE VendorCourier
(
	VendorCourierID int auto_increment PRIMARY KEY,
	VendorID int NOT NULL,
	CourierID int NOT NULL,
	FOREIGN KEY (VendorID) REFERENCES Vendor(VendorID),
	FOREIGN KEY (CourierID) REFERENCES Courier(CourierID)
);

-- 13. Orders Table --

CREATE TABLE Orders
(
	OrderID int auto_increment PRIMARY KEY,
	CustomerID int NOT NULL,
	OrderDate date NOT NULL,
	AddressID int NOT NULL,
	VendorCourierID int NOT NULL,
	TrackingID varchar(255) NOT NULL,
	FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
	FOREIGN KEY (AddressID) REFERENCES Address(AddressID),
	FOREIGN KEY (VendorCourierID) REFERENCES VendorCourier(VendorCourierID)
);

-- 14. OrderedProduct Table --

CREATE TABLE OrderedProduct
(
	OrderedProductID int auto_increment PRIMARY KEY,
	VendorProductID int NOT NULL,
	OrderID int NOT NULL,
	Quantity int NOT NULL,
	FOREIGN KEY (VendorProductID) REFERENCES VendorProduct(VendorProductID),
	FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- 15. Review Table --

CREATE TABLE Review
(
	ReviewID int auto_increment PRIMARY KEY,
	Rating tinyint NOT NULL,
	Comment text,
	CustomerID int NOT NULL,
	OrderedProductID int NOT NULL,
	FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
	FOREIGN KEY (OrderedProductID) REFERENCES OrderedProduct(OrderedProductID)
);

-- 16. Cart Table --

CREATE TABLE Cart
(
	CartID int auto_increment PRIMARY KEY,
	DateCreated date NOT NULL,
	CustomerID int NOT NULL,
	FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- 2. CartProduct Table --

CREATE TABLE CartProduct
(
	CartProductID int auto_increment PRIMARY KEY,
	VendorProductID int NOT NULL,
	Quantity int NOT NULL,
	CartID int NOT NULL,
	FOREIGN KEY (VendorProductID) REFERENCES VendorProduct(VendorProductID),
	FOREIGN KEY (CartID) REFERENCES Cart(CartID)
);






