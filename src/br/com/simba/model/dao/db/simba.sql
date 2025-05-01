CREATE TABLE "User" (
    id SERIAL PRIMARY KEY NOT NULL,
    username VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    street VARCHAR(100) NOT NULL,
    number INTEGER NOT NULL,
    neighborhood VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state_abbr VARCHAR(2) NOT NULL,
    cep VARCHAR(9) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    password VARCHAR(256)
);

-- Specialized tables (Student and Teacher)
CREATE TABLE Student (
    id SERIAL PRIMARY KEY NOT NULL,
    username VARCHAR(100) NOT NULL,
    registration_number VARCHAR(16) NOT NULL,
    FOREIGN KEY (id) REFERENCES "User"(id) ON DELETE CASCADE
);

CREATE TABLE Teacher (
    id SERIAL PRIMARY KEY NOT NULL,
    username VARCHAR(100) NOT NULL PRIMARY KEY,
    siape VARCHAR(7) NOT NULL,
    manager_id VARCHAR(100),
    FOREIGN KEY (manager_id) REFERENCES Teacher(id),
    FOREIGN KEY (id) REFERENCES "User" (id) ON DELETE CASCADE
);

-- School table
CREATE TABLE School (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    street VARCHAR(100) NOT NULL,
    number INTEGER NOT NULL,
    neighborhood VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state_abbr VARCHAR(2) NOT NULL,
    cep VARCHAR(9) NOT NULL,
    phone VARCHAR(20),
    principal_username VARCHAR(100),
    FOREIGN KEY (principal_username) REFERENCES Teacher(username)
);

-- Record table
CREATE TABLE Record (
    id SERIAL PRIMARY KEY,
    location VARCHAR(100),
    criticality criticality_level NOT NULL,
    status status_type NOT NULL,
    barrier_type enum NOT NULL -- TODO,
    description text,
    resolution_difficulty text,
    resolution_suggestion text,
    barrier_identification DATE,
    school_id INTEGER NOT NULL,
    FOREIGN KEY (school_id) REFERENCES School(id)
);

-- Image table
CREATE TABLE Picture (
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
    record_id INTEGER NOT NULL,
    FOREIGN KEY (record_id) REFERENCES Record(id)
);