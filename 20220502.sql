--���� : ���� ���̺��� �ϳ��� ���̺� ó�� ����ϴ� ����
SELECT * 
FROM EMP,DEPT
ORDER BY EMPNO;
EMP * DEPT =48
12* 4 =48
���Ǿ��� ��½� �տ� ���̺� ������ ���̺� ���� ������ ���


--���ν� ������ �ݵ�� �ִ� ���� ����.
SELECT * 
FROM emp, dept 
WHERE emp.deptno = dept.deptno
order by empno;

SELECT * 
FROM emp.empNO, emp.dept , emp.JOB, emp.HIREDATE,emp. DEPTNO, DEPT.DNAME,emp.LOC
WHERE emp. deptno = dept. deptno
order by empno;

--���̺� �̸��� ��Ī ���
SELECT E.empNO, E.dept , E.job, E.hiredate, E.deptno, E.dname, E.loc
FROM emp E, dept D
WHERE E. deptno = D. deptno               --emp���̺��� E�� ��Ī, dept ���̺��� D�� ��Ī
order by empno;


--MYSQL
SELECT *
 FROM HOIN DEPT D
 ON e.DEPTNO = d.DEPTNO
 ORDER BY E.empno
 
 --��������(inne JOIN)
 --�ܺ�����(outer JOIN) : LEFT OUTER JOIN,RIGHT OUTER JOIN,FULL OUTER JOIN

--��������
--����� : ���̺��� ������ �� �� ��� ���� �� ���̺��� Ư�� ���� ��ġ�� �����͸� �������� �����ϴ� ��� : DEPTNO 
SELECT E.EMPNO, E.ENAME, D.DEPTNO,D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;
ORDER BY D.DEPTNO, E.EMPNO;

SELECT E.EMPNO, E.ENAME, D.DEPTNO,D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND SAL >= 3000;

-- EMP ���̺� ��Ī�� E��, DEPT ���̺� ��Ī�� D�� �Ͽ� ������ ���� � ������ ������ �޿���
--2500 �����̰� ��� ��ȣ�� 9999 ������ ����� ������ ��µǵ��� sql �� �ڵ带 �ۼ� �Ͻÿ�.
--���Į�� : E.EMPNO, E.ENAME, SAL ,D.DEPTNO,D.DNAME, D.LOC

SELECT E.EMPNO, E.ENAME, D.DEPTNO,D.DNAME, D.LOC , E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.SAL <=2500
AND E.ENPNO <=9999;

--�� ���� : � ���� ��� ���� ���
SELECT * FROM EMP;
SELECT * FROM SALGRADE;

--SELECT *
--FROM EMP E,SALGRADE S
--WHERE E.SAL >= LOSAL or E.SAL <=HISAL;

SELECT *
FROM EMP E,SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;

--��ü���� : SELF JOIN
SELECT *FROM EMP;

--EMP���� �ڽ��� ���ӻ���� �̸��� �˰� �ʹ�.
SELECT E1.EMPNO AS �����ȣ, E1.ENAME AS ����̸�, E1.MGR AS ���ӻ����ȣ, E2.ENAME AS ������ӻ���̸�
FROM EMP E1, EMP E2
WHERE  E1.MGR = E2.EMPNO;                 --���� ���� ���� : ���� �ٸ� ���̺��� ��Ī ���Ѿ� �Ѵ�.

--KING ��� ���� ����ϰ� �ʹ�.
���� �ܺ� ����(LEFT OUTER JOIN) : ���� ���̺��� �׸�(��)�� ��ü ���
--���ӻ���� �ִ� ������ ���ӻ���� ���� ������ ���
SELECT E1.EMPNO AS �����ȣ, E1.ENAME AS ����̸�, E1.MGR AS ���ӻ����ȣ, E2.ENAME AS ������ӻ���̸�
FROM EMP E1, EMP E2
WHERE  E1.MGR = E2.EMPNO(+); 

