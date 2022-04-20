desc emp;

select * from emp;

desc dept;

select * from dept;

desc salgrade;

select * from salgrade;

�⺻ SQL ����
Select [��ȸ�� ��1 �̸�], [��ȸ�� ��1 �̸�], ......... ,[��ȸ�� ��N �̸�
FROM [ ��ȸ�� ���̺� �̸�];
where [����];

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

--�ߺ����� DISTINCT : �׸񿡼� �ߺ� �Ǵ°� ����
SELECT DISTINCT DEPTNO
FROM EMP;

--���� ���� ���� ���
--DISTINCT�� �� �ߺ� �����ϱ�
SELECT DISTINCT JOB, DEPTNO
FROM EMP;

--�ߺ��Ǵ� �� ���� ���� �״�� ���
SELECT ALL JOB, DEPTNO
FROM EMP;

--����� + = * /

SELECT * FROM EMP;

SELECT ename, sal, sal*12+comm, comm
FROM emp;

SELECT ename, sal, sal+sal+sal+sal+sal+sal+sal+sal+sal+sal++comm, comm
FROM emp;

--Į���� ���� (��Ī) AS  (


SELECT ename �����, sal "����", sal*12+comm AS ����, comm AS "�߰�����"
FROM emp;

SAL*12+COMM ANNSAL
SAL*12+COMM "ANNSAL"
SAL*12+COMM AS ANNSAL  --���־��� ����
SAL*12+COMM AS "ANNSAL" --���־��� ����

--���ϴ� ������ ��� �����͸� ����(SORT) ORDER BY
--�������� : ASCEMDING   : ASC
--�������� : DESCEMDING  : DESC
ORDER BY [Į����] ASC
ORDER BY [Į����] DESC

ORDER BY EMPNO ASC, ENAME DESC;

--ORDER BY �ڿ� ASC�� DESC ������ �������� �ڵ����� ASC�� �ٴ´�. �ڵ����� ���������� �ȴ�.

SELECT
    * FROM EMP
    ORDER BY JOB;

--�����ȣ �������� �������� ���� 

SELECT
    * FROM EMP
    ORDER BY EMPNO ASC;

SELECT
    * FROM EMP
    ORDER BY EMPNO;
--�޿� ����
    
    SELECT
    * FROM EMP
    ORDER BY SAL DESC;

--������ ���� ���������� ���������� ���ÿ� ����ϱ�

SELECT * 
FROM EMP
ORDER BY DEPTNO ASC, SAL DESC;

--ORDER BY ���� ������ ��� �ʿ��� ��찡 �ƴ϶�� ������� �ʴ� ���� ����.

--�ʿ��� �����͸� ����ϰ��� �Ҷ� ���ǹ� WERE ��
SELECT *
FROM EMP;

SELECT *
FROM EMP
WHERE DEPTNO = 30;

--�����ȣ�� 7782�� ��� ������ �������� �ڵ带 �ۼ�

SELECT *
FROM EMP
WHERE EMPNO = 7782;

--�����ȣ�� 7799�� ��� ������ �̸��� ����, �μ��� �������� �ڵ带 �ۼ�

SELECT ENAME,JOB,DEPTNO
FROM EMP
WHERE EMPNO = 7499;

--AND������,OR ������
--AND:������ �ٸ¾ƾ� ���
--OR:�ϳ��� �¾Ƶ� ���

--�μ���ȣ�� 30�̰� ������ SALESMAN�� ����� ���(AND ����-WHERE�� �¾ƾ���)

SELECT
*FROM EMP
WHERE DEPTNO = 30
AND JOB = 'SALESMAN';

--�����ȣ�� 7499�̰� �λ簡 30�� ��� ������ �������� SQL�ۼ�
SELECT *
FROM EMP
WHERE EMPNO = 7499
AND DEPTNO = 30;

--OR ������
SELECT *
FROM EMP
WHERE DEPTNO = 30
OR JOB = 'CLERK';

--�μ� ��ȣ�� 20�̰ų� ������ SALESMAN�� ��� ������ �������� SQL������ �ۼ��Ͻÿ�.

SELECT *
FROM EMP
WHERE DEPTNO = 20
OR JOB=' SALESMAN ';

--SQL"����"  : SELECT Į����"��Ī"
--'����'     : WHERE Į���� = '���ڿ�' <- ���� ������ ��

AMD: 132�ʿ� ���� ������ �����ϰ�, 06�� ���� ������ Ǯ� �����ϼ���. �Ѵ� ����
OR : 132�ʿ� ���� ������ �����ϰų�, 06�� ���� ������ Ǯ� �����ϼ���. �ϳ��� ����

--���������
--���޿� 12������ ���ؼ� 36000 ������ ���� ����� ���� ���
SELECT *
FROM EMP
WHERE ASL * 12 = 36000;

--�񱳿�����

SELECT *
FROM EMP
WHERE SAL >= 3000;

--�޿��� 2500 �̻��̰� ������ ANALYST �� ����� ��ȸ

SELECT*
FROM EMP
WHERE SAL >=2500, 
AND JOB= 'ANALYST';

--�񱳿����� : ���� ����, ���� �� ����

SELECT *
FROM EMP
WHERE ENAME >= 'F';
--�̸��� ù���� F�� �����ϰ� F~Z�� �̸��� ���۵Ǵ� ����� ���� ���

SELECT *
FROM EMP
WHERE ENAME <= 'FORZ';

--������ 3000�� ����� ���
SELECT *
FROM EMP
WHERE SAL = 3000;

--������ 3000�� �ƴ� ����� ���
SELECT *
FROM EMP
WHERE SAL !=3000;

SELECT *
FROM EMP
WHERE SAL <>3000;

SELECT *
FROM EMP
WHERE SAL ^=3000;

--�� ���� ������: NOT ��-> ����, ����-> ��
SELECT *
FROM EMP
WHERE NOT SAL !=3000;

--������ ��MANAGER�̰ų� SALESMAN �̰ų� CLERK

SELECT *
FROM EMP
WHERE OR JOB ='MANAGER' 
OR JOB = 'SALESMAN'
OR JOB = 'CLERK';

--IN ������ : ������ �÷��� �������� �����͸� ���ϰ��� �ҋ�  �ϳ��� ������ �ؼ� ��
JOB IN('MANAGER', 'SALESMAN', 'CLERK');

SELECT *
FROM EMP
WHERE JOB IN ('MANAGER', 'SALESMAN', 'CLERK')

--������ MANAGER�� �ƴϰų� SALESMAN�� �ƴϰų� CLERK�� �ƴ� ��� ���

SELECT *
FROM EMP
WHERE JOB != 'MANAGER' 
 AND JOB ^= 'SALESMAN' 
AND JOB <> 'CLERK';


SELECT *
FROM EMP
WHERE JOB NOT IN ('MANAGER', 'SALESMAN', 'CLERK')

--IN�� ����ؼ� �μ���ȣ�� 10,20�� ��������� ���

SELECT *
FROM EMP
WHERE DEPTNO IN (10,20)

--�޿��� 2000�̻��̰� 3000 ���� �� ��������� ���

SELECT *
FROM EMP
WHERE SAL >= 2000
AND SAL <= 3000;

--�񱳹���:BETWEEN A AND B : �ּҰ� A ���� ���� �ִ밪 B ����

SELECT *
FROM EMP
WHERE SAL BETWEEN 2000 AND 3000;

--���ڿ� �� : LIKE �����ڿ� ���ϵ� ī��

SELECT *
FROM EMP
WHERE EMAME LIKE 'FORD';

SELECT *
FROM EMP
WHERE EMAME LIKE 'S%';

--��� �̸����� �ι��� ���ڰ� L�� ����� ���
SELECT *
FROM EMP
WHERE ENAME LIKE '_L%';

--��� �̸����� ������ ���ڰ� A�� ����� ���
SELECT *
FROM EMP
WHERE ENAME LIKE '__A%';

--���ϵ�
-- _ : � ���̵� ������� �Ѱ��� ���� �����͸� �ǹ�
-- % : ���̿� ������� (���ھ��� ��쵵 ����) ��� ���� �����͸� �ǹ�

--��� �̸����� AM �� ���ԵǾ� �ִ� ��� �����͸� ���
SELECT *
FROM EMP
WHERE ENAME LIKE '%AM%';

--��� �̸����� AM �� ���ԵǾ� ���� �ʴ� ��� �����͸� ���
SELECT *
FROM EMP
WHERE ENAME NOT LIKE '%AM%';


--���ϵ� ī�� : _, %
--A_A 
WHERE ENAME LIKE 'A_A' �̷����
AAA
ABA
ACA �� ���ü��� �ִ�

WHERE ENAME LIKE 'A_A'
������ �Ϻο� ���ϵ�ī�� ���ڰ� �ִ� ��� : ESCAPE �� : ���ϵ� ī�带 ����ó�� �ν�
WHERE ENAME LIKE'A|_A' ESCAPE'|';

--NULL
SELECT ENAME, SAL, SAL*12+COMM AS ANNSAL, COMM
FROM EMP;

SELECT*
FROM EMP
WHERE COMM IS NULL;

--����߿��� ���� ����� �ִ� ����� ���
SELECT *
FROM EMP
WHERE MGR IS NULL;

--����߿��� ���� ����� ���� ����� ���
SELECT *
FROM EMP
WHERE MGR IS NOT NULL;

--������ : UNION
SELECT EMPNO , ENAME, SAL, DEPTNO --����
FROM EMP
WHERE DEPTNO = 10
UNION
SELECT EMPNO , ENAME, SAL, DEPTNO --���� �ؾ߸� ���
FROM EMP
WHERE DEPTNO = 20;

--UNIOM ���� ������
--Į������ ���ƾ� �ȴ�.
--Į���� ������ ���°� ���ƾ� �ȴ�.

--Į���� ������ �ٸ����
SELECT EMPNO , ENAME, SAL, DEPTNO 
FROM EMP
WHERE DEPTNO = 10
UNION
SELECT EMPNO , ENAME, DEPTNO, SAL
FROM EMP
WHERE DEPTNO = 20;

-- Į���� ������ �����ϰ� Ÿ���� ����, �ٸ� Į�� ������ ������
SELECT EMPNO , ENAME, SAL, DEPTNO 
FROM EMP
WHERE DEPTNO = 10
UNION
SELECT EMPNO , ENAME, DEPTNO, SAL
FROM EMP
WHERE DEPTNO = 20;
--UNION ���� : �ڵ����� �ߺ��� ���� �κ��� ����
SELECT EMPNO , ENAME, SAL, DEPTNO 
FROM EMP
WHERE DEPTNO = 10
UNION
SELECT EMPNO , ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10;

--UNIO ���� : �ߺ��� ���Ÿ� ���ϰ� ��� �ϼ��� �Ҷ� : UNION ALL
SELECT EMPNO , ENAME, SAL, DEPTNO 
FROM EMP
WHERE DEPTNO = 10
UNION
SELECT EMPNO , ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10;

--������ : INTERSECT
--��ü�� ���� ������ ����ϰ� ���߿��� �ʿ��� �κ��� ���
--RMP ���̺� ��ü ���� ��ȸ�� ù���� SELECT���� ������� 10�� �μ��� �ִ� ��� �����͸� ���

SELECT EMPNO , ENAME, SAL, DEPTNO 
FROM EMP
INTERSECT
SELECT EMPNO , ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10;

--������ :MINUS : �ߺ�����
--RMP ���̺� ��ü ���� ��ȸ�� ù���� SELECT���� ������� 10�� �μ��� �ִ� ��� �����͸� �����ϰ� ���

SELECT EMPNO , ENAME, SAL, DEPTNO 
FROM EMP
MINUS
SELECT EMPNO , ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10;


