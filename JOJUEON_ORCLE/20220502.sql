--조인 : 여러 테이블을 하나의 테이블 처럼 사용하는 조인
SELECT * 
FROM EMP,DEPT
ORDER BY EMPNO;
EMP * DEPT =48
12* 4 =48
조건업이 출력시 앞에 테이블 개수와 테이블 개수 곱으로 출력


--조인시 조건을 반드시 넣는 것이 좋다.
SELECT * 
FROM emp, dept 
WHERE emp.deptno = dept.deptno
order by empno;

SELECT * 
FROM emp.empNO, emp.dept , emp.JOB, emp.HIREDATE,emp. DEPTNO, DEPT.DNAME,emp.LOC
WHERE emp. deptno = dept. deptno
order by empno;

--테이블 이름에 별칭 사용
SELECT E.empNO, E.dept , E.job, E.hiredate, E.deptno, E.dname, E.loc
FROM emp E, dept D
WHERE E. deptno = D. deptno               --emp테이블은 E로 별칭, dept 테이블은 D로 별칭
order by empno;


--MYSQL
SELECT *
 FROM HOIN DEPT D
 ON e.DEPTNO = d.DEPTNO
 ORDER BY E.empno
 
 --내부조인(inne JOIN)
 --외부조인(outer JOIN) : LEFT OUTER JOIN,RIGHT OUTER JOIN,FULL OUTER JOIN

--내부조인
--등가조인 : 테이블을 연결한 후 에 출력 핵을 각 테이블의 특정 열에 일치한 데이터를 기준으로 선정하는 방식 : DEPTNO 
SELECT E.EMPNO, E.ENAME, D.DEPTNO,D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;
ORDER BY D.DEPTNO, E.EMPNO;

SELECT E.EMPNO, E.ENAME, D.DEPTNO,D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND SAL >= 3000;

-- EMP 테이블 별칭을 E로, DEPT 테이블 별칭은 D로 하여 다음과 같이 등가 조인을 했을떄 급여가
--2500 이하이고 사원 번호가 9999 이하인 사원의 정보가 출력되도록 sql 문 코드를 작성 하시오.
--출력칼럼 : E.EMPNO, E.ENAME, SAL ,D.DEPTNO,D.DNAME, D.LOC

SELECT E.EMPNO, E.ENAME, D.DEPTNO,D.DNAME, D.LOC , E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.SAL <=2500
AND E.ENPNO <=9999;

--비등가 조인 : 등가 조인 방식 외의 방식
SELECT * FROM EMP;
SELECT * FROM SALGRADE;

--SELECT *
--FROM EMP E,SALGRADE S
--WHERE E.SAL >= LOSAL or E.SAL <=HISAL;

SELECT *
FROM EMP E,SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;

--자체조인 : SELF JOIN
SELECT *FROM EMP;

--EMP에서 자신의 직속상관의 이름을 알고 싶다.
SELECT E1.EMPNO AS 사원번호, E1.ENAME AS 사원이름, E1.MGR AS 직속상관번호, E2.ENAME AS 사원직속상관이름
FROM EMP E1, EMP E2
WHERE  E1.MGR = E2.EMPNO;                 --조인 사용시 조건 : 서로 다른 테이블을 매칭 시켜야 한다.

--KING 사원 까지 출력하고 싶다.
왼쪽 외부 조인(LEFT OUTER JOIN) : 왼쪽 테이블의 항목(열)을 전체 출력
--직속상관이 있는 직원가 직속상관이 없는 직원도 출력
SELECT E1.EMPNO AS 사원번호, E1.ENAME AS 사원이름, E1.MGR AS 직속상관번호, E2.ENAME AS 사원직속상관이름
FROM EMP E1, EMP E2
WHERE  E1.MGR = E2.EMPNO(+); 

오른쪽 외부 조인(RIGHT OUTER JOIN) : 오른쪽 테이블의 항복(DUF)을 전체 출력
--직속상관이 있는 직워노가 직속상관이 없는 직원도 출력
SELECT E1.EMPNO AS 사원번호, E1.ENAME AS 사원이름, E1.MGR AS 직속상관번호, E2.ENAME AS 사원직속상관이름
FROM EMP E1, EMP E2
WHERE  E1.MGR(+) = E2.EMPNO; 

--SQL-99 표준 문법으로 조인
--NATURAL JOIN : 등가 조인- 내부조인 :같은 조건인 부분을 찾아서 자동으로 조인
SELECT E.EMPNO , E.ENAME , E.JOB, E.MGRM, E.HIREDATE, E.SAL, E.COMM
D.DEPTNO, D.DNAME, D.LOC
FORM EMP E NATURAL JOIN DEPT D
ORDER BY DEPTNO , E.EMPNO;

