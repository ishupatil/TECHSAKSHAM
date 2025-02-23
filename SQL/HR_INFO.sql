CREATE DATABASE HR;

CREATE
 TABLE HR.EMP
(
    EMP_NO INT,
    E_NAME VARCHAR(255),
    JOB VARCHAR(255),
    MGR INT,
    HIRE_DATE DATE,
    SAL DECIMAL(10,2),
     COMM DECIMAL(10,2),
    DEPT_NO INT
);

INSERT INTO HR.EMP VALUES
(7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800.00, NULL, 20),
    (7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600.00, 300.00, 30),
    (7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250.00, 500.00, 30),
    (7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975.00, NULL, 20),
    (7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250.00, 1400.00, 30),
    (7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850.00, NULL, 30),
    (7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450.00, NULL, 10),
    (7788, 'SCOTT', 'ANALYST', 7566, '1982-12-09', 3000.00, NULL, 20),
    (7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000.00, NULL, 10),
    (7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500.00, 0.00, 30),
    (7876, 'ADAMS', 'CLERK', 7788, '1983-01-12', 1100.00, NULL, 20),
    (7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950.00, NULL, 30),
    (7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000.00, NULL, 20),
    (7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300.00, NULL, 10);

SELECT * FROM HR.EMP;

CREATE TABLE HR.DEPT(
DEPT_ID INT,
D_NAME VARCHAR(255),
LOC VARCHAR(255));

INSERT INTO HR.DEPT VALUES
(10,'ACCOUNTING','NEW YORK'),
(20,'RESEARCH','DALLAS'),
(30,'SALES','CHICAGO'),
(40,'OPERATIONS','BOSTON');

SELECT * FROM HR.DEPT;

CREATE DATABASE CUSTOMER_ORDERS;
USE CUSTOMER_ORDERS;

SELECT * FROM hr.emp 
WHERE 
    SAL BETWEEN 1000 AND 3000
    OR (JOB IN ('SALESMAN', 'CLERK') AND COMM = 1400);
    
    -- IN 
select * from hr.emp where job = 'CLERK' or job = 'SALESMAN';
select * from hr.emp where job in ('CLEARK','SALESMAN');
select * from hr.emp where sal in (800,1250,1600);


-- Copy EMP table
CREATE TABLE assignment_schema.emp AS
SELECT * FROM hr.emp;

-- Copy DEPT table
CREATE TABLE assignment_schema.dept AS
SELECT * FROM hr.dept;
SELECT * FROM hr.emp;

-- 1. Create a table in the HR schema called SALES_PEOPLE. The structure of this table should be the same as the EMP table... with one difference: 
-- Instead of the SAL and COMM columns hava a column called TOTAL_PAY
CREATE TABLE HR.SALES_PEOPLE AS 
SELECT EMP_NO, 
       E_NAME, 
       JOB, 
       MGR, 
       HIRE_DATE, 
       (COALESCE(SAL, 0) + COALESCE(COMM, 0)) AS TOTAL_PAY, 
       DEPT_NO 
FROM  hr.emp;
SELECT * FROM HR.SALES_PEOPLE;

--  Insert records into the SALES_PEOPLE table from the EMP table with only the records where the job is SALESMAN. (SAL + COMM = TOTAL_PAY)
DELETE FROM HR.SALES_PEOPLE WHERE JOB <>"SALESMAN" 