--���̺� ��� ����

SELECT * FROM tab;

--���̺� ���� ����
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

--SELECT ��ɿ� ǥ����(���ͳ�:literal)�� ����Ͽ� ����ϱ�
SELECT ENAME, 'GOOD MORNING~~!' AS "good Morning"
FROM EMP;

--ǥ�������� it's deptno ����ϰ��� �Ѵ�.

SELECT DNAME,q'[ it's deptno :]'
FROM DEPT;

--�ߺ��� �����ؼ� ���
SELECT DISTINCT deptno
     FROM emp;

--��¿� ���� ������ ���: �ϳ��� Į��ó�� ���
SELECT ENAME JOB
     FROM emp;
     
SELECT ENAME || JOB
     FROM emp;
          
--��� : ����� 's job is ������
SELECT ENAME, JOB
FROM EMP;

--��� : SMITH 'S JOB IS CLERK
SELECT ENAME ||' ''s job is '|| JOB
FROM EMP;

SELECT * FROM STUDENT;
--��������
--1.Student ���̺��� ��� �л��� �̸��� ID ,ä���� �Ʒ��� ���� ��µǰ� �غ�����
--�÷� ���� ID AND WEIGHT
James seo's ID : 75true, WEIGHT IS 72KG

SELECT NAME ||'''s ID: '|| ID ||',WEIGHT is' || WEIGHT|| 'KG' AS "ID AND WEIGHT"
FORM student;


--2.EMP ���̺��� ��ȸ�Ͽ� ��� ����� �̸��� ������ �Ʒ��� ���� ��µǰ� �غ�����.
--�÷� ���� NAME AND JOB
--SMITH(CLERK) , SMITH'CLERK'

SELECT ENAME ||'''s ENAME: '|| ENAME ||', JOB is' || JOB || '(CLERK)' AS "ENAME AND JOB"
FROM EMP;

--������ ��
SELECT ENAME||'('||JOB||') , '||ENAME||''''||JOB||''''AS "NAME AND JOB"
FROM EMP;

--3.EMP ���̺��� ��ȸ�Ͽ� ��� ����� �̸��� �޿��� �Ʒ��� ���� ��µǰ� �غ�����.
--�÷� ���� Name and sal
--SMITH'S sal is 800$

SELECT ENAME ||'''s SAL is ' || SAL || '$' AS "ENAME AND SAL"
FROM EMP;
--������ ��
SELECT ENAME||'''S SAL IS $ '|| SAL AS"NAME and Sal"
FROM EMP;

--���ϴ� ���Ǹ� ��󳻱� - WHERE ��
SELECT [Cloumn or Expression]
FROM [table or view]
WHERE ���ϴ�����;

SELECT empno, ename
FROM emp
WHERE sal< 1000;

--���ǹ� ���� : ���ڿ� ��¥�� ��ȸ�ϰ� ���� ��쿡�� �ݵ�� �ش� ���ڳ� ��¥�� ���� ����ǥ�� �ٿ��� �Ѵ�.
--             �˻��ϰ��� �ϴ� �������� ��ҹ��� ����
SELECT empno, ename, sal
FROM emp
WHERE ename='SMITH';

SELECT ename, hiredate
FROM emp
WHERE ename='SMITH';

--�⵵ ��� : window �� ���  ��/��/��
--           linus �� ���   ��-��-��  17-DEC-80
            
SELECT empno, ename, hiredate
FROM emp
WHERE hiredate > '81/01/01';
            �ؤ���
