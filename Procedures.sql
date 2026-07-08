-- Procedure 1 --
DELIMITER $$
CREATE PROCEDURE PlaceCustomerOrder(
    IN p_CustomerID INT,
    IN p_AddressID INT,
    IN p_VendorCourierID INT,
    IN p_TrackingID VARCHAR(255),
    IN p_VendorProductID INT,
    IN p_Quantity INT
)
BEGIN
    DECLARE v_AvailableStock INT;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Order placement failed. Transaction rolled back.';
    END;

    START TRANSACTION;

    SELECT Quantity INTO v_AvailableStock 
    FROM VendorProduct 
    WHERE VendorProductID = p_VendorProductID;

    IF v_AvailableStock < p_Quantity THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient product stock in inventory.';
    ELSE
        UPDATE VendorProduct 
        SET Quantity = Quantity - p_Quantity 
        WHERE VendorProductID = p_VendorProductID;

        INSERT INTO Orders (CustomerID, OrderDate, AddressID, VendorCourierID, TrackingID)
        VALUES (p_CustomerID, CURDATE(), p_AddressID, p_VendorCourierID, p_TrackingID);
        
        
        SET @NewOrderID = LAST_INSERT_ID();

        INSERT INTO OrderedProduct (VendorProductID, OrderID, Quantity)
        VALUES (p_VendorProductID, @NewOrderID, p_Quantity);

        COMMIT;
    END IF;
END$$

DELIMITER ;

-- Procedure 2 --

DELIMITER $$

CREATE PROCEDURE RestockProduct(
    IN p_VendorProductID INT,
    IN p_AddedQuantity INT
)
BEGIN
    UPDATE VendorProduct
    SET Quantity = Quantity + p_AddedQuantity
    WHERE VendorProductID = p_VendorProductID;
    
    SELECT 'Inventory restock updated successfully.' AS Status;
END$$

DELIMITER ;

-- Procedure 3 --
DELIMITER $$

CREATE PROCEDURE AddProductToCart(
    IN p_CustomerID INT,
    IN p_VendorProductID INT,
    IN p_Quantity INT
)
BEGIN
    DECLARE v_CartID INT;
    DECLARE v_ExistingQuantity INT;

    SELECT CartID INTO v_CartID 
    FROM Cart 
    WHERE CustomerID = p_CustomerID 
    LIMIT 1;

    IF v_CartID IS NULL THEN
        INSERT INTO Cart (DateCreated, CustomerID) 
        VALUES (CURDATE(), p_CustomerID);
        SET v_CartID = LAST_INSERT_ID();
    END IF;

    SELECT Quantity INTO v_ExistingQuantity 
    FROM CartProduct 
    WHERE CartID = v_CartID AND VendorProductID = p_VendorProductID;

    IF v_ExistingQuantity IS NOT NULL THEN
        UPDATE CartProduct 
        SET Quantity = Quantity + p_Quantity 
        WHERE CartID = v_CartID AND VendorProductID = p_VendorProductID;
    ELSE
        INSERT INTO CartProduct (VendorProductID, Quantity, CartID) 
        VALUES (p_VendorProductID, p_Quantity, v_CartID);
    END IF;

    SELECT 'Product added to cart successfully.' AS Status;
END$$

DELIMITER ;

-- Procedure 4 --

DELIMITER $$

CREATE PROCEDURE RegisterNewVendor(
    IN p_Name VARCHAR(255),
    IN p_Address TEXT,
    IN p_Email VARCHAR(255),
    IN p_Password VARCHAR(255),
    IN p_Contact VARCHAR(255)
)
BEGIN
    -- Check if the email is already registered to avoid standard crash exceptions
    IF EXISTS (SELECT 1 FROM Vendor WHERE Email = p_Email) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Vendor Registration Error: Email already exists.';
    ELSE
        INSERT INTO Vendor (Name, Address, Email, Password, Contact)
        VALUES (p_Name, p_Address, p_Email, p_Password, p_Contact);
        
        SELECT 'Vendor profile initiated and registered.' AS Status;
    END IF;
END$$
DELIMITER ;

-- Procedure 5 --

DELIMITER $$
CREATE PROCEDURE UpdateTrackingDetails(
    IN p_OrderID INT,
    IN p_NewVendorCourierID INT,
    IN p_NewTrackingID VARCHAR(255)
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Orders WHERE OrderID = p_OrderID) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Order record not found.';
    ELSE
        UPDATE Orders
        SET VendorCourierID = p_NewVendorCourierID,
            TrackingID = p_NewTrackingID
        WHERE OrderID = p_OrderID;
        
        SELECT 'Logistics tracking pipelines updated.' AS Status;
    END IF;
END$$
DELIMITER ;