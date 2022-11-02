/*------------------------------
문제
------------------------------*/
--1) 모든사원에게는 상관(Manager)이 있다. 하지만 employees테이블에 유일하게 상관이
--   없는 로우가 있는데 그 사원(CEO)의 manager_id컬럼값이 NULL이다. 상관이 없는 사원을
--   출력하되 manager_id컬럼값 NULL 대신 CEO로 출력하시오.
-- SELECT FIRST_NAME, MANAGER_ID, NVL(TO_CHAR(MANAGER_ID), 'CEO')
-- FROM employees;

-- 1 
SELECT manager_id
FROM employees
ORDER BY manager_id DESC;
--2
SELECT manager_id, nvl(to_char(manager_id), 'CEO')
FROM employees
ORDER BY manager_id DESC;



--2) 가장최근에 입사한 사원의 입사일과 가장오래된 사원의 입사일을 구하시오.
-- SELECT hire_date, min(salary), max(salary)
-- FROM employees
-- GROUP BY hire_date;

SELECT max(hire_date), min(hire_date)
FROM employees;

--3) 부서별로 커미션을 받는 사원의 수를 구하시오.
-- SELECT deparment_id, commission_pct, job_id;

--1
SELECT department_id, count(commission_pct)
FROM employees
GROUP BY department_id;
--2
SELECT department_id, count(commission_pct)
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY department_id;
   
--4) 부서별 최대급여가 10000이상인 부서만 출력하시오.
--SELECT department_id, salary
--FROM employees
--WHERE max(salary) >= 10000
--GROUP BY department_id;

--1
SELECT department_id, max(salary)
FROM employees
GROUP BY department_id
HAVING max(salary)>=10000;
--2
SELECT department_id, max(salary)
FROM employees
GROUP BY department_id
HAVING max(salary)>=10000
ORDER BY department_id;


  
--5) employees 테이블에서 직종이 'IT_PROG'인 사원들의 급여평균을 구하는 SELECT문장을 기술하시오.
-- SELECT job_id, avg(salary)
-- FROM employees
-- GROUP BY job_id;

--1
SELECT avg(salary)
FROM employees
WHERE job_id='IT_PROG';
--2
SELECT job_id, avg(salary)
FROM employees
GROUP BY job_id
HAVING job_id='IT_PROG';
  

--6) employees 테이블에서 직종이 'FI_ACCOUNT' 또는 'AC_ACCOUNT' 인 사원들 중 최대급여를  구하는    SELECT문장을 기술하시오.   
--SELECT job_id, salary, decode('FI_ACCOUNT', max(salary))
--                             ('AC_ACCOUNT', max(salary))
--FROM employees;

--1
SELECT max(salary)
FROM employees
WHERE job_id = 'FI_ACCOUNT'
   OR job_id = 'AC_ACCOUNT';
--2
SELECT max(salary)
FROM employees
WHERE job_id IN('FI_ACCOUNT', 'AC_ACCOUNT');


--7) employees 테이블에서 50부서의 최소급여를 출력하는 SELECT문장을 기술하시오.
--1
SELECT min(salary)
FROM employees
WHERE department_id = 50;
--2
SELECT department_id, min(salary)
FROM employees
WHERE department_id = 50
GROUP BY department_id;
--3
SELECT department_id, min(salary)
FROM employees
--WHERE department_id = 50
GROUP BY department_id
HAVING department_id = 50;

    
--8) employees 테이블에서 아래의 결과처럼 입사인원을 출력하는 SELECT문장을 기술하시오.
--   <출력:  2001         2002             2003
 --          1              7                6   >
 
--1
SELECT sum(decode(to_char(hire_date, 'yyyy'), '2001', 1, 0)) AS "2001" -- hire_date가 'yyyy'이면
FROM employees;

--2
SELECT sum(decode(to_char(hire_date, 'yyyy'), '2001', 1, 0)) AS "2001",
       sum(decode(to_char(hire_date, 'yyyy'), '2002', 1, 0)) AS "2002",
       sum(decode(to_char(hire_date, 'yyyy'), '2003', 1, 0)) AS "2003"
FROM employees;
            
   
    
--9) employees 테이블에서 각 부서별 인원이 10명 이상인 부서의 부서코드,
--  인원수,급여의 합을 구하는  SELECT문장을 기술하시오.
SELECT department_id, count(*), sum(salary)
FROM employees
GROUP BY department_id
HAVING count(*) >= 10;
   
  
  
--10) employees 테이블에서 이름(first_name)의 세번째 자리가 'e'인 직원을 검색하시오.
-- instr(데이터, 찾을 문자, 시작 위치, 순서): 문자열에서 문자 위치 찾기
SELECT first_name
FROM employees
WHERE instr(first_name, 'e', 3, 1) = 3; -- 1인덱스부터 첫번째로 검색된 값
-- or ???
-- KOREAE 문자열에서 E를 찾기 2인덱스에서 2번쨰 (검색시작위치, 검색시작위치에서 몇 번째)
SELECT instr('korea', 'e', 2, 2)
FROM dual; -- 0

SELECT instr('koreae', 'e', 2, 2)
FROM dual; -- 6

-- subsre : 문자열 자르기
SELECT first_name
FROM employees
WHERE substr(first_name, 3, 1) = 'e'; -- 3번째 문자열에 있는 값이 e일때만 가져오기

SELECT first_name
FROM employees
WHERE first_name LIKE '__e%';


-----------------------------------------------------

