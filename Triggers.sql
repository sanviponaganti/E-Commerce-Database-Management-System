
DELIMITER $$
CREATE TRIGGER trg_RestockOnOrderCancellation
AFTER DELETE ON OrderedProduct
FOR EACH ROW
BEGIN
    UPDATE VendorProduct
    SET Quantity = Quantity + OLD.Quantity
    WHERE VendorProductID = OLD.VendorProductID;
END$$

DELIMITER ;

DELIMITER $$
CREATE TRIGGER trg_UpdateStockAfterSale
AFTER INSERT ON OrderedProduct
FOR EACH ROW
BEGIN
    UPDATE VendorProduct
    SET Quantity = Quantity - NEW.Quantity
    WHERE VendorProductID = NEW.VendorProductID;
END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER trg_ValidateReviewRating
BEFORE INSERT ON Review
FOR EACH ROW
BEGIN
    IF NEW.Rating < 1 OR NEW.Rating > 5 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Validation Error: Rating must be an integer between 1 and 5.';
    END IF;
END$$

DELIMITER ;
DELIMITER $$

CREATE TRIGGER trg_PreventDuplicateCartProduct
BEFORE INSERT ON CartProduct
FOR EACH ROW
BEGIN
    DECLARE v_ExistingID INT;
    
    -- Check if product is already in this specific cart
    SELECT CartProductID INTO v_ExistingID 
    FROM CartProduct 
    WHERE CartID = NEW.CartID AND VendorProductID = NEW.VendorProductID 
    LIMIT 1;

    IF v_ExistingID IS NOT NULL THEN
        -- Safely update instead of duplicating
        UPDATE CartProduct 
        SET Quantity = Quantity + NEW.Quantity 
        WHERE CartProductID = v_ExistingID;
        
        -- Cancel the duplicate insert attempt cleanly
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Handled: Item matched existing row, quantity incremented.';
    END IF;
END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER trg_EnforceValidAgeSignUp
BEFORE INSERT ON Customer
FOR EACH ROW
BEGIN
    IF TIMESTAMPDIFF(YEAR, NEW.DOB, CURDATE()) < 13 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Registration Denied: Customer must be at least 13 years old.';
    END IF;
END$$

DELIMITER ;
