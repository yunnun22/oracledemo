SELECT first_name
FROM employees;

-- �ּ�ó��

--CTRL + Enter : ����
SELECT * FROM employees;
SELECT * FROM tab;
/*
�÷���, ���̺�� ��Ī(alias)�� ������ �� �ִ�.
��Ī�� ������ �������� " "(�ֵ���ǥ)�� �����Ѵ�.
*/
SELECT salary, salary*10 AS bonus
FROM employees;

SELECT salary, salary*10 AS ���ʽ�
FROM employees;

SELECT salary, salary*10 AS "b o n u s"
FROM employees;

--king���� �޿��� 24000�Դϴ�.
SELECT last_name || '���� �޿���' || salary || '�Դϴ�.' AS name
FROM employees;

--DISTINCT�� �ߺ����Ÿ� �� �� ������ִ� ��ɾ��̴�.
SELECT DISTINCT first_name
FROM employees;

SELECT DISTINCT first_name, last_name
FROM employees;
/*
first_name   last_name
sunder       Abel
sunder       Abel
sunder       Ande
*/
/*
�ܿ���
--SELECT �Է¼���
SELECT column_name1, column_name2
FROM table_name
WHERE column_name='value'
GROUP BY column_name
HAVING column_name='value'
ORDER BY column_name ASC, column_name DESC;

--SELECT �ؼ�����
FROM table_name
WHERE column_name='value'
GROUP BY column_name
HAVING column_name='value'
SELECT column_name1, column_name2
ORDER BY column_name ASC, column_name DESC;
*/
