create database hotel_booking_system;
use hotel_booking_system;

CREATE TABLE Room_Types (
    room_type_id INT PRIMARY KEY ,
    type_name VARCHAR(50) NOT NULL,
    base_price DECIMAL(10,2) NOT NULL,
    max_occupancy INT NOT NULL,
    amenities VARCHAR(255)
);

INSERT INTO Room_Types (room_type_id,type_name, base_price, max_occupancy, amenities) VALUES
(1,'Standard Single', 1800.00, 1, 'AC, TV, WiFi'),
(2,'Standard Double', 2500.00, 2, 'AC, TV, WiFi'),
(3,'Standard Twin', 2600.00, 2, 'AC, TV, WiFi, Twin Beds'),
(4,'Deluxe Single', 2800.00, 1, 'AC, TV, WiFi, Mini Fridge'),
(5,'Deluxe Double', 3500.00, 2, 'AC, TV, WiFi, Mini Fridge'),
(6,'Deluxe Twin', 3600.00, 2, 'AC, TV, WiFi, Mini Fridge, Twin Beds'),
(7,'Super Deluxe', 4200.00, 3, 'AC, TV, WiFi, Balcony'),
(8,'Executive Room', 4800.00, 2, 'AC, TV, WiFi, Work Desk'),
(9,'Executive Suite', 6500.00, 3, 'AC, TV, WiFi, Living Area'),
(10,'Junior Suite', 5800.00, 3, 'AC, TV, WiFi, Sofa'),
(11,'Luxury Suite', 8500.00, 4, 'AC, TV, WiFi, Jacuzzi'),
(12,'Presidential Suite', 15000.00, 4, 'AC, TV, WiFi, Private Lounge'),
(13,'Family Room', 5000.00, 5, 'AC, TV, WiFi, Extra Beds'),
(14,'Honeymoon Suite', 9000.00, 2, 'AC, TV, WiFi, Jacuzzi, Balcony'),
(15,'Studio Room', 4000.00, 2, 'AC, TV, WiFi, Kitchenette'),
(16,'Business Class Room', 5200.00, 2, 'AC, TV, WiFi, Work Desk, Printer'),
(17,'Club Room', 5600.00, 2, 'AC, TV, WiFi, Club Lounge Access'),
(18,'Premium Sea View', 7200.00, 3, 'AC, TV, WiFi, Sea View'),
(19,'Premium City View', 6800.00, 3, 'AC, TV, WiFi, City View'),
(20,'Penthouse Suite', 20000.00, 6, 'AC, TV, WiFi, Terrace, Private Pool');

SELECT * FROM RoomTypes;


CREATE TABLE Rooms_Available
(
    room_id INT PRIMARY KEY ,
    room_number VARCHAR(10) NOT NULL UNIQUE,
    room_type_id INT NOT NULL,
    floor_number INT NOT NULL,
    status VARCHAR(20) DEFAULT 'Available',
    FOREIGN KEY (room_type_id) REFERENCES Room_Types(room_type_id)
);

ALTER TABLE Rooms_Available ADD last_renovated varchar(20);

INSERT INTO Rooms_Available(room_id,room_number,room_type_id,floor_number,status,last_renovated) VALUES
(12,'102', 2, 1, 'Available', 2023),
(13,'103', 3, 1, 'Occupied', 2022),
(14,'104', 4, 1, 'Available', 2024),
(15,'105', 5, 1, 'Occupied', 2024),
(16,'201', 6, 2, 'Available', 2022),
(17,'202', 7, 2, 'Available', 2023),
(18,'203', 8, 2, 'Occupied', 2023),
(19,'204', 9, 2, 'Available', 2024),
(20,'205', 10, 2, 'Available', 2022),
(21,'301', 11, 3, 'Occupied', 2024),
(22,'302', 12, 3, 'Available', 2025),
(23,'303', 13, 3, 'Available', 2023),
(24,'304', 14, 3, 'Occupied', 2024),
(25,'305', 15, 3, 'Available', 2022),
(26,'401', 16, 4, 'Available', 2023),
(27,'402', 17, 4, 'Occupied', 2024),
(28,'403', 18, 4, 'Available', 2025),
(29,'404', 19, 4, 'Available', 2023),
(30,'501', 20, 5, 'Available', 2025);

SELECT * FROM Rooms_Available;


CREATE TABLE Guests_info
(
    guest_id INT PRIMARY KEY ,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15) NOT NULL,
    city VARCHAR(50),
    id_proof_type VARCHAR(20),
    id_proof_number VARCHAR(30)
);

