-- CREATE DATABASE dbapp;
CREATE DATABASE  dbapp ;
CREATE DATABASE dbapp  WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 2};
\c dbapp;
CREATE TABLE IF NOT EXISTS users(
  id SERIAL PRIMARY KEY,
  name TEXT,
  age INT,
  email TEXT
);
INSERT INTO users (name, age, email) VALUES 
('Alice', 28, 'alice@example.com'),
('Benjamin', 35, 'benjamin@example.com'),
('Carla', 42, 'carla@example.com'),
('David', 31, 'david@example.com'),
('Eleanor', 27, 'eleanor@example.com'),
('Frank', 38, 'frank@example.com'),
('Grace', 29, 'grace@example.com'),
('Henry', 45, 'henry@example.com'),
('Isabella', 33, 'isabella@example.com'),
('Jack', 26, 'jack@example.com'),
('Katherine', 37, 'katherine@example.com');