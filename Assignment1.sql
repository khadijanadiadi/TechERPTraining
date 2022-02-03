create user c##assignment identified by root;

CREATE TABLE BRANCH (
		BRANCHNO	INT CONSTRAINT PK_BRANCH_BRANCHNO PRIMARY KEY,
		BRANCHNAME  VARCHAR2(20) NOT NULL,
		LOCATION    VARCHAR2(20) NOT NULL 
	);

	
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
INSERT INTO EMP VALUES(7980,'MILLER','CLERK',7782,to_date('23-1-1980','dd-mm-yyyy'),1300,NULL,10,104);
INSERT INTO EMP VALUES(7981,'JOHN_SMITH','CLERK',7698,to_date('23-1-1979','dd-mm-yyyy'),3000,NULL,30,104);


--1	 Display all the information of the EMP table?

SELECT  * FROM dept;
    
SELECT deptno,dname,branchno
FROM dept;

--2  Display unique Jobs from EMP table?
SELECT DISTINCT job
FROM emp ;

--3 List the emps in the asc order of their Salaries?

SELECT ename, sal
FROM emp 
ORDER BY sal;

--4 List the details of the emps in asc order of the Dptnos and desc of Jobs?

SELECT empno,ename,job, mgr,hiredate,sal,comm,deptno,branchno
FROM emp
ORDER BY deptno, job DESC;

COMMIT;

--5 Display all the unique job groups in the descending order?

SELECT DISTINCT job
FROM emp
ORDER BY  job DESC;

--6 Display all the details of all ‘Mgrs’

SELECT empno,ename,job, mgr,hiredate,sal,comm,deptno,branchno
FROM emp
WHERE job = 'MANAGER';

--7 List the emps who joined before 1981

SELECT empno,ename,job, mgr,hiredate,sal,comm,deptno,branchno
FROM emp
WHERE hiredate < ('1-1-1981');


 
--8  Display the Empno, Ename, job, Hiredate, Exp of all Mgrs

SELECT empno, ename, job, hiredate, ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE)/12,2) AS exp 
FROM emp
WHERE job = 'MANAGER';

--9 List the Empno, Ename, Sal, Exp of all emps working for Mgr 7369
SELECT empno, ename, job, hiredate, ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE)/12,2) AS exp 
FROM emp
WHERE  mgr = '7369';

--10 Display all the details of the emps whose Comm  Is more than their Sal
SELECT empno,ename,job, mgr,hiredate,sal,comm,deptno,branchno
FROM emp
WHERE comm > sal;

--11 List the emps along with their Exp and Daily Sal is more than Rs 100
SELECT empno, ename, job, hiredate, ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE)/12,2) AS exp,sal, ROUND (sal/26,2) as Daily_Sal 
FROM emp
WHERE sal/26 >'100'
ORDER BY empno;

--12 List the emps who are either ‘CLERK’ or ‘ANALYST’ in the Desc order
SELECT empno, ename, job, hiredate, ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE)/12,2) AS exp,sal 
FROM emp
WHERE job = 'CLERK' OR job= 'ANALYST'
ORDER BY job desc;

--13 List the emps who joined on 1-MAY-81,3-DEC-81,17-DEC-81,19-JAN-80 in asc order of seniority
SELECT empno, ename, job, hiredate, ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE)/12,2) AS exp,sal 
FROM emp
WHERE hiredate = '1-MAY-81' OR hiredate= '3-DEC-81' or hiredate='17-DEC-81' or hiredate='19-JAN-80'
ORDER BY EXP ;

--14 List the emp who are working for the Deptno 10 or20
SELECT DEPTNO, empno, ename, job, hiredate, ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE)/12,2) AS exp,sal 
FROM emp
WHERE DEPTNO = '10' OR DEPTNO = '20'
ORDER BY deptno;

--15 List the emps who are joined in the year 81
SELECT DEPTNO, empno, ename, job, hiredate, ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE)/12,2) AS exp,sal 
FROM emp
WHERE to_char(hiredate,'yyyy') = 1981;


