desc emp;

select * from emp;

desc dept;

select * from dept;

desc salgrade;

select * from salgrade;

기본 SQL 구문
Select [조회할 열1 이름], [조회할 열1 이름], ......... ,[조회할 열N 이름
FROM [ 조회할 테이블 이름];
where [조건];

select * from emp;
select empno, ename, hiredate from emp;

select *
from emp empno 
where empno = 7566;


select empno, ename, hiredate
from emp 
where empno = 7566;

select empno, ename, hiredate
from emp 
where ename = 'SMITH';

SELECT DEPTNO
FROM EMP;

--중복제거 DISTINCT : 항목에서 중복 되는것 제거
SELECT DISTINCT DEPTNO
FROM EMP;

--열이 여러 개인 경우
--DISTINCT로 열 중복 제거하기
SELECT DISTINCT JOB, DEPTNO
FROM EMP;

--중복되는 열 제거 없이 그대로 출력
SELECT ALL JOB, DEPTNO
FROM EMP;

--연산식 + = * /

SELECT * FROM EMP;

SELECT ename, sal, sal*12+comm, comm
FROM emp;

SELECT ename, sal, sal+sal+sal+sal+sal+sal+sal+sal+sal+sal++comm, comm
FROM emp;

--칼럼명 변경 (별칭) AS  (


SELECT ename 사원명, sal "월급", sal*12+comm AS 연봉, comm AS "추가수당"
FROM emp;

SAL*12+COMM ANNSAL
SAL*12+COMM "ANNSAL"
SAL*12+COMM AS ANNSAL  --자주쓰는 문장
SAL*12+COMM AS "ANNSAL" --자주쓰는 문장

--원하는 순서로 출력 데이터를 정렬(SORT) ORDER BY
--오름차순 : ASCEMDING   : ASC
--내림차순 : DESCEMDING  : DESC
ORDER BY [칼럼명] ASC
ORDER BY [칼럼명] DESC

ORDER BY EMPNO ASC, ENAME DESC;

--ORDER BY 뒤에 ASC나 DESC 구문을 안적으면 자동으로 ASC가 붙는다. 자동으로 오름차순이 된다.

SELECT
    * FROM EMP
    ORDER BY JOB;

--사원번호 기준으로 오름차순 정렬 

SELECT
    * FROM EMP
    ORDER BY EMPNO ASC;

SELECT
    * FROM EMP
    ORDER BY EMPNO;
--급여 정렬
    
    SELECT
    * FROM EMP
    ORDER BY SAL DESC;

--각각의 열에 내림차순과 오름차순을 동시에 사용하기

SELECT * 
FROM EMP
ORDER BY DEPTNO ASC, SAL DESC;

--ORDER BY 같은 정렬의 경우 필요한 경우가 아니라면 사용하지 않는 것이 좋다.

--필요한 데이터만 출력하고자 할때 조건문 WERE 절
SELECT *
FROM EMP;

SELECT *
FROM EMP
WHERE DEPTNO = 30;

--사원번호가 7782인 사원 정보만 나오도록 코드를 작성

SELECT *
FROM EMP
WHERE EMPNO = 7782;

--사원번호가 7799인 사원 정보의 이름과 직업, 부서명만 나오도록 코드를 작성

SELECT ENAME,JOB,DEPTNO
FROM EMP
WHERE EMPNO = 7499;

--AND연산자,OR 연산자
--AND:조건이 다맞아야 출력
--OR:하나만 맞아도 출력

--부서번호가 30이고 직업이 SALESMAN인 사람만 출력(AND 조건-WHERE도 맞아야함)

SELECT
*FROM EMP
WHERE DEPTNO = 30
AND JOB = 'SALESMAN';

--사원번호가 7499이고 부사가 30인 사원 정보만 나오도록 SQL작성
SELECT *
FROM EMP
WHERE EMPNO = 7499
AND DEPTNO = 30;

--OR 연산자
SELECT *
FROM EMP
WHERE DEPTNO = 30
OR JOB = 'CLERK';

--부서 번호가 20이거나 직업이 SALESMAN인 사원 정보가 나오도록 SQL문장을 작성하시오.

SELECT *
FROM EMP
WHERE DEPTNO = 20
OR JOB=' SALESMAN ';

--SQL"문자"  : SELECT 칼러명"별칭"
--'문자'     : WHERE 칼럼명 = '문자열' <- 실제 데이터 비교

AMD: 132쪽에 대해 보고서를 제출하고, 06장 연습 문제도 풀어서 제출하세요. 둘다 만족
OR : 132쪽에 대해 보고서를 제출하거나, 06장 연습 문제도 풀어서 제출하세요. 하나만 만족

--산술연산자
--월급에 12개월을 곱해서 36000 연봉을 가진 사람에 대해 출력
SELECT *
FROM EMP
WHERE ASL * 12 = 36000;

--비교연산자

SELECT *
FROM EMP
WHERE SAL >= 3000;

--급여가 2500 이상이고 직업이 ANALYST 인 사원만 조회

SELECT*
FROM EMP
WHERE SAL >=2500, 
AND JOB= 'ANALYST';

--비교연산자 : 보통 숫자, 문자 비교 가능

SELECT *
FROM EMP
WHERE ENAME >= 'F';
--이름의 첫글자 F로 시작하고 F~Z로 이름이 시작되는 사람에 대해 출력

SELECT *
FROM EMP
WHERE ENAME <= 'FORZ';

--월급이 3000인 사람만 출력
SELECT *
FROM EMP
WHERE SAL = 3000;

--월급이 3000이 아닌 사람만 출력
SELECT *
FROM EMP
WHERE SAL !=3000;

SELECT *
FROM EMP
WHERE SAL <>3000;

SELECT *
FROM EMP
WHERE SAL ^=3000;

--논리 부정 연산자: NOT 참-> 거짓, 거짓-> 참
SELECT *
FROM EMP
WHERE NOT SAL !=3000;

--직업이 ㅡMANAGER이거나 SALESMAN 이거나 CLERK

SELECT *
FROM EMP
WHERE OR JOB ='MANAGER' 
OR JOB = 'SALESMAN'
OR JOB = 'CLERK';

--IN 연산자 : 동일한 컬럼에 여러개의 데이터를 비교하고자 할떄  하나씩 대입을 해서 비교
JOB IN('MANAGER', 'SALESMAN', 'CLERK');

SELECT *
FROM EMP
WHERE JOB IN ('MANAGER', 'SALESMAN', 'CLERK')

--직업이 MANAGER가 아니거나 SALESMAN이 아니거나 CLERK가 아닌 사원 출력

SELECT *
FROM EMP
WHERE JOB != 'MANAGER' 
 AND JOB ^= 'SALESMAN' 
AND JOB <> 'CLERK';


SELECT *
FROM EMP
WHERE JOB NOT IN ('MANAGER', 'SALESMAN', 'CLERK')

--IN을 사용해서 부서번호가 10,20인 사원정보만 출력

SELECT *
FROM EMP
WHERE DEPTNO IN (10,20)

--급여가 2000이상이고 3000 이하 인 사원정보만 출력

SELECT *
FROM EMP
WHERE SAL >= 2000
AND SAL <= 3000;

--비교범위:BETWEEN A AND B : 최소값 A 에서 부터 최대값 B 까지

SELECT *
FROM EMP
WHERE SAL BETWEEN 2000 AND 3000;

--문자열 비교 : LIKE 연산자와 와일드 카드

SELECT *
FROM EMP
WHERE EMAME LIKE 'FORD';

SELECT *
FROM EMP
WHERE EMAME LIKE 'S%';

--사원 이름에서 두번쨰 글자가 L인 사워만 출력
SELECT *
FROM EMP
WHERE ENAME LIKE '_L%';

--사원 이름에서 세번쨰 글자가 A인 사원만 출력
SELECT *
FROM EMP
WHERE ENAME LIKE '__A%';

--와일드
-- _ : 어떤 갑이든 상관없이 한개의 무자 데이터를 의미
-- % : 길이와 상관없이 (문자없는 경우도 포함) 모든 문자 데이터를 의미

--사원 이름에서 AM 이 포함되어 있는 사원 데이터만 출력
SELECT *
FROM EMP
WHERE ENAME LIKE '%AM%';

--사원 이름에서 AM 이 포함되어 있지 않는 사원 데이터만 출력
SELECT *
FROM EMP
WHERE ENAME NOT LIKE '%AM%';


--와일드 카드 : _, %
--A_A 
WHERE ENAME LIKE 'A_A' 이럴경우
AAA
ABA
ACA 가 나올수도 있다

WHERE ENAME LIKE 'A_A'
데이터 일부에 와일드카드 문자가 있는 경우 : ESCAPE 문 : 와일드 카드를 문자처럼 인식
WHERE ENAME LIKE'A|_A' ESCAPE'|';

--NULL
SELECT ENAME, SAL, SAL*12+COMM AS ANNSAL, COMM
FROM EMP;

SELECT*
FROM EMP
WHERE COMM IS NULL;

--사원중에서 직속 상관이 있는 사원만 출력
SELECT *
FROM EMP
WHERE MGR IS NULL;

--사원중에서 직속 상관이 없는 사원만 출력
SELECT *
FROM EMP
WHERE MGR IS NOT NULL;

--합집합 : UNION
SELECT EMPNO , ENAME, SAL, DEPTNO --동일
FROM EMP
WHERE DEPTNO = 10
UNION
SELECT EMPNO , ENAME, SAL, DEPTNO --동일 해야만 출력
FROM EMP
WHERE DEPTNO = 20;

--UNIOM 사용시 주의점
--칼럼갯수 같아야 된다.
--칼럼의 데이터 형태가 같아야 된다.

--칼럼의 갯수가 다를경우
SELECT EMPNO , ENAME, SAL, DEPTNO 
FROM EMP
WHERE DEPTNO = 10
UNION
SELECT EMPNO , ENAME, DEPTNO, SAL
FROM EMP
WHERE DEPTNO = 20;

-- 칼럼의 갯수가 동일하고 타입이 같고, 다른 칼럼 설정을 했을떄
SELECT EMPNO , ENAME, SAL, DEPTNO 
FROM EMP
WHERE DEPTNO = 10
UNION
SELECT EMPNO , ENAME, DEPTNO, SAL
FROM EMP
WHERE DEPTNO = 20;
--UNION 사용시 : 자동으로 중복에 대한 부분이 제거
SELECT EMPNO , ENAME, SAL, DEPTNO 
FROM EMP
WHERE DEPTNO = 10
UNION
SELECT EMPNO , ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10;

--UNIO 사용시 : 중복을 제거를 안하고 출력 하소자 할떼 : UNION ALL
SELECT EMPNO , ENAME, SAL, DEPTNO 
FROM EMP
WHERE DEPTNO = 10
UNION
SELECT EMPNO , ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10;

--교집합 : INTERSECT
--전체에 대한 내용을 출력하고 그중에서 필요한 부분을 출력
--RMP 테이블 전체 행을 조회한 첫번쨰 SELECT분의 결과에서 10번 부서에 있는 사원 데이터를 출력

SELECT EMPNO , ENAME, SAL, DEPTNO 
FROM EMP
INTERSECT
SELECT EMPNO , ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10;

--차집합 :MINUS : 중복삭제
--RMP 테이블 전체 행을 조회한 첫번쨰 SELECT분의 결과에서 10번 부서에 있는 사원 데이터를 제외하고 출력

SELECT EMPNO , ENAME, SAL, DEPTNO 
FROM EMP
MINUS
SELECT EMPNO , ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10;


