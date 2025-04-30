-- Create database
CREATE DATABASE simba
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8' 

-- Create ENUM types
CREATE TYPE criticality_level AS ENUM ('LOW', 'MODERATE', 'HIGH');
CREATE TYPE status_type AS ENUM ('UNDER_ANALYSIS', 'CORRECTING', 'RESOLVED');

-- User table (base entity)
CREATE TABLE "User" (
    username VARCHAR(100) NOT NULL PRIMARY KEY unique,
    name VARCHAR(100) NOT NULL,
    address TEXT,
    email VARCHAR(100),
    phone VARCHAR(20),
    password VARCHAR(255)
);

-- Specialized tables (Student and Teacher)
CREATE TABLE Student (
    username VARCHAR(100) NOT NULL PRIMARY KEY,
    registration_number VARCHAR(16) NOT NULL,
    FOREIGN KEY (username) REFERENCES "User"(username) ON DELETE CASCADE
);

CREATE TABLE Teacher (
    username VARCHAR(100) NOT NULL PRIMARY KEY,
    siape VARCHAR(7) NOT NULL,
    manager_username VARCHAR(100),
    FOREIGN KEY (manager_username) REFERENCES Teacher(username),
    FOREIGN KEY (username) REFERENCES "User" (username) ON DELETE CASCADE
);

-- School table
CREATE TABLE School (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address TEXT,
    phone VARCHAR(20),
    principal_username VARCHAR(100),
    FOREIGN KEY (principal_username) REFERENCES Teacher(username)
);

-- Barrier table
CREATE TABLE Barrier (
    id SERIAL PRIMARY KEY,
    barrier_type TEXT,
    description TEXT,
    resolution_difficulty VARCHAR(100)
);

-- Record table
CREATE TABLE Record (
    id SERIAL PRIMARY KEY,
    location VARCHAR(100),
    criticality criticality_level NOT NULL,
    status status_type NOT NULL,
    barrier_id INTEGER NOT NULL,
    school_id INTEGER NOT NULL,
    FOREIGN KEY (barrier_id) REFERENCES Barrier(id),
    FOREIGN KEY (school_id) REFERENCES School(id)
);

-- Image table
CREATE TABLE Image (
    id SERIAL PRIMARY KEY,
    path VARCHAR(200) NOT NULL,
    upload_date DATE NOT NULL,
    description TEXT,
    record_id INTEGER NOT NULL,
    FOREIGN KEY (record_id) REFERENCES Record(id)
);

-- Report table
CREATE TABLE Report (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    report_date DATE NOT NULL,
    observation VARCHAR(100),
    conclusion VARCHAR(100),
    record_id INTEGER NOT NULL,
    manager_username VARCHAR(100) NOT NULL,
    FOREIGN KEY (record_id) REFERENCES Record(id),
    FOREIGN KEY (manager_username) REFERENCES "User"(username)
);

-- Comment table
CREATE TABLE Comment (
    id SERIAL PRIMARY KEY,
    text TEXT NOT NULL,
    barrier_id INTEGER NOT NULL,
    FOREIGN KEY (barrier_id) REFERENCES Barrier(id)
);