INSERT INTO Guests_info(guest_id,full_name,email,phone,city,id_proof_type,id_proof_number) VALUES
(201,'Rohan Deshmukh', 'rohan.deshmukh@mail.com', '9822011111', 'Pune', 'Aadhar', 'A1234501'),
(202,'Priya Sharma', 'priya.sharma@mail.com', '9822011112', 'Mumbai', 'Passport', 'P1234502'),
(203,'Amit Kulkarni', 'amit.kulkarni@mail.com', '9822011113', 'Nagpur', 'Aadhar', 'A1234503'),
(204,'Sneha Joshi', 'sneha.joshi@mail.com', '9822011114', 'Pune', 'Voter ID', 'V1234504'),
(205,'Vikram Singh', 'vikram.singh@mail.com', '9822011115', 'Delhi', 'Aadhar', 'A1234505'),
(206,'Anjali Patil', 'anjali.patil@mail.com', '9822011116', 'Pune', 'Passport', 'P1234506'),
(207,'Rajesh Verma', 'rajesh.verma@mail.com', '9822011117', 'Indore', 'Aadhar', 'A1234507'),
(208,'Neha Gupta', 'neha.gupta@mail.com', '9822011118', 'Mumbai', 'Aadhar', 'A1234508'),
(209,'Suresh Iyer', 'suresh.iyer@mail.com', '9822011119', 'Chennai', 'Passport', 'P1234509'),
(210,'Pooja Nair', 'pooja.nair@mail.com', '9822011120', 'Kochi', 'Voter ID', 'V1234510'),
(211,'Karan Mehta', 'karan.mehta@mail.com', '9822011121', 'Ahmedabad', 'Aadhar', 'A1234511'),
(212,'Divya Reddy', 'divya.reddy@mail.com', '9822011122', 'Hyderabad', 'Aadhar', 'A1234512'),
(213,'Manoj Pillai', 'manoj.pillai@mail.com', '9822011123', 'Kochi', 'Passport', 'P1234513'),
(214,'Kavita Rao', 'kavita.rao@mail.com', '9822011124', 'Bangalore', 'Aadhar', 'A1234514'),
(215,'Sanjay Yadav', 'sanjay.yadav@mail.com', '9822011125', 'Lucknow', 'Voter ID', 'V1234515');

SELECT * FROM Guests_info;

CREATE TABLE All_Services 
(
    service_id INT PRIMARY KEY ,
    service_name VARCHAR(50) NOT NULL,
    price DECIMAL(8,2) NOT NULL,
    description VARCHAR(150)
);

INSERT INTO All_Services (service_id,service_name, price,description) VALUES
(301,'Breakfast Buffet', 350.00, 'Complimentary/paid breakfast buffet'),
(302,'Airport Pickup', 800.00, 'Pickup from airport to hotel'),
(303,'Airport Drop', 800.00, 'Drop from hotel to airport'),
(304,'Laundry Service', 250.00, 'Same-day laundry and pressing'),
(305,'Spa Session', 1500.00, 'Full body spa and massage'),
(306,'Gym Access', 200.00, 'Daily gym access pass'),
(307,'Extra Bed', 600.00, 'Additional bed in the room'),
(308,'Room Service', 150.00, 'In-room dining service'),
(309,'Late Checkout', 500.00, 'Checkout extended till 6 PM'),
(310,'Candle Light Dinner', 2500.00, 'Private candle light dinner setup'),
(311,'Swimming Pool Access', 300.00, 'Full day pool access'),
(312,'Bonfire Setup', 1200.00, 'Evening bonfire with snacks'),
(313,'Car Rental', 2000.00, 'Selfdrive/chauffeur car rental per day'),
(314,'City Tour', 1800.00, 'Guided half-day city tour'),
(315,'Babysitting', 700.00, 'Childcare service per session'),
(316,'Doctor on Call', 500.00, 'On-demand doctor visit'),
(317,'Premium WiFi', 100.00, 'High-speed WiFi upgrade'),
(318,'Valet Parking', 150.00, 'Valet parking service'),
(319,'Mini Bar Refill', 900.00, 'In-room mini bar restocking'),
(320,'Conference Hall', 5000.00, 'Conference hall booking per day');

SELECT * FROM All_Services;


