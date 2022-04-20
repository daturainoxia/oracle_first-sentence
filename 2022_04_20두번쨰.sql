--테이블 목록 보기

SELECT * FROM tab;

--테이블 구조 보기
DESC BONUS;
DESC DEPT;
DESC EMP;
DESC SALGRDE;

SELECT * FROM BONUS;
SELECT * FROM DEPT;
SELECT * FROM EMP;
SELECT * FROM SALGRADE;

SELECT EMPNO, ENAME
FROM EMP;

--SELECT 명령에 표현식(리터널:literal)을 사용하여 출력하기
SELECT ENAME, 'GOOD MORNING~~!' AS "good Morning"
FROM EMP;

--표현식으로 it's deptno 출력하고자 한다.

SELECT DNAME,q'[ it's deptno :]'
FROM DEPT;

--중복을 제거해서 출력
SELECT DISTINCT deptno
     FROM emp;

--출력에 연결 연산자 사용: 하나의 칼럼처럼 출력
SELECT ENAME JOB
     FROM emp;
     
SELECT ENAME || JOB
     FROM emp;
          
--출력 : 사원명 's job is 직업명
SELECT ENAME, JOB
FROM EMP;

--결과 : SMITH 'S JOB IS CLERK
SELECT ENAME ||' ''s job is '|| JOB
FROM EMP;

SELECT * FROM STUDENT;
--연습문제
--1.Student 테이블에서 모든 학생의 이름과 ID ,채중을 아래와 같이 출력되게 해보세요
--컬럼 명은 ID AND WEIGHT
James seo's ID : 75true, WEIGHT IS 72KG

SELECT NAME ||'''s ID: '|| ID ||',WEIGHT is' || WEIGHT|| 'KG' AS "ID AND WEIGHT"
FORM student;


--2.EMP 테이블을 조회하여 모든 사람의 이름과 직업을 아래와 같이 출력되게 해보세요.
--컬럼 명은 NAME AND JOB
--SMITH(CLERK) , SMITH'CLERK'

SELECT ENAME ||'''s ENAME: '|| ENAME ||', JOB is' || JOB || '(CLERK)' AS "ENAME AND JOB"
FROM EMP;

--선생님 답
SELECT ENAME||'('||JOB||') , '||ENAME||''''||JOB||''''AS "NAME AND JOB"
FROM EMP;

--3.EMP 테이블을 조회하여 모든 사원의 이름과 급여를 아래와 같이 출력되게 해보세요.
--컬럼 명은 Name and sal
--SMITH'S sal is 800$

SELECT ENAME ||'''s SAL is ' || SAL || '$' AS "ENAME AND SAL"
FROM EMP;
--선생님 답
SELECT ENAME||'''S SAL IS $ '|| SAL AS"NAME and Sal"
FROM EMP;

--원하는 조건만 골라내기 - WHERE 절
SELECT [Cloumn or Expression]
FROM [table or view]
WHERE 원하는조건;

SELECT empno, ename
FROM emp
WHERE sal< 1000;

--조건문 주의 : 문자와 날짜를 조회하고 싶은 경우에는 반드시 해당 문자나 날짜에 작은 따옴표를 붙여야 한다.
--             검색하고자 하는 데이터의 대소문자 구분
SELECT empno, ename, sal
FROM emp
WHERE ename='SMITH';

SELECT ename, hiredate
FROM emp
WHERE ename='SMITH';

--년도 출력 : window 인 경우  년/월/일
--           linus 인 경우   일-월-년  17-DEC-80
            
SELECT empno, ename, hiredate
FROM emp
WHERE hiredate > '81/01/01';
            해ㅐㅇ
