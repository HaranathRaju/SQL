CREATE TABLE customers (
    cust_id INT PRIMARY KEY,
    cust_name VARCHAR(30)
);

CREATE TABLE agents (
    agent_id INT PRIMARY KEY,
    agent_name VARCHAR(30),
    cust_id INT,
    FOREIGN KEY (cust_id) REFERENCES customers(cust_id)
);

CREATE TABLE policies (
    policy_id INT PRIMARY KEY,
    policy_name VARCHAR(30),
    agent_id INT,
    FOREIGN KEY (agent_id) REFERENCES agents(agent_id)
);

CREATE TABLE claim (
    claim_id INT PRIMARY KEY,
    policy_id INT,
    claim_amount INT,
    status VARCHAR(20),
    FOREIGN KEY (policy_id) REFERENCES policies(policy_id)
);

CREATE TABLE Temp_Policies (
    temp_policy_id INT,
    temp_name VARCHAR(30)
);

INSERT INTO customers VALUES
(1, 'Rahul'),
(2, 'Anil'),
(3, 'Sunil'),
(4, 'Rohit');

INSERT INTO agents VALUES
(101, 'Tarun', 1),
(102, 'Yash', 1),
(103, 'Manoj', 2),
(104, 'Madhav', 4),
(105, 'Kiran', 3);  

INSERT INTO policies VALUES
(501, 'Car Policy', 101),
(502, 'Bike Policy', 102),
(503, 'Home Policy', 103),
(504, 'School Policy', 104);

INSERT INTO claim VALUES
(9001, 501, 5000, 'Open'),
(9002, 502, 0, 'Closed'),
(9003, 503, 10000, 'Open'),
(9004, 504, 0, 'Closed');

INSERT into Temp_Policies VALUES
(1000,'car'),
(2000,'bike');

delete from claim where status='Closed' and claim_amount=0;

drop table Temp_Policies;

select agents.agent_name,policies.policy_name 
from agents left outer join policies 
on agents.agent_id=policies.agent_id;



