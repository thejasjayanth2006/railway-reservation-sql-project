-- ============================================================
-- RAILWAY RESERVATION SYSTEM - SAMPLE DATA - PostgreSQL VERSION
-- ============================================================

-- ------------------------------------------------------------
-- STATIONS
-- ------------------------------------------------------------
INSERT INTO Station (station_name, station_code, city, state) VALUES
('New Delhi Railway Station', 'NDLS', 'Delhi', 'Delhi'),
('Mumbai Central', 'MMCT', 'Mumbai', 'Maharashtra'),
('Chennai Central', 'MAS', 'Chennai', 'Tamil Nadu'),
('Howrah Junction', 'HWH', 'Kolkata', 'West Bengal'),
('Bengaluru City Junction', 'SBC', 'Bengaluru', 'Karnataka'),
('Pune Junction', 'PUNE', 'Pune', 'Maharashtra'),
('Jaipur Junction', 'JP', 'Jaipur', 'Rajasthan'),
('Ahmedabad Junction', 'ADI', 'Ahmedabad', 'Gujarat'),
('Lucknow Charbagh', 'LKO', 'Lucknow', 'Uttar Pradesh'),
('Bhopal Junction', 'BPL', 'Bhopal', 'Madhya Pradesh');

-- ------------------------------------------------------------
-- TRAINS
-- ------------------------------------------------------------
INSERT INTO Train (train_number, train_name, total_seats, train_type) VALUES
('12951', 'Mumbai Rajdhani Express', 500, 'Rajdhani'),
('12301', 'Howrah Rajdhani Express', 480, 'Rajdhani'),
('12621', 'Tamil Nadu Express', 600, 'Superfast'),
('12137', 'Punjab Mail', 550, 'Express'),
('12649', 'Karnataka Sampark Kranti', 450, 'Superfast'),
('12009', 'Shatabdi Express', 300, 'Shatabdi'),
('12915', 'Ashram Express', 400, 'Express'),
('12435', 'Dibrugarh Rajdhani', 470, 'Rajdhani');

-- ------------------------------------------------------------
-- ROUTES (one primary route per train: source -> destination)
-- ------------------------------------------------------------
INSERT INTO Route (train_id, source_station_id, destination_station_id, distance_km) VALUES
(1, 1, 2, 1384.00),   -- Delhi -> Mumbai
(2, 4, 1, 1447.00),   -- Howrah -> Delhi
(3, 1, 3, 2194.00),   -- Delhi -> Chennai
(4, 2, 1, 1384.00),   -- Mumbai -> Delhi
(5, 5, 1, 2444.00),   -- Bengaluru -> Delhi
(6, 1, 7, 308.00),    -- Delhi -> Jaipur
(7, 1, 8, 934.00),    -- Delhi -> Ahmedabad
(8, 4, 1, 1447.00);   -- Howrah -> Delhi (different train)

-- ------------------------------------------------------------
-- ROUTE_STOPS (a few intermediate stops per route, in sequence)
-- ------------------------------------------------------------
INSERT INTO Route_Stops (route_id, station_id, sequence_no, arrival_time, departure_time) VALUES
(1, 1, 1, NULL, '16:00:00'),
(1, 6, 2, '22:30:00', '22:40:00'),
(1, 2, 3, '08:15:00', NULL),

(3, 1, 1, NULL, '06:00:00'),
(3, 10, 2, '14:00:00', '14:10:00'),
(3, 3, 3, '05:30:00', NULL),

(6, 1, 1, NULL, '17:15:00'),
(6, 7, 2, '22:35:00', NULL),

(7, 1, 1, NULL, '19:50:00'),
(7, 8, 2, '07:25:00', NULL);

-- ------------------------------------------------------------
-- SEAT CLASSES
-- ------------------------------------------------------------
INSERT INTO Seat_Class (class_name, fare_per_km) VALUES
('SL', 0.50),
('3A', 1.20),
('2A', 1.80),
('1A', 3.00),
('GEN', 0.25);

-- ------------------------------------------------------------
-- SCHEDULES (specific runs of trains on specific dates)
-- ------------------------------------------------------------
INSERT INTO Schedule (train_id, run_date, departure_time, arrival_time, status) VALUES
(1, '2026-08-05', '16:00:00', '08:15:00', 'ON_TIME'),
(2, '2026-08-05', '16:50:00', '10:05:00', 'ON_TIME'),
(3, '2026-08-06', '06:00:00', '05:30:00', 'DELAYED'),
(4, '2026-08-06', '17:10:00', '08:35:00', 'ON_TIME'),
(5, '2026-08-07', '20:00:00', '05:15:00', 'ON_TIME'),
(6, '2026-08-05', '17:15:00', '22:35:00', 'ON_TIME'),
(7, '2026-08-08', '19:50:00', '07:25:00', 'ON_TIME'),
(8, '2026-08-08', '15:50:00', '10:05:00', 'CANCELLED');

-- ------------------------------------------------------------
-- SCHEDULE_SEAT_AVAILABILITY (per schedule per class)
-- ------------------------------------------------------------
INSERT INTO Schedule_Seat_Availability (schedule_id, class_id, total_seats, available_seats) VALUES
(1, 2, 200, 195), (1, 3, 150, 148), (1, 4, 50, 49),
(2, 2, 180, 170), (2, 3, 150, 145), (2, 4, 40, 38),
(3, 1, 300, 280), (3, 2, 200, 190), (3, 5, 100, 90),
(4, 1, 250, 240), (4, 2, 200, 198),
(5, 1, 200, 195), (5, 2, 150, 140),
(6, 1, 150, 140), (6, 5, 100, 95),
(7, 1, 250, 230), (7, 2, 100, 95),
(8, 2, 200, 200), (8, 3, 150, 150);

-- ------------------------------------------------------------
-- PASSENGERS
-- ------------------------------------------------------------
INSERT INTO Passenger (full_name, age, gender, email, phone) VALUES
('Rahul Sharma', 29, 'M', 'rahul.sharma@example.com', '9876543210'),
('Priya Verma', 34, 'F', 'priya.verma@example.com', '9876543211'),
('Amit Kumar', 45, 'M', 'amit.kumar@example.com', '9876543212'),
('Sneha Reddy', 27, 'F', 'sneha.reddy@example.com', '9876543213'),
('Vikram Singh', 52, 'M', 'vikram.singh@example.com', '9876543214'),
('Anjali Gupta', 31, 'F', 'anjali.gupta@example.com', '9876543215'),
('Rohan Mehta', 24, 'M', 'rohan.mehta@example.com', '9876543216'),
('Kavita Nair', 39, 'F', 'kavita.nair@example.com', '9876543217'),
('Suresh Iyer', 60, 'M', 'suresh.iyer@example.com', '9876543218'),
('Deepika Rao', 22, 'F', 'deepika.rao@example.com', '9876543219');

-- ------------------------------------------------------------
-- TICKETS
-- ------------------------------------------------------------
-- Seat_Class lookup: 1=SL, 2=3A, 3=2A, 4=1A, 5=GEN
INSERT INTO Ticket (passenger_id, schedule_id, class_id, seat_no, status, fare) VALUES
(1, 1, 3, '2A-021', 'CONFIRMED', 1660.80),
(2, 1, 2, '3A-014', 'CONFIRMED', 692.00),
(3, 2, 2, '3A-055', 'CONFIRMED', 723.50),
(4, 3, 1, 'SL-101', 'CONFIRMED', 1097.00),
(5, 3, 5, 'GEN-010', 'CONFIRMED', 548.50),
(6, 4, 2, '3A-002', 'CONFIRMED', 1660.80),
(7, 5, 1, 'SL-076', 'CONFIRMED', 1222.00),
(8, 6, 1, 'SL-033', 'CONFIRMED', 154.00),
(9, 7, 2, '3A-045', 'WAITLIST', 1120.80),
(10, 1, 4, '1A-005', 'CONFIRMED', 4152.00),
(1, 5, 2, '3A-090', 'CANCELLED', 1222.00);

-- ------------------------------------------------------------
-- PAYMENTS (one-to-one with ticket)
-- ------------------------------------------------------------
INSERT INTO Payment (ticket_id, amount, payment_mode, payment_status) VALUES
(1, 1660.80, 'UPI', 'SUCCESS'),
(2, 692.00, 'CARD', 'SUCCESS'),
(3, 723.50, 'UPI', 'SUCCESS'),
(4, 1097.00, 'NETBANKING', 'SUCCESS'),
(5, 548.50, 'CASH', 'SUCCESS'),
(6, 1660.80, 'CARD', 'SUCCESS'),
(7, 1222.00, 'UPI', 'SUCCESS'),
(8, 154.00, 'UPI', 'SUCCESS'),
(9, 1120.80, 'CARD', 'FAILED'),
(10, 4152.00, 'NETBANKING', 'SUCCESS'),
(11, 1222.00, 'UPI', 'REFUNDED');