������ �ܺ� ����(RIGHT OUTER JOIN) : ������ ���̺��� �׺�(DUF)�� ��ü ���
--���ӻ���� �ִ� �����밡 ���ӻ���� ���� ������ ���
SELECT E1.EMPNO AS �����ȣ, E1.ENAME AS ����̸�, E1.MGR AS ���ӻ����ȣ, E2.ENAME AS ������ӻ���̸�
FROM EMP E1, EMP E2
WHERE  E1.MGR(+) = E2.EMPNO; 

--SQL-99 ǥ�� �������� ����
--NATURAL JOIN : � ����- �������� :���� ������ �κ��� ã�Ƽ� �ڵ����� ����
SELECT E.EMPNO , E.ENAME , E.JOB, E.MGRM, E.HIREDATE, E.SAL, E.COMM
D.DEPTNO, D.DNAME, D.LOC
FORM EMP E NATURAL JOIN DEPT D
ORDER BY DEPTNO , E.EMPNO;

--JOIN - USING : ���� �Ǵ� �׸��� ����
FROM TABLE1 JOIN TABLE2 USING(���ο� ����� ���ؿ�)

SELECT E.EMPNO , E.ENAME , E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM
       DEPTNO, D.DNAME, D.LOC
FORM EMP E JOIN DEPT D USING (DEPTNO)
ORDER BY DEPTNO , E.EMPNO;

--JOIN - ON : ���� �Ǵ� ������ ����
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM,
       E.DEPTNO, D.DNAME, D.LOC
FORM EMP E JOIN DEPT D USING (DEPTNO)
ORDER BY DEPTNO , E.EMPNO;

--OUTER JOIN
--LEFT OUTER JOIN
SELECT E1.EMPNO AS �����ȣ, E1.ENAME AS ����̸�, E1.MGR AS ���ӻ����ȣ, E2.ENAME AS ������ӻ���̸�
FROM EMP E1 LEFT OUTER JOIN EMP E2
ON (E1.MGR = E2.EMPNO);


--RIGHT OUTER JOIN
SELECT E1.EMPNO AS �����ȣ, E1.ENAME AS ����̸�, E1.MGR AS ���ӻ����ȣ, E2.ENAME AS ������ӻ���̸�
FROM EMP E1 RIGHT OUTER JOIN EMP E2
ON (E1.MGR = E2.EMPNO);

--����Ŭ 3���̻��� ���̺� ����
FROM TABLE1, TABLE2, TABLE3
WHERE TABLE1.COL = TABLE2.COL
AND TABLE2.COL = TABLE3.COL

--SQL-99���� ��Ŀ���
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

--�������� :���� �ȿ� ������ ����ϴ� ���� : SQL���� �����ϴµ� �ʿ��� �����͸� �߰��� ��ȸ �ϱ� ���� SQL�� ���ο��� ����ϴ� SELECT���� �ǹ�

SELECT * FROM ���̺�� WHERE �� = (SELECT * FROM ���̺��2 WHERE ���ǹ�)
INSERT INTO ���̺��1 VALUES (SELECT * FROM ���̺��2)

--��� �̸��� JONES�� ����� �޿����
--JONES ���� �޿��� ���� �޴� ���� �޿����
SELECT *
FROM EMP;

SELECT SAL
 FROM EMP
  WHERE ENAME ='JONES';    -2975
  
SELECT *
FROM EMP
WHERE SAL>2975;

--�� �ΰ��� Ŀ���� �ϳ��� �������

SELECT *
FROM EMP
WHERE SAL>(SELECT SAL
           FROM EMP
           WHERE ENAME = 'MARTIN');
           
--���������� Ư¡
--1.���������� �����ڿ� ���� �� �Ǵ� ��ȸ ����� �����U�� ���̸� ��ȣ()�� ��� ����Ѵ�.
--2.Ư���� ����� ��츦 ������ ��κ��� �������������� ORDER BY���� ����Ҽ� ����.
--3.���������� SELECT���� ����� ���� ���������� �񱳴��� ���� �ڷ����� ���� ������ �����ؾ� �Ѵ�.
--  ��,���������� �� ��� �����Ͱ� �ϳ���� ���������� SELECT�� ���� ���� �ڷ����� ���� �ϳ� �����ؾ� �Ѵ�.
--4.���������� �ִ� SELECT���� ��� �� ���� �Բ� ����ϴ� ���������� ������ ������ ȣȯ �����ؾ� �Ѵ�.
--  ���� ��� ���������� ����� �����ڰ� �� �ϳ��� �����ͷθ� ������ ����� �����ڶ�� ���������� ��� �� ���� �ݵ�� �ϳ����� �Ѵ�/

