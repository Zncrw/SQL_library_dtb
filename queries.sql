-- Find name of all books given author name 'William Gibson'
SELECT name FROM books
WHERE author_id = (
    SELECT id FROM author
    WHERE first_name = 'William'
    AND last_name = 'Gibson'
);

-- find name of  all  books given genre 'Science Fiction'
SELECT name FROM books
WHERE genre = 'Science Fiction';

-- find name of  all free books of  author 'William Gibson' (asuming only one William Gibson)
SELECT name FROM books
WHERE available = 0
AND author_id = (
    SELECT id FROM author
    WHERE first_name = 'William'
    AND last_name = 'Gibson'
);

-- lending book Neuromancer to Adam Sandler
INSERT INTO loans (books_id, user_id)
VALUES (1, 1);

-- returning book Neuromancer
UPDATE loans
SET return_date = CURRENT_TIMESTAMP
WHERE books_id = 1 AND user_id = 1 AND return_date IS NULL;


-- inserting book
INSERT INTO books (ISBN, name, genre, year, description, author_id)
VALUES ('978-0441569595', 'Neuromancer', 'Science Fiction', 1984, 'Cyberpunk novel', 1);

-- inserting author
INSERT INTO author (first_name, last_name, country, biography)
VALUES ('William', 'Gibson', 'United States', 'William Gibson is an American-Canadian speculative fiction writer and essayist widely credited with pioneering the science fiction subgenre known as cyberpunk.');
