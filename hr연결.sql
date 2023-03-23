--대소문자구별 없음
--여러문장으로 작성가능
--문장끝은;
--select * *는 모든칼럼을 의미
--invalid identifier : 식별자 오류 (식별자 --> 칼럼이름, table이름)
--문자값은 반드시 ''을 써야한다.
--"table or view does not exist"
--Oracle은 데이터사전이있다.. 데이터사전에 테이블이름을 대문자로 저장해놓는다.
--값은 대소문자 구벼한다.

desc employees;         --테이블정보확인   
select * from tab;      --테이블명 검색
select * from employees;

--from "EMPLOYEES";


select DISTINCT DEPARTMENT_ID
FROM employees;

--값이 없다 : null
--null값을 계산하면 null
--null을 대체할 필요가 있다. nvl(비교값,대체값)
--특수문자가 포함된 식별자이름은 ""으로 감싼다.
--별칭을 쓸때 as는 생략이 가능하다.
--연결연산자는 +가 아니다. orcle은 ||이다. mysql은 concat()

select employee_id 직원번호, first_name||' '||last_name 이름, salary, commission_pct,
       concat(concat(first_name,' '), last_name) 이름2,
       salary+ salary*nvl(commission_pct,0) "커미션 적용급여",        --해석2
       hire_date
from employees;     --해석1

--distinct는 나열칼럼들의 같은값이 있으면 배제
select distinct department_id, job_id
from employees;

--조건철
select employee_id, first_name, last_name, salary 급여  --해석3
from employees  --해석1
where salary >= 10000;  --해석2
order by 4 desc; --해석4

--order by 칼럼이름 또는 별명 또는 select순서(SQL은 순서가 1부터시작)
--where salary >= 10000;  --해석2
--order by salary desc; --해석4

-------------------------------------------------
select 칼럼이름들 --해석3
from table 이름들  --해석1
where 조건절 --해석2
order by 칼럼들; --해석4
-------------------------------------------------

-->RR형식 : >50 면 1900년대 의미, <50 2000년대 의미 
select employee_id,first_name, salary, to_char(hire_date, 'yyyy/mm/dd hh:mi:ss') 입사일
, department_id--해석3
from employees  --해석1
where salary >= 10000 --해석2
and department_id =80
and first_name = 'Lisa'
order by hire_date asc, salary desc; --해석4

-------------------------------------------------

--DUAL table은 Oracle에서 제공하는 dummy table
desc DUAL;
select*from dual;

select distinct 1+2,sysdate, floor(10.9)무조건버림,ceil(10.1) 무조건올림,
    round(35.678)정수로반올림,round(35.678,1)반올림2,round(35.678,-1)반올림3
from dual;
-------------------------------------------------
--사번이 홀수인 직원을 구하라
select *
from EMPLOYEES;
where mod (EMPLOYEE_ID,2)= 1

select first_name, upper(first_name), lower(first_name),initCap(email)
from EMPLOYEES;