--16 List the emps Who Annual sal ranging from 22000 and 45000

SELECT DEPTNO, empno, ename, job, hiredate, ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE)/12,2) AS exp,sal 
FROM emp
WHERE sal BETWEEN '2200' AND '45000';

--17 List the Enames those are having five characters in their Names
SELECT DEPTNO, empno, ename,LENGTH(ename), job, hiredate, ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE)/12,2) AS exp,sal 
FROM emp
WHERE LENGTH(ename) = 5;

--18 List the Enames those are starting with ‘S’ and with five characters
SELECT DEPTNO, empno, ename,LENGTH(ename), job, hiredate, ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE)/12,2) AS exp,sal 
FROM emp
WHERE  LENGTH(ename) = 5 AND ename like 'S%';
--19 List the emps those are having four chars and third character must be ‘r’

SELECT DEPTNO, empno, ename,LENGTH(ename), job, hiredate, ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE)/12,2) AS exp,sal 
FROM emp
WHERE  LENGTH(ename) = 4 AND ename like '__R%';
-- 20 List the Five character names starting with ‘S’ and ending with ‘H’
SELECT DEPTNO, empno, ename,LENGTH(ename), job, hiredate, ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE)/12,2) AS exp,sal 
FROM emp
WHERE  LENGTH(ename) = 5 AND ename like 'S%H%';

-- 21  List the emps who joined in January
SELECT DEPTNO, empno, ename, job, hiredate, ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE)/12,2) AS exp,sal 
FROM emp
WHERE to_char(hiredate,'mm') = 1;

--22 List the emps whose names having a character set ‘ll’ together
SELECT DEPTNO, empno, ename,LENGTH(ename), job, hiredate, ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE)/12,2) AS exp,sal 
FROM emp
WHERE  ename like '%LL%';

--23 List the emps who does not belong to Deptno 20
SELECT DEPTNO, empno, ename,LENGTH(ename), job, hiredate, ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE)/12,2) AS exp,sal 
FROM emp
WHERE deptno <> 20;
--24 List all the emps except ‘PRESIDENT’ & ‘MGR” in asc order of Salaries
SELECT DEPTNO, empno, ename,LENGTH(ename), job, hiredate, ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE)/12,2) AS exp,sal 
FROM emp
WHERE job NOT IN ('PRESIDENT','MANAGER')
ORDER BY sal;

--25 List the emps whose Empno not starting with digit 78
SELECT DEPTNO, empno, ename,LENGTH(ename), job, hiredate, ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE)/12,2) AS exp,sal 
FROM emp
WHERE empno not like '78%';

--26 List the emps who are working under ‘MGR’

SELECT DEPTNO, empno, ename,LENGTH(ename), job, hiredate, MGR,sal 
FROM emp
WHERE mgr in(select empno from emp where job='MANAGER');
--27 List the emps who joined in any year but not belongs to the month of March
SELECT DEPTNO, empno, ename, job, hiredate, ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE)/12,2) AS exp,sal 
FROM emp
WHERE to_char (hiredate,'mm') not like '03' OR to_char (hiredate,'mm') not like '3';
--28 List all the Clerks of Deptno 20

SELECT DEPTNO, empno, ename, job, hiredate,sal 
FROM emp
WHERE  deptno = '20' AND job = 'CLERK';

--29 List the emps of Deptno 30 or 10 joined in the year 1981

SELECT DEPTNO, empno, ename, job, hiredate, ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE)/12,2) AS exp,sal 
FROM emp
WHERE deptno in (30,10) AND to_char(hiredate,'yyyy') = 1981;

--30 Display the details of SMITH
SELECT *
FROM emp
WHERE ename = 'SMITH';

--31 Display the location of SMITH
SELECT location FROM branch WHERE branchno= (SELECT  branchno FROM emp WHERE ename = 'SMITH');

--32 List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annsal
SELECT empno, ename, sal,round((sal/26),2) as Daily_sal, (sal*12) as annual_Sal FROM emp ORDER BY annual_Sal;

COMMIT;


