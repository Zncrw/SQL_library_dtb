<h1> Design document <h1>
    <p>Video overview: </p>

<h2>Scope:</h2>
<p>The database for CS50 SQL is made like electronic library. </p>
<p>Library should be able to handle all cases that user would need like borrow book, return, database of authors etc.</p>

<h2>Representation: </h2>
<p>Entities are captured in SQLite tables with the following schema.</p>

<ul>
    <li>books table</li>
    <ul>
        <li> id </li>
        <p> is numeric value, serve as primary key and as primery key is also unique. Its used for better searching. </p>
        <li> ISBN </li>
        <p> ISBN is numeric key, used world wide for identify books, it must be unique and database requires this value to be inserted. </p>
        <li> name </li>
        <p> storing books name as `TEXT`, given `TEXT` is appropriate for name fields.</p>
        <li> genre </li>
        <p> is also 'TEXT' value of genre of given books, could be more genres for one book.</p>
        <li> year </li>
        <p> is for storing the year when books was written. Storin like 'INTEGER' value. </p>
        <li> description</li>
        <p>brief description of book stored like 'TEXT'.</p>
        <li> available</li>
        <p>storing 'NUMERIC' value, if value = 0, then book is available. If value = 1 then book is not available. Defalut value is set to 0.</p>
        <li> author_id</li>
        <p>storing 'UNIQUE' and 'INTEGER' value, value references to author.id and is supossed to be used for easier JOINing tables.</p>
    </ul>
    <li> author table</li>
    <ul>
        <li> id </li>
        <p> author specific ID stored as 'INTEGER' type </p>
        <li>first_name </li>
        <p> which specifies the author first name as `TEXT`, given `TEXT` is appropriate for name fields.</p>
        <li>last_name</li>
        <p> storing last name as 'TEXT'. </p>
        <li> country </li>
        <p> storing author coutnry of origin, stored also like 'TEXT'. </p>
        <li> biography </li>
        <p> authors brief biography stored like 'TEXT'.</p>
    </ul>
    <li> loans table </li>
        <ul>
        <li>id</li>
        <p> primary key, stored like 'INTEGER' tyepe</p>
        <li>books_id </li>
        <p>foreign_key that references to books.id, stored like 'INTEGER'. </p>
        <li>user_id </li>
        <p> foreign_key that references to users.id, stored like 'INTEGER'. </p>
        <li>burrow_date </li>
        <p>stored as 'NUMERIC' as numeric is apropriate format fro this, date cant be NULL and as default using 'CURRENT_TIMESTAMP'.</p>
        <li> return_date </li>
        <p> stored as 'NUMERIC', default set to NULL, represent date of returning the book.</p>
        </ul>
    <li> users table </li>
    <ul>
        <li>id </li>
        <p> primary key stored as 'INTEGER'</p>
        <li>username </li>
        <p>users username, stored as 'TEXT', must be 'UNIQUE' </p>
        <li> name</li>
        <p> users name, stored as 'TEXT'</p>
        <li>surname </li>
        <p> users surname, stored as 'TEXT'</p>
        <li>e-mail </li>
        <p>users e-mail, stored as 'TEXT', must be 'UNIQUE' </p>
    </ul>
</ul>

<h2>Optimizations</h2>
<ul>
    <li>Indexing</li>
    <p> I create here 2 indexes to fasten some of most usefull querries like author_name_search and book_search" </p>
    <li> Triggers</li>
    <p> I also created two triggers, trigers are automaticly used when user is lending book or returning to set apropriate value in books.available </p>
</ul>
<h2> Diagram </h2>
TODO
