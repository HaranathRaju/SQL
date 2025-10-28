create table oldagents (
    id int PRIMARY KEY,
    agent_name VARCHAR(20)

);

INSERT INTO oldagents VALUES
(1,'rahul'),
(2,'anil');

drop table oldagents;

select agent_name from oldagents;