CREATE TABLE Bookings_info 
(
    booking_id INT PRIMARY KEY ,
    guest_id INT NOT NULL,
    room_id INT NOT NULL,
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,
    num_guests INT NOT NULL,
    booking_date DATE NOT NULL,
    status VARCHAR(20) DEFAULT 'Confirmed',
    total_amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (guest_id) REFERENCES Guests_info(guest_id),
    FOREIGN KEY (room_id) REFERENCES Rooms_Available(room_id)
);

INSERT INTO Bookings_info(booking_id,guest_id,room_id,check_in,check_out,num_guests,booking_date,status,total_amount) VALUES
(400,201, 12, '2026-01-12', '2026-01-14', 2,'2025-12-26', 'Checked-out', 5000.00),
(401,202, 13, '2026-01-10', '2026-01-12', 2,'2025-12-28', 'Checked-out', 5000.00),
(402,203, 14, '2026-02-01', '2026-02-03', 2, '2026-01-15', 'Checked-out', 5200.00),
(403,204, 15, '2026-02-05', '2026-02-07', 1, '2026-01-20', 'Checked-out', 5600.00),
(404,205, 16, '2026-02-10', '2026-02-14', 2, '2026-01-25', 'Checked-out', 14000.00),
(405,206, 17, '2026-03-01', '2026-03-03', 3, '2026-02-10', 'Checked-out', 8400.00),
(406,207, 18, '2026-03-05', '2026-03-08', 2, '2026-02-15', 'Checked-out', 14400.00),
(407,208, 19, '2026-03-10', '2026-03-12', 3, '2026-02-20', 'Checked-out', 13000.00),
(408,209, 20, '2026-04-01', '2026-04-04', 3, '2026-03-10', 'Checked-out', 17400.00),
(409,210, 21, '2026-04-05', '2026-04-06', 2, '2026-03-15', 'Cancelled', 5800.00),
(410,211, 22, '2026-04-10', '2026-04-13', 3, '2026-03-25', 'Checked-out', 25500.00),
(411,212, 23, '2026-05-01', '2026-05-05', 4, '2026-04-10', 'Checked-out', 60000.00),
(412,213, 24, '2026-05-08', '2026-05-10', 4, '2026-04-15', 'Checked-out', 10000.00),
(413,214, 25, '2026-05-15', '2026-05-17', 2, '2026-04-20', 'Checked-out', 18000.00),
(415,215, 26, '2026-06-01', '2026-06-03', 2, '2026-05-10', 'Checked-out', 8000.00);


SELECT * FROM Bookings_info;

CREATE TABLE All_Payments
(
    payment_id INT PRIMARY KEY ,
    booking_id INT NOT NULL,
    payment_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_mode VARCHAR(20) NOT NULL,
    payment_status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (booking_id) REFERENCES Bookings_info(booking_id)
    );
    
INSERT INTO All_Payments(payment_id,booking_id,payment_date, amount, payment_mode,payment_status) VALUES
(501,401, '2026-01-12', 5000.00, 'UPI', 'Paid'),
(502,402, '2026-02-03', 5200.00, 'Cash', 'Paid'),
(503,403, '2026-02-07', 5600.00, 'Card', 'Paid'),
(504,404, '2026-02-14', 14000.00, 'NetBanking','Paid'),
(505,405, '2026-03-03', 8400.00, 'UPI', 'Paid'),
(506,406, '2026-03-08', 14400.00, 'Card','Paid'),
(507,407, '2026-03-12', 13000.00, 'Cash','Paid'),
(508,408, '2026-04-04', 17400.00, 'UPI', 'Paid'),
(509,409, '2026-03-15', 0.00, 'UPI','Refunded'),
(510,410,'2026-04-13', 25500.00, 'Card','Paid');

select * from All_Payments;

    CREATE TABLE Booking_Services_Info(
    booking_service_id INT PRIMARY KEY,
    booking_id INT NOT NULL,
    service_id INT NOT NULL,
    quantity INT DEFAULT 1,
    service_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES Bookings_info(booking_id),
    FOREIGN KEY (service_id) REFERENCES All_Services(service_id)
);

INSERT INTO Booking_Services_Info(booking_service_id,booking_id,service_id,quantity, service_date, amount) 
VALUES
(601, 401, 302,1, '2026-01-07', 250.00),
(602, 402, 303,1, '2026-01-10', 800.00),
(603, 404, 304,2, '2026-02-02', 700.00),
(604, 403, 305,2, '2026-02-07', 500.00),
(605, 405, 306,1, '2026-02-11', 3000.00),
(606, 406, 307,3, '2026-02-12', 2500.00),
(607, 407, 308,1, '2026-03-01', 600.00),
(608, 411, 309,1, '2026-03-06', 900.00),
(609, 408, 303,2, '2026-03-10', 600.00),
(610, 409, 303,3,'2026-04-02', 6000.00);

