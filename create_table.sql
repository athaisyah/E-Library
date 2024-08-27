CREATE TABLE Library (
    library_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL
);

CREATE TABLE Book (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    category VARCHAR(255) NOT NULL,
    quantity INT NOT NULL CHECK(quantity >= 0),
    library_id INT REFERENCES Library(library_id)
);

CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE Loan (
    loan_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id),
    book_id INT REFERENCES Book(book_id),
    loan_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE
);

CREATE TABLE Hold (
    hold_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id),
    book_id INT REFERENCES Book(book_id),
    hold_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) NOT NULL CHECK (status IN ('active', 'expired', 'fulfilled'))
);