--JOIN - USING : 조인 되는 항목을 지정
FROM TABLE1 JOIN TABLE2 USING(조인에 사용할 기준열)

SELECT E.EMPNO , E.ENAME , E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM
       DEPTNO, D.DNAME, D.LOC
FORM EMP E JOIN DEPT D USING (DEPTNO)
ORDER BY DEPTNO , E.EMPNO;

--JOIN - ON : 조인 되는 조건을 지정
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM,
       E.DEPTNO, D.DNAME, D.LOC
FORM EMP E JOIN DEPT D USING (DEPTNO)
ORDER BY DEPTNO , E.EMPNO;

--OUTER JOIN
--LEFT OUTER JOIN
SELECT E1.EMPNO AS 사원번호, E1.ENAME AS 사원이름, E1.MGR AS 직속상관번호, E2.ENAME AS 사원직속상관이름
FROM EMP E1 LEFT OUTER JOIN EMP E2
ON (E1.MGR = E2.EMPNO);


--RIGHT OUTER JOIN
SELECT E1.EMPNO AS 사원번호, E1.ENAME AS 사원이름, E1.MGR AS 직속상관번호, E2.ENAME AS 사원직속상관이름
FROM EMP E1 RIGHT OUTER JOIN EMP E2
ON (E1.MGR = E2.EMPNO);

--오라클 3개이상의 테이블 조인
FROM TABLE1, TABLE2, TABLE3
WHERE TABLE1.COL = TABLE2.COL
AND TABLE2.COL = TABLE3.COL

--SQL-99조인 방식에서
FROM TABLE1, TABLE2, TABLE3
WHERE TABLE1.COL = TABLE2.COL
AND TABLE2.COL = TABLE3.COL

1. 
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E, DEPT D
 WHERE E.DEPTNO = D.DEPTNO
AND E.SAL>2000;

2.
SELECT D.DEPTNO, D.DNAME, 
TRUNC(AVG(E.SAL))AS "AVG_SAL",
MAX(E.SAL)AS "MAX_SAL", 
MIN(E.SAL)AS "MIN_SAL",
COUNT(*) AS "CNT"
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
GROUP BY D.DEPTNO, D.DNAME

3.
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
  FROM EMP E, DEPT D
 WHERE E.DEPTNO(+) = D.DEPTNO
ORDER BY D.DEPTNO, E.ENAME;


4.
SELECT D.DEPTNO, D.DNAME,
       E.EMPNO, E.ENAME, E.MGR, E.SAL, E.DEPTNO,
       S.LOSAL, S.HISAL, S.GRADE,
       E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
  FROM EMP E, DEPT D, SALGRADE S, EMP E2
 WHERE E.DEPTNO(+) = D.DEPTNO
   AND E.SAL BETWEEN S.LOSAL(+) AND S.HISAL(+)
   AND E.MGR = E2.EMPNO(+)
ORDER BY D.DEPTNO, E.EMPNO; 


-------------------------------------------------------------

--서브쿼리 :쿼리 안에 쿼리를 사용하는 구분 : SQL문을 실행하는데 필요한 데이터를 추가로 조회 하기 위해 SQL문 내부에서 사용하는 SELECT문을 의미

SELECT * FROM 테이블명 WHERE 비교 = (SELECT * FROM 테이블명2 WHERE 조건문)
INSERT INTO 테이블명1 VALUES (SELECT * FROM 테이블명2)

--사원 이름이 JONES인 사원의 급여출력
--JONES 보다 급여를 많이 받는 직원 급여출력
SELECT *
FROM EMP;

SELECT SAL
 FROM EMP
  WHERE ENAME ='JONES';    -2975
  
SELECT *
FROM EMP
WHERE SAL>2975;

--위 두개의 커리를 하나로 만들어줌

SELECT *
FROM EMP
WHERE SAL>(SELECT SAL
           FROM EMP
           WHERE ENAME = 'MARTIN');
           
--서브쿼리의 특징
--1.서브쿼리는 연산자와 같은 비교 또는 조회 대상의 오른쪾에 놓이면 괄호()로 묶어서 사용한다.
--2.특수한 몇몇의 경우를 제외한 대부분의 서브퀴리에서는 ORDER BY절을 사용할수 없다.
--3.서브퀘리의 SELECT절에 명시한 열은 메인쿼리의 비교대상과 같은 자료형과 같은 개수로 지정해야 한다.
--  즉,메인쿼리의 비교 대상 데이터가 하나라면 서브쿼리의 SELECT절 역시 같은 자료형인 열을 하나 지정해야 한다.
--4.서브쿼리에 있는 SELECT문의 결과 행 수는 함꼐 사용하는 메인쿼리의 연사자 종류와 호환 가능해야 한다.
--  예를 들어 메인퀘리에 사용한 연산자가 단 하나의 데이터로만 연산이 사능한 연산자라면 서브쿼리의 결과 행 수는 반드시 하나여야 한다/

