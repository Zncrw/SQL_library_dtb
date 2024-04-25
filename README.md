<h1>Library Database Design Document</h1>

<p><strong>Video Overview:</strong> </p>

<h2>Scope:</h2>
<p>The CS50 SQL database is designed as an electronic library capable of handling various user actions such as borrowing books, returning them, and managing information about authors.</p>

<h2>Representation:</h2>
<p>The entities are represented in SQLite tables with the following schema:</p>

<ul>
    <li><strong>books table:</strong></li>
    <ul>
        <li><strong>id:</strong></li>
        <p>A numeric value serving as the primary key, also unique. It facilitates efficient searching.</p>
        <li><strong>ISBN:</strong></li>
        <p>A numeric key used globally to identify books. It must be unique, and its insertion is required by the database.</p>
        <li><strong>name:</strong></li>
        <p>Stores the name of books as 'TEXT'. This data type is suitable for name fields.</p>
        <li><strong>genre:</strong></li>
        <p>A 'TEXT' value representing the genre(s) of a given book. Multiple genres can be associated with one book.</p>
        <li><strong>year:</strong></li>
        <p>Stores the year when the book was written as an 'INTEGER' value.</p>
        <li><strong>description:</strong></li>
        <p>A brief description of the book stored as 'TEXT'.</p>
        <li><strong>available:</strong></li>
        <p>Stores a 'NUMERIC' value. If the value is 0, the book is available; if 1, it's not available. The default value is set to 0.</p>
        <li><strong>author_id:</strong></li>
        <p>Stores a 'UNIQUE' and 'INTEGER' value referencing the author's ID. It's designed to simplify table JOIN operations.</p>
    </ul>
    <li><strong>author table:</strong></li>
    <ul>
        <li><strong>id:</strong></li>
        <p>The author's specific ID stored as 'INTEGER' type.</p>
        <li><strong>first_name:</strong></li>
        <p>Specifies the author's first name as 'TEXT'.</p>
        <li><strong>last_name:</strong></li>
        <p>Stores the author's last name as 'TEXT'.</p>
        <li><strong>country:</strong></li>
        <p>Stores the author's country of origin as 'TEXT'.</p>
        <li><strong>biography:</strong></li>
        <p>The author's brief biography stored as 'TEXT'.</p>
    </ul>
    <li><strong>loans table:</strong></li>
    <ul>
        <li><strong>id:</strong></li>
        <p>The primary key stored as 'INTEGER' type.</p>
        <li><strong>book_id:</strong></li>
        <p>A foreign key referencing 'books.id', stored as 'INTEGER'.</p>
        <li><strong>user_id:</strong></li>
        <p>A foreign key referencing 'users.id', stored as 'INTEGER'.</p>
        <li><strong>borrow_date:</strong></li>
        <p>Stored as 'NUMERIC' since this format is appropriate for dates. It cannot be NULL and defaults to 'CURRENT_TIMESTAMP'.</p>
        <li><strong>return_date:</strong></li>
        <p>Stored as 'NUMERIC', with a default value of NULL, representing the return date of the book.</p>
    </ul>
    <li><strong>users table:</strong></li>
    <ul>
        <li><strong>id:</strong></li>
        <p>The primary key stored as 'INTEGER'.</p>
        <li><strong>username:</strong></li>
        <p>The user's username stored as 'TEXT', must be 'UNIQUE'.</p>
        <li><strong>name:</strong></li>
        <p>The user's name stored as 'TEXT'.</p>
        <li><strong>surname:</strong></li>
        <p>The user's surname stored as 'TEXT'.</p>
        <li><strong>e-mail:</strong></li>
        <p>The user's email stored as 'TEXT', must be 'UNIQUE'.</p>
    </ul>
</ul>

<h2>Optimizations</h2>
<ul>
    <li><strong>Indexing:</strong></li>
    <p>I have created two indexes to speed up frequently used queries, such as author name searches and book searches.</p>
    <li><strong>Triggers:</strong></li>
    <p>I have also implemented two triggers. They automatically update the 'available' value in the 'books' table when a user borrows or returns a book.</p>
</ul>

<h2>Diagram</h2>
