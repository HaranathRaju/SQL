CREATE table claims (
    claim_id INT PRIMARY KEY,
    policy_number VARCHAR(20),
    claim_date DATE,
    claim_amount DECIMAL(10,2)
);

INSERT INTO Claims VALUES
(1, 'POL123', '2017-05-10', 15000.00),
(2, 'POL124', '2019-02-14', 20000.00),
(3, 'POL125', '2022-08-30', 12000.00);

DELETE from claims where claim_date<DATEADD(YEAR,-5,GETDATE());