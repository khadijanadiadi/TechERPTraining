--SELECT 
--		username, 
--		default_tablespace, 
--		profile, 
--		authentication_type
--	FROM
--		dba_users 
--	WHERE 
--		account_status = 'OPEN'
--	ORDER BY
--		username;

--GRANT create session TO c##erpuser;
--GRANT create table TO  c##erpuser;
--GRANT create view TO c##erpuser;
--GRANT create any trigger TO c##erpuser;
--GRANT create any procedure TO c##erpuser;
--GRANT create sequence TO c##erpuser;
--GRANT create synonym TO c##erpuser;
--GRANT ALL PRIVILEGES TO c##erpuser;
--
--GRANT CONNECT TO c##erpuser;
--GRANT RESOURCE TO c##erpuser;
--GRANT DBA TO c##erpuser;

--connect c##erpuser/root

CREATE TABLE BRANCH (
		BRANCHNO	INT CONSTRAINT PK_BRANCH_BRANCHNO PRIMARY KEY,
		BRANCHNAME  VARCHAR2(20) NOT NULL,
		LOCATION    VARCHAR2(20) NOT NULL 
	);

CREATE TABLE BRANCH (
		BRANCHNO	INT CONSTRAINT PK_BRANCH_BRANCHNO PRIMARY KEY,
	
CREATE TABLE DEPT    (
		DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
		DNAME VARCHAR2(14), 
		BRANCHNO	INT CONSTRAINT FK_DEPT_BRANCHNO REFERENCES BRANCH
	) ;
ALTER TABLE DEPT
    MODIFY DNAME VARCHAR2(14) NOT NULL UNIQUE;


	CREATE TABLE EMP(
		EMPNO 		NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,
		ENAME 		VARCHAR2(10),
		JOB 		VARCHAR2(9),
		MGR 		NUMBER(4),
		HIREDATE 	DATE,
		SAL 		NUMBER(7,2),
		COMM 		NUMBER(7,2),
		DEPTNO 		NUMBER(2) CONSTRAINT FK_EMP_DEPTNO REFERENCES DEPT,
		BRANCHNO 	INT CONSTRAINT FK_EMP_BRANCHNO REFERENCES BRANCH
	);   
    
    INSERT INTO BRANCH VALUES 	(101,'Geneva','NEW YORK');
	INSERT INTO BRANCH VALUES 	(102,'Geneva','NEW YORK');
	INSERT INTO BRANCH VALUES 	(103,'CHICAGO','CHICAGO');
	INSERT INTO BRANCH VALUES 	(104,'CHICAGO','CHICAGO');
	INSERT INTO BRANCH VALUES 	(105,'Kingston','NEW YORK');
	INSERT INTO BRANCH VALUES 	(106,'Kingston','NEW YORK');
    
    INSERT INTO DEPT VALUES	(10,'ACCOUNTING',101);
	INSERT INTO DEPT VALUES        (20,'RESEARCH',103);
	INSERT INTO DEPT VALUES	(30,'SALES',105);
	INSERT INTO DEPT VALUES	(40,'OPERATIONS',106);
    
INSERT INTO EMP VALUES(7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20,102);
INSERT INTO EMP VALUES(7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30,102);
INSERT INTO EMP VALUES(7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30,103);
INSERT INTO EMP VALUES(7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20,104);
INSERT INTO EMP VALUES(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30,105);
INSERT INTO EMP VALUES(7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30,105);
INSERT INTO EMP VALUES(7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10,102);
INSERT INTO EMP VALUES(7788,'SCOTT','ANALYST',7566,to_date('13-JUL-87')-85,3000,NULL,20,103);
INSERT INTO EMP VALUES(7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,NULL,101);
INSERT INTO EMP VALUES(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30,104);
INSERT INTO EMP VALUES(7876,'ADAMS','CLERK',7788,to_date('13-JUL-87')-51,1100,NULL,20,105);
INSERT INTO EMP VALUES(7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30,103);
INSERT INTO EMP VALUES(7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20,105);
INSERT INTO EMP VALUES(7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10,104);
INSERT INTO EMP VALUES(7901,'JOHN_SMITH','CLERK',7698,to_date('23-1-1982','dd-mm-yyyy'),3000,NULL,30,104);

COMMIT;
 
 
-- Display all records from dept
--	FROM dept; => taking all records
--	SELECT deptno,dname,branchno  => selected column information=> Projection
	SELECT deptno,dname FROM dept; 
    -- => Projection SELECT * => data from every column	   	
    
--    9. Display all records from branch
    
    SELECT * FROM branch;
    SELECT branchno, branchname,location FROM branch;
--10. Display all records from emp

SELECT * FROM emp;
    SELECT empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno  FROM emp;
    
    
--    11. Sort recrods using order by clause

-- 11.1 Sort the all employees details on empno

SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno  
FROM
emp
ORDER BY 
empno;

-- 11.2 Sort the all employees details on department wise

SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno  
FROM
    emp
ORDER BY
    deptno;

-- 11.3 Sort the all employees details as per department by emp no
--empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno  

SELECT 
    deptno,empno,ename,job,mgr,hiredate,sal,comm,branchno    
FROM
    emp
ORDER BY
    deptno,empno;    


-- 11.4 Sort the all employees details as per department in ascending by emp no descending

SELECT 
    deptno,empno,ename,job,mgr,hiredate,sal,comm,branchno    
FROM
    emp
ORDER BY
    deptno,empno DESC;

-- 11.5 Sort the all employees details as per department no, salary

SELECT
    deptno,empno,ename,job,mgr,hiredate,sal,comm,branchno
FROM 
    emp
ORDER BY
    deptno,sal;

-- 11.6 Sort the all employees details as per salary

SELECT 
    deptno,empno,ename,job,mgr,hiredate,sal,comm,branchno
FROM 
    emp
ORDER BY
    sal;
-- ################################################################
-- 12. WHERE CLAUSE
-- Where caluse with in,not in, is null, is not null, between, not between
-- Where caluse with Comparison Operator (<,>,<=,>=,=,<>,!=)
-- Where caluse with Logical Operator (AND,OR,NOT)
-- ################################################################
-- ################################################################
-- 12.1 Display all emp working in deptno 10
-- ################################################################
SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM
    emp
WHERE deptno=10;
-- ################################################################
-- 12.2 Display employee no,name working department no 10
-- ################################################################
SELECT 
    empno,ename,deptno
FROM
    emp
WHERE deptno=10;
-- ################################################################
-- 12.3 Display all employees working in department no 10 or 20
-- using OR
-- using IN
-- ################################################################
SELECT 
    empno,ename,deptno
FROM
    emp
WHERE 
    deptno=10 or deptno=20;
--
SELECT 
    empno,ename,deptno
FROM
    emp
WHERE 
    deptno IN (10,20);

-- ################################################################
-- 12.4 Display all employees not working in 10,20,30
-- ################################################################
SELECT
    empno,ename,deptno
FROM
    emp
WHERE
    deptno not in (10,20,30);
-- ################################################################
-- 12.4 Display all employees not working in any department i.e. deptno is null
-- ################################################################

SELECT
    empno,ename,deptno
FROM
    emp
WHERE
    deptno is null;
-- ################################################################
-- 12.4 Display all employees who is working in some department i.e. deptno not null
-- ################################################################

SELECT
    empno,ename,deptno
FROM
    emp
WHERE
    deptno is not null;
    -- Below query retuns zero records as we can't compare null with values
SELECT 
    empno,ename,comm
FROM 
    emp
WHERE 
    deptno=30 and comm not in (null,0);-- comm!=null or comm!=0

-- ################################################################
-- 12.8 Display all employees not earning any commission
-- ################################################################
SELECT
    empno,ename,comm
FROM
    emp
WHERE 
    comm is null or comm = 0;

-- ################################################################
-- 12.9 Display all employees earning salary in range 1000 to 3000 including boundry values
-- ################################################################

SELECT
    empno,ename,sal
FROM
    emp
WHERE
    sal>=1000 and sal<=3000
ORDER BY
    sal;
    
    

SELECT
    empno,ename,sal
FROM
    emp
WHERE
    sal BETWEEN 1000 AND 3000
ORDER BY
    sal;



-- ################################################################
-- 12.10 Display all employees earning salary in range 1000 to 3000 excluding boundry values
-- ################################################################
SELECT
    empno,ename,sal
FROM
    emp
WHERE
    sal>1000 and sal<3000
ORDER BY
    sal;

SELECT
    empno,ename,sal
FROM
    emp
WHERE
    sal BETWEEN 1001 AND 2999
ORDER BY
    sal;

SELECT
    empno,ename,sal
FROM
    emp
WHERE
    sal BETWEEN (1000+1) AND (3000-1)
ORDER BY
    sal;


-- ################################################################
-- 12.11 Display all employees earning salary not in range 1000 to 3000
-- ################################################################
SELECT
    empno,ename,sal
FROM
        emp
WHERE
    sal not between 1000 and 3000
ORDER BY
    sal;


-- ################################################################
-- 12.12 Display all employees earning 5000salary 
-- ################################################################
SELECT
    empno,ename,sal
FROM
    emp
WHERE
    sal=5000
ORDER BY 
    sal;


	

-- ################################################################
-- 13. Where caluse with like
--     WHERE WITH ESCAPE Clause
--   = comparison ->equality-> exact match
-- ################################################################
-- ################################################################
-- 13.1 Display all details of SMITH
-- ################################################################
SELECT
    empno,ename
FROM
    emp
WHERE
    ename='SMITH'
ORDER BY
    ename;
--    below query won't return any record as data saved in a cell is Case Sensetive
SELECT
    empno,ename
FROM
    emp
WHERE
    ename='Smith'
ORDER BY
    ename;    

-- ################################################################
-- 13.2 Display all details of EMPLOYEE who's name starts with S
-- ################################################################
SELECT
    empno,ename
FROM
    emp
WHERE
    ename LIKE 'S%'
ORDER BY
    ename;    

-- ################################################################
-- 13.3 Display all details of EMPLOYEE who's name ends with S
-- ################################################################
SELECT
    empno,ename
FROM
    emp
WHERE
    ename LIKE '%S'
ORDER BY
    ename;    

-- ################################################################
-- 13.4 Display all details of EMPLOYEE who's name contains LL
-- ################################################################
SELECT
    empno,ename
FROM
    emp
WHERE
    ename LIKE '%LL%'
ORDER BY
    ename;    


-- ################################################################
-- 13.5 Display all details of EMPLOYEE who's name contains _
-- ################################################################
SELECT
    empno,ename
FROM
    emp
WHERE
    ename LIKE '%\_%' 
    
ORDER BY
    ename;    
    
    -- ################################################################
-- 14. Aggregate Function max,min,sum,avg,count 
--     SUM
--     AVG
--     COUNT
--     MAX
--     MIN
-- ################################################################
-- 14.1 Display count of employees
-- count(*) including null values 
-- ################################################################
SELECT
    COUNT(*)
FROM 
    emp;
-- ################################################################
-- 14.2 Display count of employees WORKING IN SOME DEPT
-- count(deptno) excludes the null vlaue 
-- ################################################################
SELECT
    COUNT(*),COUNT(deptno),COUNT(EMPNO)
FROM
    emp;
-- ################################################################
-- 14.3 Display max,min,sum,avg salary of employees
-- ################################################################
SELECT
    MIN(sal),MAX(sal),SUM(sal),AVG(sal),COUNT(sal)
FROM 
    emp;
    
    -- 15.1 Display department wise count of employees
-- ################################################################
SELECT
        deptno,count(empno)
FROM
        emp
GROUP BY 
        deptno
ORDER BY 
        deptno;
        
       -- 15.2 Display department wise max,min,avg salary
-- ################################################################
SELECT
    deptno,min(sal),max(sal),avg(sal),sum(sal)
FROM
    emp
GROUP BY
        deptno
ORDER BY 
        deptno; 
        
        -- 15.3 Display department wise max,min,avg salary where avg(sal)<2500
-- ################################################################
SELECT 
    deptno,min(sal),max(sal),avg(sal),sum(sal)
FROM
        emp
GROUP BY
        deptno
HAVING 
        avg(sal)<2500
ORDER BY
        deptno;
-- 16. Special functions nvl() 
-- If comm is null display 0
-- ################################################################
SELECT
    empno,ename,sal,comm, sal+comm
FROM 
    emp
ORDER BY
    empno;

-- correct solution
SELECT
    empno,ename,sal,comm, sal+nvl(comm,0)
FROM 
    emp
ORDER BY
    comm;
