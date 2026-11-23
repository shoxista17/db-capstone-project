CREATE DATABASE IF NOT EXISTS LittleLemonDB;
USE LittleLemonDB;

-- 1. Mijozlar jadvali
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    ContactNumber VARCHAR(20) NOT NULL,
    Email VARCHAR(100)
);

-- 2. Xodimlar jadvali
CREATE TABLE Staff (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Role VARCHAR(50) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL
);

-- 3. Menyu jadvali
CREATE TABLE Menus (
    MenuID INT AUTO_INCREMENT PRIMARY KEY,
    MenuName VARCHAR(100) NOT NULL,
    Cuisine VARCHAR(50) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
);

-- 4. Bronlar (Bookings) jadvali
CREATE TABLE Bookings (
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    BookingDate DATE NOT NULL,
    TableNumber INT NOT NULL,
    CustomerID INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE
);

-- 5. Buyurtmalar (Orders) jadvali
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    OrderDate DATE NOT NULL,
    Quantity INT NOT NULL,
    TotalCost DECIMAL(10, 2) NOT NULL,
    BookingID INT,
    MenuID INT NOT NULL,
    StaffID INT NOT NULL,
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID) ON DELETE SET NULL,
    FOREIGN KEY (MenuID) REFERENCES Menus(MenuID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

-- 6. Yetkazib berish (OrderDeliveryStatus) jadvali
CREATE TABLE OrderDeliveryStatus (
    DeliveryID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    DeliveryDate DATE,
    Status VARCHAR(50) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE
);

-- Test uchun namunaviy ma'lumotlar
INSERT INTO Customers (FullName, ContactNumber, Email) VALUES
('Anna Iversen', '998901234567', 'anna@example.com'),
('Joakim Iversen', '998901234568', 'joakim@example.com'),
('Vanessa McCarthy', '998901234569', 'vanessa@example.com'),
('Marcos Romero', '998901234570', 'marcos@example.com');

INSERT INTO Staff (FullName, Role, Salary) VALUES
('Mario Gollini', 'Manager', 70000.00),
('Adrian Gollini', 'Assistant Manager', 65000.00),
('Giorgos Dioudis', 'Head Chef', 50000.00);

INSERT INTO Menus (MenuName, Cuisine, Price) VALUES
('Greek Salad', 'Greek', 15.00),
('Bean Soup', 'Italian', 12.00),
('Pizza Margherita', 'Italian', 18.00),
('Kabasa', 'Turkish', 22.00);

INSERT INTO Bookings (BookingDate, TableNumber, CustomerID) VALUES
('2022-10-10', 5, 1),
('2022-11-12', 3, 3),
('2022-10-11', 2, 2),
('2022-10-13', 2, 1);

INSERT INTO Orders (OrderDate, Quantity, TotalCost, BookingID, MenuID, StaffID) VALUES
('2022-10-10', 2, 30.00, 1, 1, 1),
('2022-11-12', 5, 90.00, 2, 3, 2),
('2022-10-11', 3, 66.00, 3, 4, 3);