--first_name가 david를 검색한다.
--만약에 first_name칼럽으로 색인(index)가 구성되어있었다면 함수를 이용했을때 index는 깨진다. (index사용불가.
select *
from EMPLOYEES
where first_name = initCap('david');

select *
from EMPLOYEES
where lower(first_name) = 'david';

select *
from EMPLOYEES
where first_name = initCap('david');

select *
from EMPLOYEES
where upper(first_name) = upper('david');

----------------------------------------------------
select first_name,upper(first_name),lower(first_name),initCap(email),length('한글'),lengthB('한글')
from EMPLOYEES;

----------------------------------------------------
--급여가 15000 이상인 직원들의 이름, 급여, 부서id를 조회하시오.
select first_name, salary, department_id
from employees
where salary >=15000; 


----------------------------------------------------
--직원 중에서 연봉이 170000 이상인 직원들의 이름, 연봉을 조회하시오.  연봉은 급여(salary)에 12를 곱한 값입니다.
select first_name, salary*12 연봉 
from employees
where salary*12 >=170000;

----------------------------------------------------
--직원 중에서 부서id가 없는 직원의 이름과 급여를 조회하시오.
--null은 값이 없다 이므로 =연산자로 비교불가
select first_name, salary
from employees
where department_id is null;
----------------------------------------------------
--2004년 이전에 입사한 직원의 이름, 급여, 입사일을 조회하시오.
select first_name,salary,hire_date
from employees
where hire_date <='2004/12.31'; --자동형변환


select first_name,salary,hire_date
from employees
where to_char(hire_date,'yyyy') <='2004';

----------------------------------------------------
--1. 80, 50 번 부서에 속해있으면서 급여가 13000 이상인 직원의 이름, 급여, 부서id 를 조회하시오.
--논리연산자 우선순위 not and or

select first_name,salary,department_id
from employees
where (department_id=80 or department_id=50) and salary >=13000; 

2. 2005년 이후에 입사한 직원들 중에서 급여가 1300 이상 20000 이하인 직원들의 
이름, 급여, 부서id, 입사일을 조회하시오.

select employee_id, first_name ,salary, department_id, hire_date
from employees
where to_char(hire_date,'yyyy') >= '2005' and salary >= 1300 and salary <= 20000;

---111번 직원의 급여 7700이었음 1500으로 수정하기
update employees
set salary = 7700
where employee_id = 111;
commit;

select * from v$nls_parameters;



-- SQL 비교연산자 --
1. 80, 50 번 부서에 속해있으면서 급여가 13000 이상인 직원의 이름, 급여, 부서id
를 조회하시오.


2. 2005년 이후에 입사한 직원들 중에서 급여가 1300 이상 30000 이하인 직원들의 
이름, 급여, 부서id, 입사일을 조회하시오.




3. 2005년도 입사한 직원의 정보만 출력하시오.

select employee_id, first_name ,salary, department_id, hire_date
from employees
where to_char(hire_date,'yyyy')='2005';

4. 이름이 D로 시작하는 직원의 이름, 급여, 입사일을 조회하시오.

select first_name, salary ,hire_date
from employees
where substr(first_name,1,1)='D';



5. 12월에 입사한 직원의 이름, 급여, 입사일을 조회하시오.

select first_name ,salary,  hire_date
from employees
where to_char(hire_date,'mm')='12';

----index찾기 instr(first_name,'a',시작위치,몇번째)
select first_name,instr(first_name,'a'), instr(first_name,'a',2,2)
from employees;

5. 이름의 세 번째 자리가 R로 끝나는 사원을 검색하기 위해서 와일드카드 _ 와 LIKE 연산자를 사용하여 다음과 같이 표현할 수 있습니다.
-- _는 임의의 문자 1자, %는 임의의문자 0자이상
select first_name
from employees
where first_name like '__r%';


6. 이름에 le 가 들어간 직원의 이름, 급여, 입사일을 조회하시오.
select first_name ,salary,  hire_date
from employees
where first_name like '%le%';



7. 이름이 m으로 끝나는 직원의 이름, 급여, 입사일을 조회하시오.
select first_name ,salary,  hire_date
from employees
where first_name like '%m';



8. 이름의 세번째 글자가 r인 이름, 급여, 입사일을 조회하시오.
select first_name ,salary,  hire_date
from employees
where first_name like '__r%';

select first_name ,salary,  hire_date
from employees
where substr(first_name,3,1) = 'r';


9. 커미션을 받는 직원의 이름, 커미션, 급여를 조회하시오.
select first_name ,commission_pct, salary  
from employees
where commission_pct is not null;



10. 커미션을 받지 않는 직원의 이름, 커미션, 급여를 조회하시오.

select first_name ,commission_pct, salary  
from employees
where commission_pct is null;


05년도에 입사한 직원을 알아내기 위해 SUBSTR 함수를 이용하여 
HIREDATE 컬럼에서 첫 글자부터 2개를 추출하여 그 값이 05인지를 체크하는 방법으로도 구해 보도록 하세요.

select *
from employees
where substr(hire_date,1,2)='05';

select *
from employees
where to_char(hire_date,'RR')='05';







다음은 이름이 E로 끝나는 사원을 검색해 보도록 합시다. 
SUBSTR 함수를 이용하여 ENAME 컬럼의 마지막 문자 한개만 추출해서 
이름이 E로 끝나는 사원을 검색해 보도록 하시오.
<힌트> 시작 위치를 -1로 주고 추출할 문자 개수를 1로 주면 됩니다. 

select *
from employees
where substr(first_name,-1)='e';


11. 2000년대에 입사해서 30, 50, 80 번 부서에 속해있으면서, 
급여를 5000 이상 17000 이하를 받는 직원을 조회하시오. 
단, 커미션을 받지 않는 직원들은 검색 대상에서 제외시키며, 먼저 입사한 직원이 
먼저 출력되어야 하며 입사일이 같은 경우 급여가 많은 직원이 먼저 출력되록 하시오.

select first_name,salary,commission_pct
from employees
where substr(hire_date,1,1)=2 
and department_id in (30,50,80)
and salary >= 5000 and salary <=17000 
and commission_pct is not null
order by hire_date, salary desc;

--ASC : null이 뒤에나는 정책.
--DESC : null이 앞에나는 정책.
select *
from employees
order by commission_pct desc nulls last;
--order by commission_pct nulls first;

select lpad(first_name,8,'#'), rpad(first_name,8,'#'), 
    '!'||ltrim('    oracle')||'!' 왼쪽, '!'||rtrim('    oracle    ')||'!' 오른쪽,
    '!'||trim('    oracle    ')||'!' 양쪽,
    '!'||trim('o' from 'oooooracleoooo')||'!' 
    
from employees;



select * from tab;


select * from countries;
select * from employees;

first_name ,salary,  hire_date

1. 이름이 'adam' 인 직원의 급여와 입사일을 조회하시오.
select first_name, salary, hire_date
from employees
where first_name =initCap('adam');


2. 나라 명이 'united states of america' 인 나라의 국가 코드를 조회하시오.
select country_id
from countries
where lower(country_name) = 'united states of america' ;


3. 'Adam의 입사일은 95/11/02 이고, 급여는 7000 입니다.' 이런 식으로 직원정보를 조회하시오.

select first_name||'의 입사일은'|| hire_date||'이고, 급여는'|| salary||'입니다.'
from employees
where first_name ='Adam';


4. 이름이 5글자 이하인 직원들의 이름, 급여, 입사일을 조회하시오.
select first_name, salary, hire_date
from employees
where length(first_name)<=5;



5.2006년도에 입사한 직원의 이름, 입사일을 조회하시오.
select first_name, hire_date
from employees
where to_char(hire_date,'yyyy')='2006';




6. 7년 이상 장기 근속한 직원들의 이름, 입사일, 급여, 근무년차를 조회하시오.
select first_name, hire_date, salary, trunc(months_between(sysdate,hire_date)/12)
from employees
where trunc(months_between(sysdate,hire_date)/12) >= 7;

=============Group 함수==================


7. 각 부서별 인원수를 조회하되 인원수가 5명 이상인 부서만 출력되도록 하시오.

select department_id, count(*)
from employees
group by department_id
having count(*) >= 5;
 





8. 각 부서별 최대급여와 최소급여를 조회하시오.
   단, 최대급여와 최소급여가 같은 부서는 직원이 한명일 가능성이 높기때문에 
   조회결과에서 제외시킨다.

select max(salary),min(salary)
from employees
group by department_id
having max(salary) <> min(salary);



   
9. 부서가 50, 80, 110 번인 직원들 중에서 급여를 5000 이상 24000 이하를 받는
   직원들을 대상으로 부서별 평균 급여를 조회하시오.
   다, 평균급여가 8000 이상인 부서만 출력되어야 하며, 출력결과를 평균급여가 높은
   부서면저 출력되도록 해야 한다.
   
select department_id, avg(salary)
from employees
where department_id in(50,80,110) 
and salary between 5000 and 24000
group by department_id
having avg(salary) >= 8000
order by avg(salary) desc;




--일자연습
select sysdate, hire_date,
            floor((sysdate- hire_date)/365) 년도1,
            floor(months_between(sysdate, hire_date)/12) 년도2,
            add_months(hire_date,1) "1개월 후",
            last_day(hire_date) 마지막일,
            next_day(hire_date,'수요일') 처음오늘요일,
            round(hire_date,'month') "반올림1-16이상",
            trunc(hire_date,'month') "버림1-월까지만 본다",
            first_name, salary
from EMPLOYEES;
--where
order by

select sysdate, to_char(sysdate,'yyyy/mm/dd/hh:mi:ss DAY DY MON AM/PM'),
         to_char(1000000000,'L999,9999,999'),
         to_date(20220101,'YYYYMMDD')
from dual;

--rr/mm/dd  rrmmdd rr은 50이상이면 19, 미만이면20
--nls_date_format설정을 바꿀수있다. alter session set nls_date_format='';

select first_name,hire_date
from EMPLOYEES
where hire_date = to_date('030617' ,'rrmmdd');

select first_name,hire_date
from EMPLOYEES
where hire_date = '030617';


select first_name,hire_date
from EMPLOYEES
where hire_date = '2003/06/17';

select*from nls_session_parameters;

select first_name,hire_date,salary,commission_pct, 
         salary+salary*nvl(commission_pct,0) 실수령액,
          salary+salary*nvl2(commission_pct, commission_pct,0) 실수령액2,
          nvl2(commission_pct, '커미션있음','커미션없음') "nvl2연습"
from EMPLOYEES
order by commission_pct; --nulls first


select first_name, manager_id, nvl(to_char(manager_id),'CEO'),
         nvl2(manager_id, to_char(manager_id),'CEO'), 
         department_id,
         nvl(to_char(department_id),'부서없음')"nvl 연습", 
         decode(department_id,10,'A',60,'B',90,'C','D') 부서decode,
         salary, case  when salary>=10000 then '매우많음'
                           when salary>=7000 then '많음'
                           when salary>=5000 then '기본'
                            else '적음'
                           end "case연습",
                           case when first_name like 'A%' then 'A로 시작' else '아님' end "case연습2",
                           case when first_name like '%a' then 'a로 끝남' else '아님' end "case연습2"
from EMPLOYEES;


--------------Group
--집계함수(칼럼이름): 값이 null은 무시한다.
--집계함수 (*) : null이포함
--group by 절이 없으면 전체에 대한 집계이다.
select sum(salary), sum(commission_pct), avg(salary), count(salary), sum(salary)/count(salary),
         count(salary), count(*) 전체건수, count(commission_pct), count(manager_id)

from employees;


select max(hire_date) "가장 최근에 입사", min(hire_date) "가장 오래된 입사"
from employees;


select count(commission_pct), count(*)
from employees
where department_id = 80;
--and commission_pct is not null;



select count(distinct job_id), count(job_id), count(department_id), count(distinct department_id)
from employees;


select distinct department_id
from employees
where department_id is not null;


--집계함수를 사용하지 않은 칼럼이 select절에 있다면 반드시 group by절에 참여해야한다.
--부서별 salary 평균
select department_id, max(job_id), avg(salary)
from employees
where department_id <= 110
group by department_id
order by 1;

select department_id, job_id, avg(salary), avg(salary) avg_sal   --5
from employees                                                                  --1
where department_id <= 110                                                 --2
group by department_id, job_id                                             --3
having avg(salary) >= 10000                                                 --4
order by avg_sal desc;                                                         --6

select department_id, max(salary), min(salary)
from employees
group by department_id;

select (*)
from employees
where department_id = 10;

create table JJ(
   id         number primary key,
   name       varchar2(20) );
   
   
create table JJ(
   id         number primary key,
   name       varchar2(20) );

insert into JJ values(1,'AA');
insert into JJ values(2,'BB');


select * from jj;

update JJ set id = 100 where id =1;






--03/13


--100번 직원의 근무하는 부서이름을 알고싶다

select *
from employees
where employee_id = 100;

select *
from departments
where department_id = 90;
--2개를 합침

--DB Vendor 문법
select employee_id, first_name, departments.department_id
from employees, departments
where employees.department_id = departments.department_id(+)
order by 1;

--join 하고자하는 칼럼이 일치하는 경우 사용
select employee_id, first_name, department_name, department_id
from employees join departments using(department_id);

--join 하고자하는 칼럼이 일치하지 않는 경우 사용
select employee_id, first_name, department_name, departments.department_id
from employees join departments on(employees.department_id = departments.department_id);

select employee_id, first_name, department_name, departments.department_id
from employees left outer join departments on(employees.department_id = departments.department_id);

select employee_id, first_name, department_name, departments.department_id
from employees full outer join departments on(employees.department_id = departments.department_id);

--직원이 어떤 직급인지 자세히 알고자한다. job_title, max_salary, min_salary

desc employees;
desc jobs;
--PK (primary key) : NULL불가 + UNIQUE
--FK(Foreign key) : 참조키, 다른테이블 혹은 자신의 table의 pk를 참조한다.

select employees.first_name, employees.salary, jobs.*
from employees,jobs
where employees.job_id = jobs.job_id;

select employees.first_name, employees.salary, job_id, job_title, max_salary,min_salary
from employees join jobs using(job_id);

select employees.first_name, employees.salary, jobs.*
from employees join jobs on(employees.job_id = jobs.job_id);

--table 이름에 별명가능
select emp.first_name, emp.salary, jobs.*
from employees emp join jobs on(emp.job_id = jobs.job_id)
where emp.job_id = 'IT_PROG';


--Seattle 에 근무하고있는 직원 조회

select first_name, job_id, salary, city, department_name
from employees, departments, locations
where employees.department_id = departments.department_id
and departments.location_id = locations.location_id
and city = 'Seattle';


select first_name, job_id, salary, city, department_name, department_id
from employees join departments using(department_id) 
                        join locations  using(location_id) 
where city = 'Seattle';

select first_name, job_id, salary, city, department_name, departments.department_id
from employees join departments on(employees.department_id = departments.department_id) 
                        join locations  on(departments.location_id = locations.location_id) 
where city = 'Seattle';


--ACCOUNTING 부서 소속 사원의 이름과 입사일을 출력하시오.
select first_name, hire_date
from departments join employees using(department_id)
where department_name = initCap('ACCOUNTING');






1.직원들의 이름과 직급명(job_title)을 조회하시오.

select first_name, job_title
from employees join  jobs using(job_id);


2.부서이름과 부서가 속한 도시명(city)을 조회하시오.
select department_name, city
from departments join locations using(location_id);


3. 직원의 이름과 근무국가명을 조회하시오. (employees, departments, locations,countries)
 
select first_name, country_name
from employees join departments using(department_id)
                        join locations using(location_id)
                        join countries using(country_id);


4. 직책(job_title)이 'manager' 인 사람의 이름, 직책, 부서명을 조회하시오.
 
select first_name, job_title, department_name
from employees join jobs using (job_id)
                       join departments using (manager_id)
where lower(job_title) like '%manager';

5. 직원들의 이름, 입사일, 부서명을 조회하시오.
 
select first_name, hire_date, department_name
from employees join departments using (department_id);
                        

6. 직원들의 이름, 입사일, 부서명을 조회하시오.
단, 부서가 없는 직원이 있다면 그 직원정보도 출력결과에 포함시킨다.
select first_name, hire_date, department_name
from employees left outer join departments using(department_id);



7. 직원의 이름과 직책(job_title)을 출력하시오.
단, 사용되지 않는 직책이 있다면 그 직책정보도 출력결과에 포함시키시오.

select first_name, job_title
from  employees right outer join jobs using(job_id);

select * from employees;
select * from jobs;


--0314
select count(distinct job_id)
from employees;

select count(*) from jobs;

desc jobs;

insert into jobs values('play','매일매일 play',1000,20000);
commit;

select * from jobs;

















--Non equi join (=이외의 연산자를 이용해서 조인)
create table salgrade( grade char(1) primary key, minsal number, maxsal number);

insert into salgrade values('A',0,5000);
insert into salgrade values('B',5000,15000);
insert into salgrade values('C',15001,20000);
insert into salgrade values('D',20001,30000);
commit;

select * from salgrade;

--직원이름과 급여와 급여의  등급출력
select first_name, salary, grade
from employees, salgrade
where employees.salary between salgrade.minsal and salgrade.maxsal;

select first_name, salary, grade
from employees join salgrade on (salary between minsal and maxsal);

select 직원. employee_id, 직원.first_name, 매니저.employee_id, 매니저.first_name
from employees 직원, employees 매니저
where 직원.manager_id = 매니저.employee_id(+)
order by 1;

select 직원. employee_id, 직원.first_name, 매니저.employee_id, 매니저.first_name
from employees 직원 join employees 매니저 on (직원.manager_id = 매니저.employee_id);

select 직원. employee_id, 직원.first_name, 매니저.employee_id, 매니저.first_name
from employees 직원 left outer join employees 매니저 on (직원.manager_id = 매니저.employee_id);

--매니저가 king 인 사원들의 이름과 직급을 출력하시오
select emp.first_name, emp.last_name, emp.manager_id ,jobs.job_title
from employees emp, employees m,jobs
where emp.manager_id = m.employee_id
and emp.job_id = jobs.job_id
and m.last_name = 'King';

select * from employees;

select 직원.employee_id, 직원.first_name, 직원.last_name
from employees 직원, employees 매니저, jobs
where 직원.manager_id = 매니저.employee_id
and 직원.job_id = jobs.job_id
and 매니저.last_name = 'King';

--King 의  직원 id 알아내기
select* from employees
where first_name = 'Steven' and last_name = 'King';


select employee_id, first_name,last_name
from employees
where manager_id = (select employee_id from employees
                                where first_name = 'Steven' and last_name = 'King');
                                
-- Steven King 과 동일한 부서 에서 근무하는 사원의 이름을 출력하시오.
--1. Steven의 근무지 알아내기
--2. 직원의 근무지

select count(*) --107
from employees ;

select count(*) -- 27
from departments;

select *
from departments;

select e1.first_name, e1.department_id,e1.last_name
from employees e1, employees e2
where e1.department_id = e2.department_id
and e2.first_name = 'Steven' and e2.last_name = 'King';



--seif join
select 직원.employee_id, 직원.first_name, 직원.last_name, 직원.department_id
from employees 직원, employees 스티븐
where 직원.department_id = 스티븐.department_id
and 스티븐.first_name ='Steven'  and 스티븐.last_name = 'King';

--subquery
select *
from emplyees
where department_id = (select department_id from emplyees
                                    where first_name = 'Steven' and last_name = 'King');

--부서와 직원
desc departments;
desc employees;

--부서정보출력, manager_id는 부서장을 의미, 부서장은 직원중에 1인이다. (부서장이름,급여,입사일)
--부서장이 없는 부서도 출력결과에 포함한다.
select *
from departments;

select departments.*, employees.first_name, employees.salary, employees.hire_date
from departments, employees
where departments.manager_id = employees.employee_id(+) ;

select departments.*, employees.first_name, employees.salary, employees.hire_date
from departments left outer join employees on (departments.manager_id = employees.employee_id);

select * 
from employees left outer join departments using (department_id);

select * 
from employees full outer join departments using (department_id);


--서브쿼리
--Neena와 동일한 직급을 가진 사원을 출력하는 SQL 문을 작성해 보시오
--subquery에서 subquery의 결과가 단일행인지 다중행인지 주의...단일행연산자(=,<,>), 다중행연산자 (in)
select * 
from employees
where job_id = (select job_id
                        from employees
                        where first_name = 'Neena' );
                        
select * 
from employees
where job_id in (select job_id
                        from employees
                        where first_name = 'David' );


select job_id
from employees
where first_name = 'David' ;


--SCOTT의 급여와 동일하거나 더 많이 받는 사원 명과 급여를 출력하시오
-- subquery결과가 1건 이면 단일행 연산자를 사용 : => , =<, <
-- subquery결과가 1건 이상이면 다중행 연산자를 사용 : in, >= All, >All, >=ANY 
select *
from employees
where salary >= (
            select salary
            from employees
            where first_name = 'Neena');
            
select *
from employees
where salary >=All (
            select salary
            from employees
            where first_name = 'Alexander');    --9000,3100 All은 9000보다 크거나 같은거 , any는 3100보다 크거나 같은거
            


select salary
from employees
where first_name = 'Neena';


--seattle에서 근무하는 사원의 이름과 부서명
select first_name, last_name, salary,department_id
from employees join departments using(department_id)
                        join locations using(location_id)
where city='Seattle';



select*
from employees
where department_id =any (
            select department_id, location_id
            from departments
            where location_id = (
                        select location_id
                        from locations
                        where city = 'Seattle')
                        );


select department_id, location_id
from departments;
where location_id = (select location_id
from locations
where city = 'Seattle');


select location_id
from locations
where city = 'Seattle';


-- IT 부서에서 근무하는 모든 사원의 이름과 금여를 출력하시오

select first_name, salary
from employees
where department_id = (
            select department_id
            from departments
            where department_name = 'IT');


select *
from departments
where department_name = 'IT';

--직속상관이 Steven King인 사원의 이름과 급여를 출력하시오
select*
from employees
where manager_id = (
            select  employee_id
            from employees
            where last_name = 'King' and first_name = 'Steven');

select  *
from employees
where last_name = 'King' and first_name = 'Steven';

--평균 급여보다 더 많은 급여를 받는 사원을 검색하는 문장

select * 
from employees
where salary >= any (
                        select avg(salary)
                        from emloyees group by department_id );


--부서별로 가장 급여를 많이 받는 사원의 정보(사원 번호, 사원이름, 급여, 부서번호)를 출력하시오.(IN 연산자 이용)
select *
from employees
where (department_id, salary ) in (
            select department_id, max(salary) 
            from employees
            group by department_id);


select department_id, max(salary) 
from employees
group by department_id;

select count (distinct department_id)
from employees;


--직급(JOB)이 MANAGER인 사람의 속한 부서의 부서 번호와 부서명과 지역을 출력하시오.
select first_name, department_id, department_name, city
from employees join departments using(department_id) join locations using(location_id)
where job_id in (
select job_id
from jobs
where substr (job_title,-7) =initcap('MANAGER'));


select *
from jobs
where substr (job_title,-7) =initcap('MANAGER');

select rowid, employee_id, first_name
from employees;

create table tbl_test1(id number,name varchar2(20), gender char(1),
            year01 interval year(3) to month);
            
insert into tbl_test1 values(1,'abc', 'M', interval '36' month(3));
insert into tbl_test1 values(2,'def', 'f', interval '12' month(3));

select id ,name, gender, sysdate+year01 
from tbl_test1;

select * 
from tbl_test1
where gender = 'M   ';

where name = 'abc   ';


create table tbl_emp4
as
select employee_id,first_name from employees
where 1 = 0;

select * from tbl_emp2;


select * from tbl_emp4;

desc tbl_emp4;

alter table tbl_emp4 add (job_id varchar2(50));
alter table tbl_emp4 modify (job_id varchar2(100));
--사이즈를 늘리는것 가능 
alter table tbl_emp4 modify (first_name varchar2(30));
--data가 있어도 지워진다.
alter table tbl_emp4 drop column first_name;


insert into tbl_emp4 values(1,'12345678901234567890','ABC');

drop table tbl_emp4;

desc tbl_employee;

select* from tbl_employee;
--데이터 내용 삭제.
truncate table tbl_emp2;    --복구불가

select * from tbl_emp;
delete from tbl_emp;    --복구가능
rollback;-- 원상복구 가능


rename tbl_emp to tbl_employee;

--딕셔너리뷰
select* from user_tables;
desc user_tables;

select* from all_tables;

select* from dba_tables;

--제약조건은 복사안됨
create table tbl_emptest
as
select employee_id, first_name, salary, hire_date 
from employees
where department_id = 60;


desc tbl_emptest;

insert into tbl_emptest values(1,'AA',1000,sysdate);

insert into tbl_emptest(employee_id, first_name, hire_date) values(2,'BB',sysdate);
insert into tbl_emptest(employee_id, hire_date) values(3,sysdate-1);
insert into tbl_emptest(hire_date) values(sysdate-1);

select * from tbl_emptest;

--칼럼의 값을 넣지 않으면 암시적으로 null이다.
--명시적으로 null값을 부여가능
insert into tbl_emptest(employee_id, first_name, hire_date) values(4,null,sysdate);
insert into tbl_emptest(employee_id, first_name, hire_date) values(5,'',sysdate);       --''도 null이다.


--table의 구조 만들기
create table tbl_dept
as
select * from departments where 1=0;


desc tbl_dept;

select * from tbl_dept;

insert into tbl_dept
select employee_id, first_name, 100, 1700 from employees;

create table tbl_update
as 
select * from employees;

select * from tbl_update;

update tbl_update set salary = salary * 1.1
where department_id = 50;


--transaction 처리를 하는 명령어 (transaction : 하나의 논리적인 작업)
rollback; --작업을 끝내고 db에 반영한다.

commit; --db에 반영한다.


--department_id가 90번이
--Diana직원과 같은 부서, 같은 salary로 변경한다.
select department_id
from employees
where first_name = 'Diana';


update tbl_update
set department_id = (
                select department_id
                from employees
                where first_name = 'Diana'),
        salary =(
                         select salary
                          from employees
                           where first_name = 'Diana')
where department_id = 90;

delete from tbl_update
where department_id = (
                select department_id
                from employees
                where first_name = 'Diana');

create table emp02
as
select employee_id empno, first_name ENAME, job_id JOB,manager_id MGR,
            hire_date HIREDATE, salary SAL, commission_pct COMM, department_id DEPTNO
from employees
where department_id = 60;



--EMP02에 있는 1건 수정하기
select * from emp02;
select * from emp01;

update emp02 set job='aa', sal = 9999, comm=0.1, deptno=88
where empno=103;
--EMP02에 신규를 삽입하기
insert into emp02 values(111,'jj','bb',100, sysdate, 8888,0.2, 77);


select * from emp01;

MERGE INTO EMP01
USING EMP02
ON(EMP01.EMPNO=EMP02.EMPNO)
WHEN MATCHED THEN
UPDATE SET
EMP01.ENAME=EMP02.ENAME,
EMP01.JOB=EMP02.JOB,
EMP01.MGR=EMP02.MGR,
EMP01.HIREDATE=EMP02.HIREDATE,
EMP01.SAL=EMP02.SAL,
EMP01.COMM=EMP02.COMM,
EMP01.DEPTNO=EMP02.DEPTNO
WHEN NOT MATCHED THEN
INSERT VALUES(EMP02.EMPNO, EMP02.ENAME, EMP02.JOB, 
EMP02.MGR, EMP02.HIREDATE, EMP02.SAL, 
EMP02.COMM, EMP02.DEPTNO);



--Lab4

1. 'IT'부서에서 근무하는 직원들의 이름, 급여, 입사일을 조회하시오.
select * from departments;--60

select first_name, salary, hire_date
from employees
where department_id =( select department_id
                                    from departments
                                    where department_name = 'IT');
                                    
select first_name, salary, hire_date
from employees join departments using(department_id) 
where department_id = 'IT';


2. 'Alexander' 와 같은 부서에서 근무하는 직원의 이름과 부서id를 조회하시오.
select * from employees
where first_name = 'Alexander'; --2명

select emp.first_name,emp.last_name, emp.department_id, emp.department_id
from employees emp, employees alx
where emp.department_id = alx.department_id
and alx.first_name = 'Alexander' ;



3. 80번부서의 평균급여보다 많은 급여를 받는 직원의 이름, 부서id, 급여를 조회하시오.

select first_name, department_id, salary
from employees 
where salary > (
                select avg(salary)
                from employees
                where department_id = 80);
                
--평균 급여도 출력
select first_name, department_id, salary, (
                                                                select avg(salary)
                                                                from employees
                                                                where department_id = 80)
from employees 
where salary > (
                select avg(salary)
                from employees
                where department_id = 80);
                
--평균 급여도 출력 2
select first_name, department_id, salary,dept80.sal80
from employees, (
                            select avg(salary) sal80
                            from employees
                            where department_id = 80) dept80
where salary > dept80.sal80;


4. 'South San Francisco'에 근무하는 직원의 최소급여보다 급여를 많이 받으면서 
50 번부서의 평균급여보다 많은 급여를 받는 직원의 이름, 급여, 부서명, 
부서id를 조회하시오.

select first_name, salary, department_name,department_id, location_id
from employees left outer join departments using(department_id)
                        
where salary > (
            select min(salary)
            from employees join departments using(department_id) 
                                    join locations using (location_id)
            where city =  'South San Francisco' 
            )
and salary > (
                select avg(salary)
                from employees
                where department_id = 50
);



--lab5
-- SELF JOIN
1. 직원의 이름과 관리자 이름을 조회하시오.

select emp.first_name 직원이름, admin.first_name 관리자이름
from employees emp, employees admin
where emp.manager_id = admin.employee_id;

2. 직원의 이름과 관리자 이름을 조회하시오.
관리자가 없는 직원정보도 모두 출력하시오.


select emp.first_name 직원이름, admin.first_name 관리자이름
from employees emp, employees admin
where emp.manager_id = admin.employee_id(+);
----------------------------------

select emp.first_name 직원이름, admin.first_name 관리자이름
from employees emp left outer join employees admin on(emp.manager_id = admin.employee_id);



3. 관리자 이름과 관리자가 관리하는 직원의 수를 조회하시오.
단, 관리직원수가 3명 이상인 관리자만 출력되도록 하시오.

select admin.first_name 관리자이름, count(emp.first_name) 
from employees emp, employees admin
where emp.manager_id = admin.employee_id
group by admin.first_name 
having count(emp.first_name)>3
order by 1;


--LAB6

1. 직원들의 이름, 입사일, 부서명을 조회하시오.
단, 부서가 없는 직원이 있다면 그 직원정보도 출력결과에 포함시킨다.
그리고 부서가 없는 직원에 대해서는 '<부서없음>' 이 출력되도록 한다.
(outer-join , nvl() )

select first_name, hire_date, 
nvl(department_name, '<부서없음>') department_name,
nvl(department_name, '<부서없음>') department_name
from employees lefr join departments using(department_id);





2. 직원의 직책에 따라 월급을 다르게 지급하려고 한다.
직책에 'Manager'가 포함된 직원은 급여에 0.5를 곱하고
나머지 직원들에 대해서는 원래의 급여를 지급하도록 한다. 
적절하게 조회하시오. (decode)

select first_name, job_id, salary, job_title,
decode(substr(job_title,-7,7), 'Manager', salary*0.5, salary) salary2,
case when job_title like '%Manager' then salary*0.5 else salary end salary3
from emplyees join jobs using(job_id);

update employees
set salary =(select decode(substr(job_title,-7,7),'Manager',salary*0.5,salary)
                    from employees join  jobs using (job_id)

);


3. 각 부서별로 최저급여를 받는 직원의 이름과 부서id, 급여를 조회하시오.

select first_name, department_id, salary
from employees
where (department_id, salary) in (
            select department_id, min(salary)
            from employees
            group by department_id
);




4. 각 직급별(job_title) 인원수를 조회하되 사용되지 않은 직급이 있다면 해당 직급도
출력결과에 포함시키시오. 그리고 직급별 인원수가 3명 이상인 직급만 출력결과에 포함시키시오.

select job_title,count(*) 인원수
from employees right outer join jobs using(job_id)
group by job_title
having count(*) >= 3;
 

5. 각 부서별 최대급여를 받는 직원의 이름, 부서명, 급여를 조회하시오.

select first_name,department_name,salary
from employees join departments using(department_id)
                where (department_id, salary) in (
                select department_id,max(salary)
                from employees
                group by department_id);
---inline view
select first_name,department_name,salary
from employees , departments ,(
select deparment_id, max(salary) maxsal
from employees
group by department_id) deptSalMax
where employees.department_id = departments.department_id
and employees.department_id = deptSalMax.department_id
and employees.salary = deptSalMax.maxsal;


--6번 Scalar subquery, 상관형 subquery
6. 직원의 이름, 부서id, 급여를 조회하시오. 그리고 직원이 속한 해당 부서의 
최소급여를 마지막에 포함시켜 출력 하시오.

select first_name, department_id, salary,(
                                                                select min(salary)
                                                                from employees
                                                                where department_id = mainEmp.department_id
                                                            )
from employees mainEmp;


select first_name, department_id, salary, sal
from employees join(
                            select department_id, min(salary) sal
                            from employees
                            group by department_id) deptminsal using (department_id)

select department_id, min(salary)
from employees
group by department_id;



--LAB7
1. 급여를 가장 많이 받는 상위 5명의 직원 정보를 조회하시오.
--pseudo 칼럼 (실제칼럼은 아닌데 칼럼인것처럼 행동하는 객체)

select*from(

select rownum rr, aa.*
from( 
                select rownum, first_name, salary       
                from employees                                
                order by salary desc ) aa ) bb                     
where rr <= 5;








2. 커미션을 가장 많이 받는 상위 3명의 직원 정보를 조회하시오.

select rownum, aa.*
from(
            select first_name, salary, commission_pct
            from employees
            order by commission_pct desc nulls last, salary desc ) aa
where rownum <= 3;







3. 월별 입사자 수를 조회하되, 입사자 수가 5명 이상인 월만 출력하시오.

select to_char(hire_date, 'mm') 월,count(*) "입사자 수"
from employees
group by to_char(hire_date,'mm')
having count(*) >= 5;



4. 년도별 입사자 수를 조회하시오. 
단, 입사자수가 많은 년도부터 출력되도록 합니다.

select to_char(hire_date, 'yyyy') 월,count(*) "입사자 수"
from employees
group by to_char(hire_date,'yyyy')
order by 2 desc;


--0315

select * from user_constraints
where table_name = 'TBL_TEST1';

drop table tbl_test1;

create table tbl_test1(id number constraint pk_tbl_test1_id primary key,
                                name varchar2(20) not null,
                                phone_number varchar2(13) constraint u_phone unique
);

insert into tbl_test1(id) values(1,'aa');
insert into tbl_test1(id, name) values(1,'aa');

select * from user_cons_columns where table_name = 'TBL_TEST1';

--주문( 고객, 상품, 일자,가격)
create table tbl_order(고객 number, 상품 number, order_date date, price number,
          constraint pk_order primary key(고객, 상품)                  
);

--primary key = not null + unique
insert into tbl_order values(1,100,sysdate,1000);

select * from user_constraints
where table_name = 'TBL_ORDER';

select * from user_cons_columns where table_name = 'TBL_ORDER';




select * from departments;
select * from employees;

select * from user_constraints where table_name = 'DEPARTMENTS';
select * from user_constraints where table_name = 'EMPLOYEES';
select * from user_cons_columns where table_name = 'EMPLOYEES';


--parent key 없기 때문에 실패
update employees
set department_id = 1; 

alter trigger UPDATE_JOB_HISTORY disable;


drop table tbl_child;

create table tbl_parent(deptid number primary key, deptname varchar2(20));

create table tbl_child(empid number primary key, empname varchar2(20),
    deptid number constraints tbl_child_deptid_FK REFERENCES tbl_parent(deptid),
    salary number constraints tbl_child_salary_check check(salary between 1000 and 2000 ),
    gender char(1) constraints tbl_child_gender_check check (gender in ('M','F') ),
    phone_number char(13) unique,
    국적 varchar2(30) default '한국'
        );

insert into tbl_child(empid,empname, deptid, salary, gender, phone_number ) values(1,'aa',10, null, null, null);
insert into tbl_child values(2,'bb',10, 1500, 'M', '12345');
insert into tbl_child values(3,'bb',10, 1500, 'M', '12345');


insert into tbl_parent(deptid, deptname) values(10, '개발부');
insert into tbl_parent(deptid, deptname) values(20, '영업부');
insert into tbl_parent(deptid, deptname) values(30, '총무부');

insert into tbl_child(empid, empname, deptid) values(1,'aa',100);
insert into tbl_child values(1,'aa',10);

select * from tbl_child;

--subquery를 이용해서 table생성, notnull만 복사

create table tbl_emp_backup
as
select * from employees
where department_id = 60;

select * from tbl_emp_backup;
select * from user_ constraints where table name = 'TBL_EMP_BACKUP';

update tbl_emp_backup
set department_id = 1;

rollback;

--제약조건추가
alter table  tbl_emp_backup
add constraints tbl_emp_backup_PK primary key(employee_id);

alter table  tbl_emp_backup
add constraints tbl_emp_backup_FK 
foreign key(department_id) references departments(department_id);

select* from tbl_emp_backup;

------------------------------------------

desc employees;

create or replace view empView1
as
select employee_id, first_name, last_name, email,hire_date,job_id, department_id
from employees
where department_id = 60; -- with check option;

select * from user_views;

update empView1
set department_id=100;

select empView1.*, jobs.job_title
from empView1 join jobs on(empView1.job_id= jobs.job_id);

update empView1
set email = 'wed@djdghd'
where employee_id = 103;
rollback;
commit;

select * from empView1;

--force, noforce(default) : 체크해서 문제 없으면 생성

create or replace force view view_join4
as 
select first_name, department_name, city, country_name, department_id
from employees join  departments using (department_id)
                        join locations using (location_id)
                        join countries using (country_id);

select * from empView1;




create sequence seq_board;

create table tbl_board(bno number primary key,
                                title varchar(50) not null, 
                                contents varchar(2000), 
                                writer varchar(30) not null);
                                
insert into tbl_board (bno, title, contents, writer) values (seq_board.nextval,'수요일', 'SQL배우기', 'jj');

select* from tbl_board
where title = '수요일';

create index idx_tbl_board_title
on tbl_board(title );


drop table tbl_board;


select * from user_ind_columns;

show recyclebin;
purge recyclebin;

select * 
from user_ind_columns
where table_name = 'EMPLOYEES';

select * 
from employees
where first_name = initcap('steven') and last_name = initcap('king');


--0316
--복습1 자신의 속한 부서의 평균급여보다 더 적은 급여를 받는 직원들을 조회하시오

select first_name,salary
from employees outeremp
where salary <( 
                        select avg(salary) 
                        from employees
                        where department_id = outeremp.department_id
                        );                        
                        
--2) inlineview (from 절)
select*
from employees,(
                            select department_id , avg(salary) sal
                            from employees
                            group by department_id  ) inlineview_emp
