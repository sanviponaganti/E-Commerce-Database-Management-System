-- Query 1 --
SELECT 
    o.OrderID,
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    p.ProductName,
    op.Quantity,
    (op.Quantity * vp.Price) AS TotalCost
FROM Orders o
INNER JOIN Customer c ON o.CustomerID = c.CustomerID
INNER JOIN OrderedProduct op ON o.OrderID = op.OrderID
INNER JOIN VendorProduct vp ON op.VendorProductID = vp.VendorProductID
INNER JOIN Product p ON vp.ProductID = p.ProductID;

-- Query 2 --
SELECT 
    p.ProductID,
    p.ProductName,
    IFNULL(SUM(op.Quantity), 0) AS TotalUnitsSold
FROM Product p
LEFT JOIN VendorProduct vp ON p.ProductID = vp.ProductID
LEFT JOIN OrderedProduct op ON vp.VendorProductID = op.VendorProductID
GROUP BY p.ProductID, p.ProductName;

-- Query 3 --
SELECT 
    cour.Name AS CourierName,
    o.OrderID,
    o.TrackingID
FROM Orders o
RIGHT JOIN VendorCourier vc ON o.VendorCourierID = vc.VendorCourierID
RIGHT JOIN Courier cour ON vc.CourierID = cour.CourierID;

-- Query 4 --
SELECT 
    COUNT(OrderID) AS TotalOrdersProcessed,
    SUM(Quantity) AS TotalUnitsMoved,
    AVG(Quantity) AS AverageItemsPerInvoice,
    MAX(Quantity) AS SingleLargestBulkPurchase,
    MIN(Quantity) AS MinimumPurchaseThreshold
FROM OrderedProduct;

-- Query 5 --
SELECT 
    cat.CategoryName,
    COUNT(vp.VendorProductID) AS UniqueListings,
    ROUND(AVG(vp.Price), 2) AS AverageCategoryPrice
FROM Category cat
JOIN Product p ON cat.CategoryID = p.CategoryID
JOIN VendorProduct vp ON p.ProductID = vp.ProductID
GROUP BY cat.CategoryID, cat.CategoryName
HAVING AverageCategoryPrice > 2000.00;

-- Query 6 --
SELECT 
    c.CustomerID,
    CONCAT(c.FirstName, ' ', c.LastName) AS EliteCustomer,
    SUM(op.Quantity * vp.Price) AS TotalLifetimeSpend
FROM Customer c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderedProduct op ON o.OrderID = op.OrderID
JOIN VendorProduct vp ON op.VendorProductID = vp.VendorProductID
GROUP BY c.CustomerID, c.FirstName, c.LastName
HAVING TotalLifetimeSpend > (
    SELECT AVG(SubTotal) 
    FROM (
        SELECT SUM(op2.Quantity * vp2.Price) AS SubTotal 
        FROM Orders o2
        JOIN OrderedProduct op2 ON o2.OrderID = op2.OrderID
        JOIN VendorProduct vp2 ON op2.VendorProductID = vp2.VendorProductID
        GROUP BY o2.CustomerID
    ) AS PlatformsAverageSalesValues
);

-- Query 7 --
SELECT a.AddressID, c.FirstName, c.LastName, a.HouseNo, a.Area, city.CityName 
FROM Address a
JOIN Customer c ON a.CustomerID = c.CustomerID
JOIN ZipCode z ON a.ZipCodeID = z.ZipCodeID
JOIN City city ON z.CityID = city.CityID;

-- Query 8 --
SELECT v.VendorID, v.Name AS VendorName, SUM(op.Quantity * vp.Price) AS TotalRevenue
FROM Vendor v
JOIN VendorProduct vp ON v.VendorID = vp.VendorID
JOIN OrderedProduct op ON vp.VendorProductID = op.VendorProductID
GROUP BY v.VendorID, v.Name
ORDER BY TotalRevenue DESC;

-- Query 9 --
SELECT 
    c.CustomerID,
    z.CountryID,
    SUM(op.Quantity * vp.Price) AS LifetimeSpend,
    DENSE_RANK() OVER (PARTITION BY z.CountryID ORDER BY SUM(op.Quantity * vp.Price) DESC) AS RegionalRank
FROM Customer c
JOIN Address a ON c.CustomerID = a.CustomerID
JOIN ZipCode z ON a.ZipCodeID = z.ZipCodeID
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderedProduct op ON o.OrderID = op.OrderID
JOIN VendorProduct vp ON op.VendorProductID = vp.VendorProductID
GROUP BY c.CustomerID, z.CountryID;

-- Query 10 --
SELECT CategoryID, ROUND(AVG(Price), 2) AS AveragePrice
FROM VendorProduct vp
JOIN Product p ON vp.ProductID = p.ProductID
GROUP BY CategoryID;

-- Query 11 --
SELECT 
    c.Name AS CourierName,
    COUNT(o.OrderID) AS TotalShipmentsHandled,
    ROUND(AVG(DATEDIFF(CURDATE(), o.OrderDate)), 1) AS AverageTransitDaysToDate
FROM Orders o
JOIN VendorCourier vc ON o.VendorCourierID = vc.VendorCourierID
JOIN Courier c ON vc.CourierID = c.CourierID
GROUP BY c.CourierID, c.Name;

-- Query 12 --
SELECT 
    op.Quantity AS UnitsPurchasedInSingleOrder,
    COUNT(r.ReviewID) AS TotalReviewsSubmitted,
    ROUND(AVG(r.Rating), 2) AS AverageGivenRating
FROM Review r
JOIN OrderedProduct op ON r.OrderedProductID = op.OrderedProductID
GROUP BY op.Quantity
ORDER BY UnitsPurchasedInSingleOrder DESC;

-- Query 13 --
SELECT Distinct city.CityName, prov.ProvinceName 
FROM City city
JOIN ZipCode z ON city.CityID = z.CityID
JOIN Province prov ON z.ProvinceID = prov.ProvinceID
WHERE z.ZipCodeID NOT IN (
    SELECT DISTINCT Address.ZipCodeID 
    FROM Orders 
    JOIN Address ON Orders.AddressID = Address.AddressID
);

-- Query 14 --
SELECT 
    COUNT(OrderID) AS OrdersPlacedToday 
FROM Orders 
WHERE OrderDate = CURDATE();

-- Query 15 --
SELECT v.VendorID, v.Name AS VendorName, SUM(op.Quantity * vp.Price) AS TotalRevenue
FROM Vendor v
JOIN VendorProduct vp ON v.VendorID = vp.VendorID
JOIN OrderedProduct op ON vp.VendorProductID = op.VendorProductID
GROUP BY v.VendorID, v.Name
ORDER BY TotalRevenue DESC;