--단일행 서브쿼리 : 비교 연산을 사용한 경우에는 서브 궈리의 결과가 하나만 지정 되어야 한다
>, >=, <, <=, =, <>, ^=, !=

--직원중 JONES직원보다 빨리 입사한 사원에 대해 조회
SELECT *
FROM EMP
WHERE HIREDATE < (SELECT HIREDATE 
                    FROM EMP
                      WHERE ENAME = 'JONES');
--다중행으로 입력을 하게 되면..
SELECT *
FROM EMP
WHERE HIREDATE < (SELECT HIREDATE 
                    FROM EMP
                      WHERE HIREDATE  > 1981/02/31);
--오류가 나기 때문에 하나만 써야 정상적인 결과가 나온다

--20번 부서에 속한 사원 중 전체 사원의 평균 급여보다 높은 급여를 받는 사원 정보와 소속부서 정보를 함께 조회하는 경우
SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DEPTNO, D.DNAME, D.LOC
FORM EMP E, DEPT D
WHERE E.DEPTNO =D.DEPTNO
AND E.DEPTNO = 20
AND E.SAL > SELECT AVG(SAL) FROM EMP);


--다중행 서브쿼리 :다중행 연산자 서브쿼리의 결과가 여러개가 나오는 서브쿼리
--닺우행 연산자 사용
--IN : 메인쿼리의 데이터가 서브쿼리의 결과 중 하나라고 일치한 데이터가 있다면 True
--ANY, SOME : 메인쿼리의 조건식을 만족하는 서브쿼리의 결과가 하나 이상이면 True
--ALL : 메인쿼리의 조건식을 서브쿼리의 결과 모두가 만족하면 True
--EXISTS : 서브쿼리의 결과가 존재하면 (즉, 행이 1개 이상인 경우)True

--IN
SELECT *
FROM EMP
WHERE DEPTNO IN (20,30);

--각 부서별 최고 급여와 동일한 그여를 받는 사원 정보 출력하기
--각 부서별 최고 급여
--급여 = 각 부서별 최고 급여
SELECT MAX(SAL)
FROM EMP
GROUP BT DEPTNO;


SELECT *
FROM EMP
WHERE SAL in (SELECT MAX(SAL)
             FROM EMP
             GROUP BY DEPTNO);
             
--IN : 다중행 쿼리의 결과가 일치하는 항목만 출력


--ANY, SOME 연산자 : 서브쿼리 결과중 하나만 맞더라도 메인 퀴리 문의 결과를 출력

SELECT *
FROM EMP
WHERE SAL = SOME (SELECT MAX(SAL)
             FROM EMP
             GROUP BY DEPTNO);
             
-30번 부서 사원들의 최대 급여보다 적은 급여를 받는 사원 정보 출력
SELECT *
FROM EMP
WHERE SAL < ANY (SELECT SAL
                FROM EMP                    
                 WHERE DEPTNO = 30)
ORDER BY SAL, EMPNO;

SELECT MAX(SAL)
FROM EMP
WHERE DEPTNO = 30;

--30번 부서 사원들의 최소 급여보다 많은 급여를 받는 사원 정보 출력
SELECT *
FROM EMP
WHERE SAL > ANY (SELECT SAL
                FROM EMP                    
                 WHERE DEPTNO = 30)
                 
 --ALL연산 : 서브쿼리의 모든 결과가 조건식에 맞아야짐나 출력
 
 SELECT*
   FROM EMP
   WHERE SAL < ANY (SELECT MIN(SAL)
                FROM EMP
                  WHERE DEPTNO = 30);
                  
  SELECT*
   FROM EMP
   WHERE SAL < ALL (SELECT SAL
                FROM EMP
                  WHERE DEPTNO = 30);       
                  
--30번 부서의 최대 급여보다 더 많은 급여를 받는 사원 출력
 SELECT*
   FROM EMP
   WHERE SAL > ALL (SELECT SAL
                FROM EMP
                  WHERE DEPTNO = 30);
--EXISTS 연산자 : 서브쿼리 결과 과 존재하면 메인 쿼리가 다 출력, 존재하지 않는다면 메인쿼리 실행 X
SELECT*
  FROM EMP
  WHERE EXISTS (SELECT DNAME
                FROM DEPT
                WHERE DEPTNO = 10);
                