where employees.department_id = inlineview_emp.department_id
and employees.salary < inlineview_emp.sal;


--jdbc로 작성해보기
create sequence seq_employee start with 300;

insert into employees(employee_id, last_name, email, hire_date, job_id) 
values(seq_employee.nextval, 'aa', 'bb', sysdate, 'IT_PROG');

desc employees

select* from employees;

rollback;

update employees
set EMAIL = ?, DEPARTMENT_ID=?, JOB_ID=?, SALARY=?
where EMPLOYEE_ID = ?





EMPLOYEE_ID
 FIRST_NAME
 LAST_NAME
 EMAIL
 PHONE_NUMBER
 HIRE_DATE
 JOB_ID
 SALARY
 COMMISSION_PCT
 MANAGER_ID
 DEPARTMENT_ID
 
 select * from employees;

select * from user_constraints
where table_name = 'EMPLOYEES';


select * from user_TAB_PRIVS_MADE;


--복습2(복합키를가진 table을 FK로 설정하기)



drop table tbl_parent cascade constraints;
drop table tbl_child cascade constraints;


create table tbl_parent ( pid1 number, pid2 number, pname varchar2(30),
        constraint pk_tbl_parent primary key (pid1, pid2)
        )
delete from tbl_parent where pid1=1 and pid2=1;
        
insert into tbl_parent values (1,1,'aa');
insert into tbl_parent values (1,2,'bb');

create table tbl_child(ch_id number primary key, ch_name varchar2(20),
        pid1 number, pid2 number,
        constraint fk_parent foreign key(pid1, pid2) references tbl_parent(pid1, pid2) on delete cascade
)

insert into tbl_child values(100,'AA',1,1);

select * from tbl_child;

commit;


declare
begin
    dbms_output_line('Hello');
end;
/





































































