--������ �������� : �� ������ ����� ��쿡�� ���� �Ÿ��� ����� �ϳ��� ���� �Ǿ�� �Ѵ�
>, >=, <, <=, =, <>, ^=, !=

--������ JONES�������� ���� �Ի��� ����� ���� ��ȸ
SELECT *
FROM EMP
WHERE HIREDATE < (SELECT HIREDATE 
                    FROM EMP
                      WHERE ENAME = 'JONES');
--���������� �Է��� �ϰ� �Ǹ�..
SELECT *
FROM EMP
WHERE HIREDATE < (SELECT HIREDATE 
                    FROM EMP
                      WHERE HIREDATE  > 1981/02/31);
--������ ���� ������ �ϳ��� ��� �������� ����� ���´�

--20�� �μ��� ���� ��� �� ��ü ����� ��� �޿����� ���� �޿��� �޴� ��� ������ �ҼӺμ� ������ �Բ� ��ȸ�ϴ� ���
SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DEPTNO, D.DNAME, D.LOC
FORM EMP E, DEPT D
WHERE E.DEPTNO =D.DEPTNO
AND E.DEPTNO = 20
AND E.SAL > SELECT AVG(SAL) FROM EMP);


--������ �������� :������ ������ ���������� ����� �������� ������ ��������
--����� ������ ���
--IN : ���������� �����Ͱ� ���������� ��� �� �ϳ���� ��ġ�� �����Ͱ� �ִٸ� True
--ANY, SOME : ���������� ���ǽ��� �����ϴ� ���������� ����� �ϳ� �̻��̸� True
--ALL : ���������� ���ǽ��� ���������� ��� ��ΰ� �����ϸ� True
--EXISTS : ���������� ����� �����ϸ� (��, ���� 1�� �̻��� ���)True

--IN
SELECT *
FROM EMP
WHERE DEPTNO IN (20,30);

--�� �μ��� �ְ� �޿��� ������ �׿��� �޴� ��� ���� ����ϱ�
--�� �μ��� �ְ� �޿�
--�޿� = �� �μ��� �ְ� �޿�
SELECT MAX(SAL)
FROM EMP
GROUP BT DEPTNO;


SELECT *
FROM EMP
WHERE SAL in (SELECT MAX(SAL)
             FROM EMP
             GROUP BY DEPTNO);
             
--IN : ������ ������ ����� ��ġ�ϴ� �׸� ���


--ANY, SOME ������ : �������� ����� �ϳ��� �´��� ���� ���� ���� ����� ���

SELECT *
FROM EMP
WHERE SAL = SOME (SELECT MAX(SAL)
             FROM EMP
             GROUP BY DEPTNO);
             
-30�� �μ� ������� �ִ� �޿����� ���� �޿��� �޴� ��� ���� ���
SELECT *
FROM EMP
WHERE SAL < ANY (SELECT SAL
                FROM EMP                    
                 WHERE DEPTNO = 30)
ORDER BY SAL, EMPNO;

SELECT MAX(SAL)
FROM EMP
WHERE DEPTNO = 30;

--30�� �μ� ������� �ּ� �޿����� ���� �޿��� �޴� ��� ���� ���
SELECT *
FROM EMP
WHERE SAL > ANY (SELECT SAL
                FROM EMP                    
                 WHERE DEPTNO = 30)
                 
 --ALL���� : ���������� ��� ����� ���ǽĿ� �¾ƾ����� ���
 
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
                  
--30�� �μ��� �ִ� �޿����� �� ���� �޿��� �޴� ��� ���
 SELECT*
   FROM EMP
   WHERE SAL > ALL (SELECT SAL
                FROM EMP
                  WHERE DEPTNO = 30);
