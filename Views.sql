-- View 1 --
CREATE OR REPLACE VIEW vw_ActiveInventoryDashboard AS
SELECT 
    vp.VendorProductID,
    p.ProductName,
    cat.CategoryName,
    v.Name AS VendorName,
    vp.Price AS UnitPrice,
    vp.Quantity AS StockAvailable,
    CASE 
        WHEN vp.Quantity = 0 THEN 'Out of Stock'
        WHEN vp.Quantity <= 10 THEN 'Low Stock Warning'
        ELSE 'In Stock'
    END AS InventoryStatus
FROM VendorProduct vp
JOIN Product p ON vp.ProductID = p.ProductID
JOIN Category cat ON p.CategoryID = cat.CategoryID
JOIN Vendor v ON vp.VendorID = v.VendorID;

-- View 2 --

CREATE OR REPLACE VIEW vw_VendorPerformanceMetrics AS
SELECT 
    v.VendorID,
    v.Name AS VendorName,
    v.Email AS VendorEmail,
    COUNT(DISTINCT op.OrderID) AS TotalOrdersFulfilled,
    SUM(op.Quantity) AS TotalUnitsSold,
    SUM(op.Quantity * vp.Price) AS GrossRevenueGenerated,
    ROUND(AVG(r.Rating), 2) AS AverageMerchantRating
FROM Vendor v
JOIN VendorProduct vp ON v.VendorID = vp.VendorID
JOIN OrderedProduct op ON vp.VendorProductID = op.VendorProductID
LEFT JOIN Review r ON op.OrderedProductID = r.OrderedProductID
GROUP BY v.VendorID, v.Name, v.Email;

-- View 3 --

CREATE OR REPLACE VIEW vw_CustomerOrderInvoices AS
SELECT 
    o.OrderID,
    o.OrderDate,
    c.CustomerID,
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    c.Email AS CustomerEmail,
    p.ProductName,
    op.Quantity AS UnitsOrdered,
    vp.Price AS PricePerUnit,
    (op.Quantity * vp.Price) AS ItemSubtotal,
    o.TrackingID,
    cour.Name AS CourierPartner
FROM Orders o
JOIN Customer c ON o.CustomerID = c.CustomerID
JOIN OrderedProduct op ON o.OrderID = op.OrderID
JOIN VendorProduct vp ON op.VendorProductID = vp.VendorProductID
JOIN Product p ON vp.ProductID = p.ProductID
JOIN VendorCourier vc ON o.VendorCourierID = vc.VendorCourierID
JOIN Courier cour ON vc.CourierID = cour.CourierID;

-- View 4 --

CREATE OR REPLACE VIEW vw_ActiveCustomerShoppingBaskets AS
SELECT 
    c.CustomerID,
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    cart.CartID,
    cart.DateCreated AS CartAgeDate,
    p.ProductName,
    v.Name AS VendorName,
    cp.Quantity AS UnitsInCart,
    vp.Price AS CurrentUnitPrice,
    (cp.Quantity * vp.Price) AS EstimatedBasketTotal
FROM Cart cart
JOIN Customer c ON cart.CustomerID = c.CustomerID
JOIN CartProduct cp ON cart.CartID = cp.CartID
JOIN VendorProduct vp ON cp.VendorProductID = vp.VendorProductID
JOIN Product p ON vp.ProductID = p.ProductID
JOIN Vendor v ON vp.VendorID = v.VendorID;

-- View 5 --

CREATE OR REPLACE VIEW vw_ProductReviewSummary AS
SELECT 
    p.ProductID,
    p.ProductName,
    cat.CategoryName,
    COUNT(r.ReviewID) AS GlobalReviewCount,
    ROUND(AVG(r.Rating), 1) AS AverageRatingScore
FROM Product p
JOIN Category cat ON p.CategoryID = cat.CategoryID
JOIN VendorProduct vp ON p.ProductID = vp.ProductID
JOIN OrderedProduct op ON vp.VendorProductID = op.VendorProductID
JOIN Review r ON op.OrderedProductID = r.OrderedProductID
GROUP BY p.ProductID, p.ProductName, cat.CategoryName;
