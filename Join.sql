create table customer (
    id int PRIMARY key,
    cust_name VARCHAR(20),
    phno int
);

create table policy (
    policy_id int,
    policy_name VARCHAR(20),
    cust_id int
);

insert into customer values 
(1,'rahul',8328574),
(2,'anil',985578),
(3,'sunil',967843),
(4,'dheeraj',8384775);

insert into policy values
(101,'carpolicy',1),
(102,'bikepolicy',1),
(103,'homepolicy',2),
(104,'schoolpolicy',3);

select customer.cust_name,policy.policy_name from customer 
inner join policy on customer.id=policy.cust_id;

SELECT customer.cust_name,policy.policy_name from customer 
left OUTER JOIN policy on customer.id=policy.cust_id;