--비교할 열이 여러 개인 다중열 서브쿼리
--다중열 서브퀴리

SELECT *
FROM EMP
WHERE (DEPTNO, SAL)IN (SELECT DEPTNO, MAX(SAL)
                       FROM EMP
                         GROUP BY DEPTNO);

--FROM 절에 사용하는 서브쿼리와 WITH절
--인라인 뷰(inline view) : FROM 절에 사용하는 서브쿼리
--JOIN인데 서브쿼리 이용

SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
 FROM(SELECT * FROM EMP WHERE DEPTNO = 10) E10,
 (SELECT *FRON DEPT)D
 WHERE E10.DEPTNO = D.DEPTNO;
 
 WITH
 [별칭1] AS (SELECT문 1)
 [별칭1] AS (SELECT문 1),
 ..
 ..
 SELECT
 FROM 별칭1, 별칭2, 별칭3.....
 
 WITH
 E10 AS (SELECT * FROM EMO WHERE DEPTNO = 10),
 D   AS (SELECT * FROM DEPT)
 SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
 FROM E10, D 
 WHERE E10.DEPTNO = D.DEPTNO;
 
-- SELECT 절에 사용하는 서브쿼리
 SELECT EMPNO, ENAME, JOB, SAL, 
       (SELECT GRADE 
        FROM SALGRADE
        WHERE E.SAL BETWEEN LOSAL AND HISAL) AS "SALGRADE",
        DEPTNO,
        (SELECT DNAME
        FROM DEPT
        WHERE E.DEPTNO = DEPT.DEPTNO)AS DNAME
   FROM EMP E;
   
-- 테이블에 데이터 추가 : INSERT문

DDL(Date Defintion Language) : 데이터 정의어 :CREATE, ALTER, DROP, RENAME, TRUNCATE
DCL(Data Control language) : 데이터 제어어 : GRANT, REVOKE
DNL(Data manipulation language) : 데이터 조작어 : SELECT, INSERT, UPDATE, DELETE

--테스트 테이블 생성(DEPT_TEMP)
CREATE TABLE DEPT_TEMP
AS SELECT * FROM DEPT;    --<-테이블 복제 :칼럼 안에 설정된 기본키 같은 것은 복제가 되지 않는다.

--테이블 삭제
DROP TABLE 테이블 이름;

DESC DEPT_TEMP;
DESC DEPT;

SELECT * FROM DEPT_TEMP;
SELECT * FROM DEPT;

--테이블에 데이터 추가 : INSERT 문
INSERT INTO 테이블 이름[(열1, 열2, ......, 열N)생략가능]  --생략시에는 테이블에 컬럼 순서를 지켜
VALUES (열1에 들어갈 데이터, 열2에 들어갈 데이터, .....열N에 들어갈 데이터);

