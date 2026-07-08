-- Function 1 --
DELIMITER $$
CREATE FUNCTION GetTotalCustomerSpend(p_CustomerID INT) 
RETURNS DECIMAL(19,2)
DETERMINISTIC
BEGIN
    DECLARE v_TotalSpend DECIMAL(19,2);
    
    SELECT SUM(op.Quantity * vp.Price) INTO v_TotalSpend
    FROM Orders o
    JOIN OrderedProduct op ON o.OrderID = op.OrderID
    JOIN VendorProduct vp ON op.VendorProductID = vp.VendorProductID
    WHERE o.CustomerID = p_CustomerID;
    
    RETURN IFNULL(v_TotalSpend, 0.00);
END$$

DELIMITER ;

-- Function 2 --
DELIMITER $$

CREATE FUNCTION GetAverageProductRating(p_VendorProductID INT) 
RETURNS DECIMAL(3,2)
DETERMINISTIC
BEGIN
    DECLARE v_AvgRating DECIMAL(3,2);
    
    SELECT AVG(r.Rating) INTO v_AvgRating
    FROM Review r
    JOIN OrderedProduct op ON r.OrderedProductID = op.OrderedProductID
    WHERE op.VendorProductID = p_VendorProductID;
    
    RETURN IFNULL(v_AvgRating, 0.00);
END$$

DELIMITER ;

-- Function 3 --
DELIMITER $$

CREATE FUNCTION GetTotalItemsInCart(p_CustomerID INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_ItemCount INT;
    
    SELECT SUM(cp.Quantity) INTO v_ItemCount
    FROM Cart c
    JOIN CartProduct cp ON c.CartID = cp.CartID
    WHERE c.CustomerID = p_CustomerID;
    
    RETURN IFNULL(v_ItemCount, 0);
END$$

DELIMITER ;

-- Function 4 --
DELIMITER $$

CREATE FUNCTION CalculateTotalOrderValue(p_OrderID INT) 
RETURNS DECIMAL(19,2)
DETERMINISTIC
BEGIN
    DECLARE v_TotalValue DECIMAL(19,2);
    
    SELECT SUM(op.Quantity * vp.Price) INTO v_TotalValue
    FROM OrderedProduct op
    JOIN VendorProduct vp ON op.VendorProductID = vp.VendorProductID
    WHERE op.OrderID = p_OrderID;
    
    RETURN IFNULL(v_TotalValue, 0.00);
END$$

DELIMITER ;
-- Function 5 --
DELIMITER $$

CREATE FUNCTION GetCustomerAge(p_CustomerID INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_Age INT;
    
    SELECT TIMESTAMPDIFF(YEAR, DOB, CURDATE()) INTO v_Age
    FROM Customer
    WHERE CustomerID = p_CustomerID;
    
    RETURN v_Age;
END$$

DELIMITER ;