--EXISTS ������ : �������� ��� �� �����ϸ� ���� ������ �� ���, �������� �ʴ´ٸ� �������� ���� X
SELECT*
  FROM EMP
  WHERE EXISTS (SELECT DNAME
                FROM DEPT
                WHERE DEPTNO = 10);
                
--���� ���� ���� ���� ���߿� ��������
--���߿� ��������

SELECT *
FROM EMP
WHERE (DEPTNO, SAL)IN (SELECT DEPTNO, MAX(SAL)
                       FROM EMP
                         GROUP BY DEPTNO);

--FROM ���� ����ϴ� ���������� WITH��
--�ζ��� ��(inline view) : FROM ���� ����ϴ� ��������
--JOIN�ε� �������� �̿�

SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
 FROM(SELECT * FROM EMP WHERE DEPTNO = 10) E10,
 (SELECT *FRON DEPT)D
 WHERE E10.DEPTNO = D.DEPTNO;
 
 WITH
 [��Ī1] AS (SELECT�� 1)
 [��Ī1] AS (SELECT�� 1),
 ..
 ..
 SELECT
 FROM ��Ī1, ��Ī2, ��Ī3.....
 
 WITH
 E10 AS (SELECT * FROM EMO WHERE DEPTNO = 10),
 D   AS (SELECT * FROM DEPT)
 SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
 FROM E10, D 
 WHERE E10.DEPTNO = D.DEPTNO;
 
-- SELECT ���� ����ϴ� ��������
 SELECT EMPNO, ENAME, JOB, SAL, 
       (SELECT GRADE 
        FROM SALGRADE
        WHERE E.SAL BETWEEN LOSAL AND HISAL) AS "SALGRADE",
        DEPTNO,
        (SELECT DNAME
        FROM DEPT
        WHERE E.DEPTNO = DEPT.DEPTNO)AS DNAME
   FROM EMP E;
   
-- ���̺� ������ �߰� : INSERT��

DDL(Date Defintion Language) : ������ ���Ǿ� :CREATE, ALTER, DROP, RENAME, TRUNCATE
DCL(Data Control language) : ������ ����� : GRANT, REVOKE
DNL(Data manipulation language) : ������ ���۾� : SELECT, INSERT, UPDATE, DELETE

--�׽�Ʈ ���̺� ����(DEPT_TEMP)
CREATE TABLE DEPT_TEMP
AS SELECT * FROM DEPT;    --<-���̺� ���� :Į�� �ȿ� ������ �⺻Ű ���� ���� ������ ���� �ʴ´�.

--���̺� ����
DROP TABLE ���̺� �̸�;

DESC DEPT_TEMP;
DESC DEPT;

SELECT * FROM DEPT_TEMP;
SELECT * FROM DEPT;

--���̺� ������ �߰� : INSERT ��
INSERT INTO ���̺� �̸�[(��1, ��2, ......, ��N)��������]  --�����ÿ��� ���̺� �÷� ������ ����
VALUES (��1�� �� ������, ��2�� �� ������, .....��N�� �� ������);