INSERT INTO DEPT_TEMP (DEPTNO,DNAME, LOC)
VALUES (50, 'DATABASE',SEOUL');

SELECT * FROM DEPT_TEMP;

-- INSERT 문 오류가 발생하는 경우
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
  VALUES (60, 'NETWORK', 'BUSAN', 'WRONG');

INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
  VALUES (600, 'BUSAN', 'WRONG');

INSERT INTO DEPT_TEMP (DNAME, DEPTNO, LOC)
  VALUES ('NETWORK', 60, 'BUSAN');

INSERT INTO DEPT_TEMP
  VALUES (70, 'OFFICE', 'DEAGU');

INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
  VALUES (80, 'WEB', NULL);
  
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
  VALUES (90, 'MOBIL','');  

INSERT INTO DEPT_TEMP (DEPTNO, LOC)
  VALUES (99, 'INCHEON');
  
SELECT * FROM DEPT_TEMP;  

-- 테이블에 날짜 데이터 입력하기
-- 테스트 테이블 생성 (EMP_TEMP) : EMP의 형식만 가져오기
CREATE TABLE EMP_TEMP
  AS SELECT *
       FROM EMP
       WHERE 1 <> 1;  -- 거짓 : 참(1)이 아닌 경우 실행 : 데이터는 가져오지 않음 : 컬럼명과 컬럼 형식만 가져오기

SELECT * FROM EMP_TEMP;

-- INSERT문으로 날짜 데이터 입력하기 (날짜 사이에 / 입력)
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
             VALUES (9999, '홍길동', 'PRESIDENT', NULL, '2001/01/01', 5000, 1000, 10);
       
SELECT * FROM EMP_TEMP;     

-- INSERT문으로 날짜 데이터 입력하기 (날짜 사이에 - 입력)
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
             VALUES (1111, '성춘향', 'MANAGER', 9999, '2001-01-05', 4000, NULL, 20);

SELECT * FROM EMP_TEMP;

-- INSERT문으로 날짜 데이터 입력하기 (날짜의 데이터 순서를 반대로 입력)
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
             VALUES (2111, '이순신', 'MANAGER', 9999, '07/01/2001', 4000, NULL, 20);
             
-- 날짜 (년/월/일, YYYY/MM/DD)             
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
             VALUES (2111, '이순신', 'MANAGER', 9999, 
             TO_DATE('07/01/2001', 'DD/MM/YYYY'), 
             4000, NULL, 20);

SELECT * FROM EMP_TEMP;

-- SYSDATE를 사용하여 날짜 데이터 입력하기 : 현재 시점을 기준으로 날짜를 입력
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
             VALUES (3111, '심청이', 'MANAGER', 9999, SYSDATE, 4000, NULL, 30);

SELECT * FROM EMP_TEMP;

-- 서브쿼리를 사용하여 한번에 여러 데이터 추가하기  : EMP 테이블에서 월급등급이 1인 사람의 데이터를 가져오기  
-- (입력 컬럼 수, 서브쿼리 컬럼수 동일, 형식도 동일)

INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
  SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, E.DEPTNO
    FROM EMP E, SALGRADE S
  WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
    AND S.GRADE = 1;

-- INSERT 문에서 서브쿼리를 사용할 때 유의할 점
-- 1. VLAUES 절은 사용하지 않는다.
-- 2. 데이터가 추가되는 테이블의 열의 개수와 서브쿼리의 열 개수가 일치해야 한다.
-- 3. 데이터가 추가되는 테이블의 자료형과 서브쿼리의 자료형이 일치해야 한다.


-- 테이블에 데이터 수정 : UPDATE문
-- 테스트 테이블 생성 (DEPT_TEMP2)
CREATE TABLE DEPT_TEMP2
  AS SELECT * FROM DEPT;
  
SELECT * FROM DEPT_TEMP2;  

-- UPDATE 기본 문  : UPDATE시 유의점 : WHERE 조건문 사용 권한
UPDATE [변경할 테이블]
SET [변경할 열1]=[데이터], [변경할 열2]=[데이터], ... [변경할 열N]=[데이터]
[WHERE 데이터를 변경할 대상 행을 선별하기 위한 조건];

UPDATE DEPT_TEMP2
  SET LOC = 'SEOUL';

SELECT * FROM DEPT_TEMP2;

ROLLBACK;  -- UPDATE나 DELETE 사용 이전으로 되돌리기

COMMIT;    -- UPDATE나 DELETE 실행을 완료 : 커밋 이후에는 ROLLBACK 되지 않음.

ROLLBACK - 트랙젝션 - COMMIT
이전 시점 - UPDATE, DELETE, INSERT - 이후로 진행

-- 데이터의 일부분만 수정 : WHERE 조건문 사용
UPDATE DEPT_TEMP2
  SET DNAME = 'DATABASE',
      LOC = 'SEOUL'
  WHERE DEPTNO = 40;
  
SELECT * FROM DEPT_TEMP2;  

-- 서브쿼리를 사용하여 데이터 수정하기 : 여러행을 수정, 일부분 수정하기
-- 서브쿼리로 데이터 일부분 수정하기
UPDATE DEPT_TEMP2
  SET (DNAME, LOC) = (SELECT DNAME, LOC
                        FROM DEPT
                        WHERE DEPTNO = 40)
WHERE DEPTNO = 40;

SELECT * FROM DEPT_TEMP2;  

UPDATE DEPT_TEMP2
  SET DNAME = (SELECT DNAME
                 FROM DEPT
                 WHERE DEPTNO = 40),
      LOC = (SELECT LOC
              FROM DEPT
              WHERE DEPTNO = 40)
WHERE DEPTNO = 40;

-- WHERE절에 서브쿼리를 사용하여 데이터를 수정
-- loc = 'seoul' 수정할 대상 DNAME = 'OPERATIONS' 

UPDATE DEPT_TEMP2
  SET LOC = 'SEOUL'
  WHERE DEPTNO = (SELECT DEPTNO
                    FROM DEPT_TEMP2
                    WHERE DNAME = 'OPERATIONS');
                    
SELECT * FROM DEPT_TEMP2;




-- 테이블에 데이터 삭제 : DELETE문 : DELETE 시 유의점 : WHERE 조건문 사용 권한
