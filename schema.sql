-- Table to represent books
CREATE TABLE books (
    id INTEGER PRIMARY KEY,
    ISBN INTEGER NOT NULL UNIQUE,
    name TEXT NOT NULL,
    genre TEXT,
    year INTEGER,
    description TEXT,
    available INTEGER DEFAULT 0,
    author_id INTEGER NOT NULL,
    FOREIGN KEY (author_id) REFERENCES author(id)
);

-- Table to represent book authors
CREATE TABLE author (
    id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT,
    country TEXT,
    biography TEXT
);

-- Table to represent book loans
CREATE TABLE loans (
    id INTEGER PRIMARY KEY,
    books_id INTEGER,
    user_id INTEGER,
    burrow_date NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    return_date NUMERIC DEFAULT NULL,
    FOREIGN KEY (books_id) REFERENCES books(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Table represents registered users
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    username TEXT UNIQUE NOT NULL,
    name TEXT NOT NULL,
    surname TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE
);

-- Indexes to speed up most used queries
CREATE INDEX author_name_search ON author (first_name, last_name);
CREATE INDEX book_search ON books (ISBN, genre, name);

-- Trigger to switch books.available to 1 (borrowed)
CREATE TRIGGER update_available_status
AFTER INSERT ON loans
BEGIN
    UPDATE books
    SET available = 1
    WHERE id = NEW.books_id;
END;

-- Trigger to switch books.available to 0 if book is returned
CREATE TRIGGER book_return
AFTER UPDATE ON loans
WHEN OLD.return_date IS NULL AND NEW.return_date IS NOT NULL
BEGIN
    UPDATE books
    SET available = 0
    WHERE id = OLD.books_id;
END;
