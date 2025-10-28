create table claims (
    id int primary key,
    claim_name VARCHAR(20),
    claim_amount int
);

insert into claims values
(1,'rahul',5000),
(2,'hemu',2000),
(3,'anil',3000);

TRUNCATE table claims;