INSERT INTO DEPT_TEMP (DEPTNO,DNAME, LOC)
VALUES (50, 'DATABASE',SEOUL');

SELECT * FROM DEPT_TEMP;

-- INSERT �� ������ �߻��ϴ� ���
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

-- ���̺� ��¥ ������ �Է��ϱ�
-- �׽�Ʈ ���̺� ���� (EMP_TEMP) : EMP�� ���ĸ� ��������
CREATE TABLE EMP_TEMP
  AS SELECT *
       FROM EMP
       WHERE 1 <> 1;  -- ���� : ��(1)�� �ƴ� ��� ���� : �����ʹ� �������� ���� : �÷���� �÷� ���ĸ� ��������

SELECT * FROM EMP_TEMP;

-- INSERT������ ��¥ ������ �Է��ϱ� (��¥ ���̿� / �Է�)
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
             VALUES (9999, 'ȫ�浿', 'PRESIDENT', NULL, '2001/01/01', 5000, 1000, 10);
       
SELECT * FROM EMP_TEMP;     

-- INSERT������ ��¥ ������ �Է��ϱ� (��¥ ���̿� - �Է�)
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
             VALUES (1111, '������', 'MANAGER', 9999, '2001-01-05', 4000, NULL, 20);

SELECT * FROM EMP_TEMP;

-- INSERT������ ��¥ ������ �Է��ϱ� (��¥�� ������ ������ �ݴ�� �Է�)
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
             VALUES (2111, '�̼���', 'MANAGER', 9999, '07/01/2001', 4000, NULL, 20);
             
-- ��¥ (��/��/��, YYYY/MM/DD)             
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
             VALUES (2111, '�̼���', 'MANAGER', 9999, 
             TO_DATE('07/01/2001', 'DD/MM/YYYY'), 
             4000, NULL, 20);

SELECT * FROM EMP_TEMP;

-- SYSDATE�� ����Ͽ� ��¥ ������ �Է��ϱ� : ���� ������ �������� ��¥�� �Է�
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
             VALUES (3111, '��û��', 'MANAGER', 9999, SYSDATE, 4000, NULL, 30);

SELECT * FROM EMP_TEMP;

-- ���������� ����Ͽ� �ѹ��� ���� ������ �߰��ϱ�  : EMP ���̺��� ���޵���� 1�� ����� �����͸� ��������  
-- (�Է� �÷� ��, �������� �÷��� ����, ���ĵ� ����)

INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
  SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, E.DEPTNO
    FROM EMP E, SALGRADE S
  WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
    AND S.GRADE = 1;

-- INSERT ������ ���������� ����� �� ������ ��
-- 1. VLAUES ���� ������� �ʴ´�.
-- 2. �����Ͱ� �߰��Ǵ� ���̺��� ���� ������ ���������� �� ������ ��ġ�ؾ� �Ѵ�.
-- 3. �����Ͱ� �߰��Ǵ� ���̺��� �ڷ����� ���������� �ڷ����� ��ġ�ؾ� �Ѵ�.


-- ���̺� ������ ���� : UPDATE��
-- �׽�Ʈ ���̺� ���� (DEPT_TEMP2)
CREATE TABLE DEPT_TEMP2
  AS SELECT * FROM DEPT;
  
SELECT * FROM DEPT_TEMP2;  

-- UPDATE �⺻ ��  : UPDATE�� ������ : WHERE ���ǹ� ��� ����
UPDATE [������ ���̺�]
SET [������ ��1]=[������], [������ ��2]=[������], ... [������ ��N]=[������]
[WHERE �����͸� ������ ��� ���� �����ϱ� ���� ����];

UPDATE DEPT_TEMP2
  SET LOC = 'SEOUL';

SELECT * FROM DEPT_TEMP2;

ROLLBACK;  -- UPDATE�� DELETE ��� �������� �ǵ�����

COMMIT;    -- UPDATE�� DELETE ������ �Ϸ� : Ŀ�� ���Ŀ��� ROLLBACK ���� ����.

ROLLBACK - Ʈ������ - COMMIT
���� ���� - UPDATE, DELETE, INSERT - ���ķ� ����

-- �������� �Ϻκи� ���� : WHERE ���ǹ� ���
UPDATE DEPT_TEMP2
  SET DNAME = 'DATABASE',
      LOC = 'SEOUL'
  WHERE DEPTNO = 40;
  
SELECT * FROM DEPT_TEMP2;  

-- ���������� ����Ͽ� ������ �����ϱ� : �������� ����, �Ϻκ� �����ϱ�
-- ���������� ������ �Ϻκ� �����ϱ�
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

-- WHERE���� ���������� ����Ͽ� �����͸� ����
-- loc = 'seoul' ������ ��� DNAME = 'OPERATIONS' 

UPDATE DEPT_TEMP2
  SET LOC = 'SEOUL'
  WHERE DEPTNO = (SELECT DEPTNO
                    FROM DEPT_TEMP2
                    WHERE DNAME = 'OPERATIONS');
                    
SELECT * FROM DEPT_TEMP2;




-- ���̺� ������ ���� : DELETE�� : DELETE �� ������ : WHERE ���ǹ� ��� ����
