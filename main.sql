
CREATE TABLE Agents (
    agent_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    agency VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);


CREATE TABLE Buyers (
    buyer_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100),
    preferred_location VARCHAR(100)
);


CREATE TABLE Properties (
    property_id SERIAL PRIMARY KEY,
    title VARCHAR(150),
    location VARCHAR(100),
    city VARCHAR(50),
    area_sqft INT,
    price DECIMAL(12,2),
    property_type VARCHAR(50),
    listed_date DATE,
    agent_id INT REFERENCES Agents(agent_id)
);


CREATE TABLE Transactions (
    transaction_id SERIAL PRIMARY KEY,
    property_id INT REFERENCES Properties(property_id),
    buyer_id INT REFERENCES Buyers(buyer_id),
    agent_id INT REFERENCES Agents(agent_id),
    transaction_date DATE,
    sale_price DECIMAL(12,2)
);

INSERT INTO Agents (name, agency, phone, email) VALUES
('Ravi Menon', 'Skyline Realty', '9123456789', 'ravi@skyline.com'),
('Anita Rao', 'Urban Nest', '9876543210', 'anita@urbannest.com'),
('Vikram Iyer', 'Dream Homes', '9786091234', 'vikram@dreamhomes.com');
('Farah Khan', 'Elite Estates', '9988001122', 'farah@elite.com'),
('Arjun Patel', 'Metro Realty', '9977665544', 'arjun@metro.com'),
('Reena Sharma', 'UrbanScape', '9090909090', 'reena@urbanscape.com');

INSERT INTO Buyers (name, phone, email, preferred_location) VALUES
('Nikita Desai', '9991234567', 'nikita@email.com', 'Whitefield'),
('Aditya Singh', '9988776655', 'aditya@email.com', 'HSR Layout'),
('Sneha Reddy', '9876543211', 'sneha@email.com', 'Baner');
('Rahul Mehta', '9100000001', 'rahul@email.com', 'Andheri'),
('Priya Dsouza', '9223344556', 'priya@email.com', 'Powai'),
('Deepak Nair', '9445566778', 'deepak@email.com', 'Koramangala'),
('Ayesha Sheikh', '9012345678', 'ayesha@email.com', 'Kalyani Nagar');

INSERT INTO Properties (title, location, city, area_sqft, price, property_type, listed_date, agent_id) VALUES
('2BHK Apartment', 'Whitefield', 'Bangalore', 1200, 6500000, 'Apartment', '2025-06-01', 1),
('3BHK Villa', 'HSR Layout', 'Bangalore', 1800, 9500000, 'Villa', '2025-06-05', 2),
('Studio Flat', 'Indiranagar', 'Bangalore', 600, 3500000, 'Studio', '2025-06-10', 3),
('2BHK Apartment', 'Kothrud', 'Pune', 1100, 5700000, 'Apartment', '2025-06-03', 1),
('3BHK Villa', 'Baner', 'Pune', 1900, 9900000, 'Villa', '2025-06-07', 2);
('1BHK Apartment', 'Andheri', 'Mumbai', 650, 4800000, 'Apartment', '2025-06-12', 4),
('Luxury Penthouse', 'Powai', 'Mumbai', 2500, 18500000, 'Penthouse', '2025-06-14', 5),
('2BHK Flat', 'Koramangala', 'Bangalore', 1050, 7200000, 'Apartment', '2025-06-15', 6),
('3BHK Villa', 'Kalyani Nagar', 'Pune', 2000, 11000000, 'Villa', '2025-06-16', 6),
('Studio Flat', 'Andheri', 'Mumbai', 500, 3900000, 'Studio', '2025-06-17', 4);

INSERT INTO Transactions (property_id, buyer_id, agent_id, transaction_date, sale_price) VALUES
(1, 1, 1, '2025-06-15', 6400000),
(2, 2, 2, '2025-06-17', 9300000),
(5, 3, 2, '2025-06-20', 9800000);
(6, 4, 4, '2025-06-18', 4700000),     
(7, 5, 5, '2025-06-20', 18200000),    
(8, 6, 6, '2025-06-22', 7100000),     
(9, 7, 6, '2025-06-24', 10900000);   

SELECT city, ROUND(AVG(price), 2) AS average_price
FROM Properties
GROUP BY city;

SELECT title, location, city, price
FROM Properties
ORDER BY price DESC
LIMIT 5;

SELECT 
  TO_CHAR(listed_date, 'YYYY-MM') AS month,
  ROUND(AVG(price), 2) AS avg_price
FROM Properties
GROUP BY month
ORDER BY month;


SELECT p.property_id, p.title, p.city, p.price
FROM Properties p
LEFT JOIN Transactions t ON p.property_id = t.property_id
WHERE t.transaction_id IS NULL;

SELECT 
  a.agent_id,
  a.name AS agent_name, 
  COUNT(t.transaction_id) AS total_sales,
  SUM(t.sale_price) AS total_revenue
FROM Agents a
JOIN Transactions t ON a.agent_id = t.agent_id
GROUP BY a.agent_id, a.name
ORDER BY total_revenue DESC;


SELECT p.location, COUNT(t.transaction_id) AS total_sales
FROM Properties p
JOIN Transactions t ON p.property_id = t.property_id
GROUP BY p.location
ORDER BY total_sales DESC
LIMIT 5;