SELECT * FROM Booking_Services_Info;

-- 1. Top 5 guests by total revenue
SELECT g.guest_id, g.full_name, SUM(b.total_amount) AS total_revenue
FROM Guests_info g
JOIN Bookings_info b ON g.guest_id = b.guest_id
GROUP BY g.guest_id, g.full_name
ORDER BY total_revenue DESC
LIMIT 5;

-- 2. Highest revenue-generating room type
SELECT rt.type_name, SUM(b.total_amount) AS revenue
FROM Room_Types rt
JOIN Rooms_Available r ON rt.room_type_id = r.room_type_id
JOIN Bookings_info b ON r.room_id = b.room_id
GROUP BY rt.type_name
ORDER BY revenue DESC;

-- 3. Monthly sales trend (booking-wise)
SELECT DATE_FORMAT(booking_date, '%Y-%m') AS month, SUM(total_amount) AS monthly_revenue
FROM Bookings_info
GROUP BY month
ORDER BY month;


-- 4. Most-booked service
SELECT s.service_name, SUM(bs.quantity) AS total_quantity_booked, COUNT(*) AS times_booked
FROM Booking_Services_Info bs
JOIN All_Services s ON bs.service_id = s.service_id
GROUP BY s.service_name
ORDER BY total_quantity_booked DESC;

-- 5. Average booking (order) value
SELECT ROUND(AVG(total_amount), 2) AS avg_booking_value
FROM Bookings_info;

-- 6. Floor-wise sales report
SELECT r.floor_number, SUM(b.total_amount) AS floor_revenue
FROM Rooms_Available r
JOIN Bookings_info b ON r.room_id = b.room_id
GROUP BY r.floor_number
ORDER BY floor_revenue DESC;

-- 7. Guest purchase / activity history
SELECT g.full_name, b.booking_id, b.check_in, b.check_out, b.status, b.total_amount
FROM Guests_info g
JOIN Bookings_info b ON g.guest_id = b.guest_id
ORDER BY g.full_name, b.check_in;


-- 8. Pending / partial payments (dues report)
SELECT b.booking_id, g.full_name, b.total_amount, 
       COALESCE(SUM(p.amount),0) AS amount_paid,
       b.total_amount - COALESCE(SUM(p.amount),0) AS balance_due,
       MAX(p.payment_status) AS payment_status
FROM Bookings_info b
JOIN Guests_info g ON b.guest_id = g.guest_id
LEFT JOIN All_Payments p ON b.booking_id = p.booking_id
GROUP BY b.booking_id, g.full_name, b.total_amount
HAVING balance_due > 0
ORDER BY balance_due DESC;

-- 9. Room occupancy status summary
SELECT status, COUNT(*) AS room_count
FROM Rooms_Available
GROUP BY status;

-- 10. Cancelled bookings report
SELECT booking_id, guest_id, room_id, check_in, check_out, total_amount
FROM Bookings_info
WHERE status = 'Cancelled';

-- 11. Revenue by payment mode
SELECT payment_mode, SUM(amount) AS total_collected, COUNT(*) AS transaction_count
FROM All_Payments
GROUP BY payment_mode
ORDER BY total_collected DESC;

-- 12. Overall summary dashboard (combined KPIs)
SELECT
  (SELECT COUNT(*) FROM Bookings_info) AS total_bookings,
  (SELECT COUNT(*) FROM Guests_info) AS total_guests,
  (SELECT SUM(total_amount) FROM Bookings_info) AS total_booking_revenue,
  (SELECT SUM(amount) FROM All_Payments WHERE payment_status = 'Paid') AS total_collected,
  (SELECT SUM(b.total_amount) - COALESCE((SELECT SUM(p.amount) FROM All_Payments p 
      WHERE p.booking_id = b.booking_id), 0)
   FROM Bookings_info b) AS total_outstanding_dues,
  (SELECT COUNT(*) FROM Rooms_Available WHERE status = 'Available') AS rooms_available_now,
  (SELECT COUNT(*) FROM Bookings_info WHERE status = 'Cancelled') AS cancelled_bookings;