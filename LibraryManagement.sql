create table author (
    author_id int PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    date_of_birth DATE,
    nationality VARCHAR(20)
);

CREATE table books (
    book_id int PRIMARY KEY,
    title VARCHAR(20),
    author_id int ,
    publication_year int,
    genre VARCHAR(20),
    isbn int,
    available_copies INT,
    foreign key (author_id) REFERENCES author(author_id)
);


CREATE table members (
    member_id int PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    date_of_birth DATE,
    contact_number VARCHAR(20),
    email VARCHAR(20),
    membership_data DATE

);

CREATE table loans (
    loan_id int PRIMARY key,
    book_id int,
    member_id int,
    loan_date DATE,
    return_date DATE,
    actual_return_date DATE,
    Foreign Key (book_id) REFERENCES books(book_id),
    Foreign Key (member_id) REFERENCES members(member_id)
);

CREATE table staff (
    staff_id int PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    position VARCHAR(20),
    contact_number VARCHAR(20),
    email VARCHAR(20),
    hire_date DATE
);

INSERT INTO author VALUES
(1, 'George', 'Orwell', '1903-06-25', 'British'),
(2, 'Harper', 'Lee', '1926-04-28', 'American'),
(3, 'J.K.', 'Rowling', '1965-07-31', 'British'),
(4, 'F. Scott', 'Fitzgerald', '1896-09-24', 'American'),
(5, 'Jane', 'Austen', '1775-12-16', 'British');

INSERT INTO books VALUES
(101, '1984', 1, 1949, 'Dystopian', '9780451524935', 4),
(102, 'To Kill a Mockingbird', 2, 1960, 'Fiction', '9780061120084', 3),
(103, 'Harry Potter and the Sorcerer''s Stone', 3, 1997, 'Fantasy', '9780590353427', 6),
(104, 'The Great Gatsby', 4, 1925, 'Fiction', '9780743273565', 2),
(105, 'Pride and Prejudice', 5, 1813, 'Romance', '9780141439518', 5);


INSERT INTO members VALUES
(201, 'Rahul', 'Sharma', '1998-05-15', '9876543210', 'rahul@example.com', '2023-01-10'),
(202, 'Anita', 'Verma', '1995-09-21', '8765432109', 'anita@example.com', '2023-03-14'),
(203, 'Sunil', 'Patel', '1999-12-10', '7654321098', 'sunil@example.com', '2023-05-22'),
(204, 'Rohit', 'Kumar', '2000-03-18', '6543210987', 'rohit@example.com', '2023-07-05');

INSERT INTO loans VALUES
(301, 101, 201, '2024-01-10', '2024-01-25', '2024-01-20'),
(302, 102, 202, '2024-02-01', '2024-02-20', '2024-02-18'),
(303, 103, 203, '2024-03-05', '2024-03-25', NULL), 
(304, 105, 204, '2024-04-10', '2024-04-30', '2023-03-19');

INSERT INTO staff VALUES
(401, 'Priya', 'Menon', 'Librarian', '9998887776', 'priya@library.com', '2022-02-15'),
(402, 'Arjun', 'Reddy', 'Assistant', '8887776665', 'arjun@library.com', '2023-06-10'),
(403, 'Sneha', 'Das', 'Manager', '7776665554', 'sneha@library.com', '2021-09-01');

--ddl
alter table books add pages VARCHAR(20);

alter table staff rename column position to job_title;

alter table members drop column email;
--dml
INSERT INTO author (author_id, first_name, last_name, date_of_birth, nationality)
VALUES (6, 'Aravind', 'Adiga', '1974-10-23', 'Indian');

INSERT INTO books (book_id, title, author_id, publication_year, genre, isbn, available_copies)
VALUES (106, 'The White Tiger', 6, 2008, 'Fiction', '9781416562603', 4);

update members 
set contact_number='8328248056' where member_id=201;

delete from loans where loan_id=301;

INSERT into loans 
values (305,106,203,'2024-05-01','2024-05-20',Null);

--joins

select books.book_id,author.first_name,author.last_name,books.title,books.genre from 
author inner join books on author.author_id=books.author_id;

select members.member_id,members.first_name,members.last_name,members.contact_number
,members.email from members inner join loans on members.member_id=loans.member_id
where loans.actual_return_date is Null;

select staff.first_name,staff.last_name,staff.hire_date from staff where position='Librarian';

select genre,book_id,COUNT(*) as total_books,SUM(available_copies) as total_copies from books GROUP BY genre;

select members.member_id,members.first_name,members.last_name,books.title from loans 
inner join books on loans.book_id=books.book_id
inner join members on loans.member_id=members.member_id
where members.member_id=203;






