CREATE table customers (
    cust_id int primary KEY,
    cust_name VARCHAR(20)
);

CREATE table agents (
    agent_id int PRIMARY KEY,
    agent_name VARCHAR(20),
    cust_id int,
    Foreign Key (cust_id) REFERENCES customers(cust_id)
);

CREATE table policies (
    policy_id int PRIMARY KEY,
    policy_name VARCHAR(20),
    agent_id int,
    Foreign Key (agent_id) REFERENCES agents(agent_id)

);

CREATE table claim (
    claim_amount int,
    policy_id int ,
    Foreign Key (policy_id) REFERENCES policies(policy_id)

);

INSERT into customers values 
(1,'rahul'),
(2,'anil'),
(3,'sunil'),
(4,'rohit');

INSERT into agents values 
(101,'tarun',1),
(102,'yash',1),
(103,'manoj',2),
(104,'madav',4);

INSERT into policies values 
(501,'carpolicy',101),
(502,'bikepolicy',102),
(503,'homepolicy',103),
(504,'schoolpolicy',104);

INSERT into claim values 
(5000,501),
(8000,502),
(10000,503),
(20000,504);

select customers.cust_name,agents.agent_name,policies.policy_name,claim.claim_amount
from customers inner join agents on customers.cust_id=agents.cust_id 
inner join policies on agents.agent_id=policies.agent_id
inner join  claim on policies.policy_id=claim.policy_id;

select customers.cust_name,agents.agent_name,policies.policy_name,claim.claim_amount
from customers left join agents on customers.cust_id=agents.cust_id 
left join policies on agents.agent_id=policies.agent_id
left join  claim on policies.policy_id=claim.policy_id;

select customers.cust_name,agents.agent_name,policies.policy_name,claim.claim_amount
from customers right join agents on customers.cust_id=agents.cust_id 
right join policies on agents.agent_id=policies.agent_id
right  join  claim on policies.policy_id=claim.policy_id;


