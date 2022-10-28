SELECT first_name
FROM employees;

-- 주석처리

--CTRL + Enter : 실행
SELECT * FROM employees;
SELECT * FROM tab;
/*
컬럼명, 테이블명에 별칭(alias)를 지정할 수 있다.
별칭에 공백이 있을때는 " "(쌍따옴표)를 지정한다.
*/
SELECT salary, salary*10 AS bonus
FROM employees;

SELECT salary, salary*10 AS 보너스
FROM employees;

SELECT salary, salary*10 AS "b o n u s"
FROM employees;

--king님의 급여는 24000입니다.
SELECT last_name || '님의 급여는' || salary || '입니다.' AS name
FROM employees;

--DISTINCT은 중복제거를 한 후 출력해주는 명령어이다.
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
외워라
--SELECT 입력순서
SELECT column_name1, column_name2
FROM table_name
WHERE column_name='value'
GROUP BY column_name
HAVING column_name='value'
ORDER BY column_name ASC, column_name DESC;

--SELECT 해석순서
FROM table_name
WHERE column_name='value'
GROUP BY column_name
HAVING column_name='value'
SELECT column_name1, column_name2
ORDER BY column_name ASC, column_name DESC;
*/
