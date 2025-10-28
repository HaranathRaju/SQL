CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    date_of_birth DATE,
    gender VARCHAR(20),
    contact_number VARCHAR(20),
    email VARCHAR(20),
    addres VARCHAR(50)
);

CREATE table policies (
    policy_id int PRIMARY key,
    policy_name VARCHAR(20),
    policy_type VARCHAR(20),
    coverage_details VARCHAR(50),
    premium_amount int ,
    started_date DATE,
    end_date DATE
);

CREATE table claims (
    claim_id int PRIMARY KEY,
    customer_id int,
    policy_id int,
    claim_date DATE,
    claim_amount int,
    approved_amount int,
    claim_status VARCHAR(20),
    Foreign Key (customer_id) REFERENCES customers(customer_id),
    Foreign Key (policy_id) REFERENCES policies(policy_id)
);

CREATE table agents(
    agent_id int PRIMARY key,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    contact_number VARCHAR(20),
    email VARCHAR(20),
    hire_date DATE
);

CREATE table policyassignments (
    assignment_id int PRIMARY key ,
    customer_id int,
    policy_id int,
    agent_id int,
    started_date DATE,
    end_date DATE,
    Foreign Key (customer_id) REFERENCES customers(customer_id),
    Foreign Key (policy_id) REFERENCES policies(policy_id),
    Foreign Key (agent_id) REFERENCES agents(agent_id)
);

CREATE table claimprocessing (
    processing_id int PRIMARY key ,
    claim_id int,
    processing_date DATE,
    payment_amount int,
    payment_date DATE,
    Foreign Key (claim_id) REFERENCES claims(claim_id)
);

INSERT INTO customers VALUES
(1, 'Rahul', 'Sharma', '1988-04-15', 'Male', '9876543210', 'rahul@gmail.com', 'Mumbai'),
(2, 'Anita', 'Verma', '1992-11-22', 'Female', '9876512345', 'anita@gmail.com', 'Delhi'),
(3, 'Suresh', 'Patel', '1985-06-09', 'Male', '9998887776', 'suresh@gmail.com', 'Ahmedabad'),
(4, 'Priya', 'Reddy', '1990-03-30', 'Female', '9090909090', 'priya@gmail.com', 'Hyderabad'),
(5, 'Kiran', 'Kumar', '1983-07-19', 'Male', '9876001122', 'kiran@gmail.com', 'Chennai');

INSERT INTO policies VALUES
(101, 'Health Secure', 'Health', 'Covers hospitalization & treatment', 5000, '2024-01-01', '2025-01-01'),
(102, 'Life Protect', 'Life', 'Covers accidental & natural death', 7000, '2024-03-01', '2044-03-01'),
(103, 'Car Shield', 'Vehicle', 'Covers car damage & theft', 3000, '2024-06-15', '2025-06-15'),
(104, 'Home Guard', 'Property', 'Covers fire, theft, flood damages', 4000, '2024-04-10', '2029-04-10'),
(105, 'Travel Cover', 'Travel', 'Covers trip cancellations & health', 2000, '2024-09-01', '2025-03-01');

INSERT INTO claims VALUES
(201,1,101, '2024-07-12', 25000, 20000, 'Approved'),
(202,1,101, '2024-08-05', 15000, 0, 'Pending'),
(203,2,101, '2024-09-10', 10000, 8000, 'Approved'),
(204,3,104, '2024-10-01', 40000, 35000, 'Approved'),
(205,5,105, '2024-10-15', 18000, 0, 'Rejected');

INSERT into agents VALUES
(301, 'Ravi', 'Kumar', '9876549876', 'ravi.agent@gmail.com', '2020-02-15'),
(302, 'Sunita', 'Joshi', '9876523456', 'sunita.agent@gmail.com', '2021-06-20'),
(303, 'Amit', 'Das', '9998887766', 'amit.agent@gmail.com', '2019-09-10'),
(304, 'Neha', 'Singh', '9090876543', 'neha.agent@gmail.com', '2022-03-01'),
(305, 'Vikas', 'Rao', '9000090000', 'vikas.agent@gmail.com', '2023-01-05');

INSERT INTO policyassignments VALUES
(401, 1, 101,301, '2024-01-01', '2025-01-01'),
(402, 1, 103,302, '2024-06-15', '2025-06-15'),
(403, 2, 102,303, '2024-03-01', '2044-03-01'),
(404, 3, 104,304, '2024-04-10', '2029-04-10'),
(405, 4, 105,305, '2024-09-01', '2025-03-01');


INSERT INTO claimprocessing VALUES
(501, 201, '2024-07-20', 20000, '2024-07-25'),
(502, 202, '2024-08-10', 0, NULL),
(503, 203, '2024-09-15', 8000, '2024-09-20'),
(504, 204, '2024-10-10', 35000, '2024-10-15'),
(505, 205, '2024-10-20', 0, NULL);

--ddl

alter table agents add city VARCHAR(20);


--dml 

update policies set premium_amount=10000 where policy_id=101;

delete from claims where claim_id=201;

insert into policyassignments values 
(406,5,105,305,'2024-11-03','2035-04-15');

--joins

select customers.customer_id,customers.first_name,policies.policy_id,agents.agent_id,agents.first_name
from policyassignments inner join customers on policyassignments.customer_id=customers.customer_id
inner join policies on policyassignments.policy_id=policies.policy_id 
inner join agents on policyassignments.agent_id=agents.agent_id;

select policies.policy_id,policies.policy_name,policies.policy_type,claims.claim_amount,claims.approved_amount
from claims inner join policies on claims.policy_id=policies.policy_id;

select customers.customer_id,customers.first_name,customers.gender,customers.contact_number
,claims.claim_amount,claims.approved_amount from claims inner join customers 
on claims.customer_id=customers.customer_id;

select policy_type, COUNT(claim_id) as claims,sum(claim_amount) as total_claim_amount
from policies inner join claims on policies.policy_id=claims.policy_id GROUP BY policy_type;

select max(claim_date) as recent_claim , customers.customer_id,customers.first_name
from claims inner join customers on claims.customer_id=customers.customer_id GROUP BY customers.customer_id;


