CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(80) NOT NULL,
    street VARCHAR(100)NOT NULL,
    address_number VARCHAR(10) NOT NULL,
    neighborhood VARCHAR(50) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state_abbr CHAR(2) NOT NULL,
    email VARCHAR(80) NOT NULL UNIQUE,
    username VARCHAR(30) NOT NULL UNIQUE,
    hashed_password VARCHAR(60) NOT NULL
);

CREATE TABLE reporters (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT unique_reporter_user UNIQUE(user_id)
);

CREATE TABLE managers (
    CPF VARCHAR(20) PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    school_id INTEGER NOT NULL,
    CONSTRAINT fk_school_id FOREIGN KEY (school_id) REFERENCES schools(id),
    CONSTRAINT unique_manager_user UNIQUE(user_id)
);

CREATE TABLE schools (
    id SERIAL PRIMARY KEY,
    school_name VARCHAR(100) NOT NULL,
    street VARCHAR(100) NOT NULL,
    address_number VARCHAR(10) NOT NULL,
    neighborhood VARCHAR(50) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state_abbr CHAR(2) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    cnpj CHAR(14) UNIQUE NOT NULL
);

CREATE TABLE records (
    id SERIAL PRIMARY KEY,
    barrier_specification VARCHAR(255),
    resolution_suggestion VARCHAR(255),
    location VARCHAR(120),
    barrier_status VARCHAR(14),
    barrier_criticality VARCHAR(8),
    barrier_type VARCHAR(15),
    barrier_identification_date DATE,
    school_id INTEGER REFERENCES schools(id),
    user_id INTEGER REFERENCES users(id)
);

CREATE TABLE pictures(
    id SERIAL PRIMARY KEY,
    picture_path VARCHAR(255) NOT NULL,
    upload_date DATE NOT NULL,
    description VARCHAR(100) NOT NULL,
    record_id INTEGER REFERENCES records(id) ON DELETE CASCADE
);

CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    text VARCHAR(500) NOT NULL,
    record_id INTEGER REFERENCES records(id) ON DELETE CASCADE
);

CREATE TABLE reports (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    report_date DATE NOT NULL,
    observation VARCHAR(100),
    conclusion VARCHAR(100),
    record_id INTEGER NOT NULL REFERENCES records(id),
    manager_id VARCHAR(20) NOT NULL REFERENCES managers(CPF)
);


