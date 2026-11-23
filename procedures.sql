USE LittleLemonDB;

DELIMITER //

-- 1. GetMaxQuantity()
CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) AS "Max Quantity in Order" FROM Orders;
END //

-- 2. ManageBooking()
CREATE PROCEDURE ManageBooking(IN booking_date DATE, IN table_no INT)
BEGIN
    DECLARE table_status INT DEFAULT 0;
    SELECT COUNT(*) INTO table_status 
    FROM Bookings 
    WHERE BookingDate = booking_date AND TableNumber = table_no;
    
    IF table_status > 0 THEN
        SELECT CONCAT("Table ", table_no, " is already booked") AS "Booking status";
    ELSE
        SELECT CONCAT("Table ", table_no, " is available") AS "Booking status";
    END IF;
END //

-- 3. AddBooking()
CREATE PROCEDURE AddBooking(IN booking_id INT, IN customer_id INT, IN booking_date DATE, IN table_no INT)
BEGIN
    INSERT INTO Bookings (BookingID, CustomerID, BookingDate, TableNumber)
    VALUES (booking_id, customer_id, booking_date, table_no);
    SELECT "New booking added" AS Confirmation;
END //

-- 4. UpdateBooking()
CREATE PROCEDURE UpdateBooking(IN booking_id INT, IN booking_date DATE)
BEGIN
    UPDATE Bookings 
    SET BookingDate = booking_date 
    WHERE BookingID = booking_id;
    SELECT CONCAT("Booking ", booking_id, " updated") AS Confirmation;
END //

-- 5. CancelBooking()
CREATE PROCEDURE CancelBooking(IN booking_id INT)
BEGIN
    DELETE FROM Bookings 
    WHERE BookingID = booking_id;
    SELECT CONCAT("Booking ", booking_id, " cancelled") AS Confirmation;
END //

DELIMITER ;
