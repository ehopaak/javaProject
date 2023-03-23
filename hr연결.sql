--��ҹ��ڱ��� ����
--������������ �ۼ�����
--���峡��;
--select * *�� ���Į���� �ǹ�
--invalid identifier : �ĺ��� ���� (�ĺ��� --> Į���̸�, table�̸�)
--���ڰ��� �ݵ�� ''�� ����Ѵ�.
--"table or view does not exist"
--Oracle�� �����ͻ������ִ�.. �����ͻ����� ���̺��̸��� �빮�ڷ� �����س��´�.
--���� ��ҹ��� �����Ѵ�.

desc employees;         --���̺�����Ȯ��   
select * from tab;      --���̺�� �˻�
select * from employees;

--from "EMPLOYEES";


select DISTINCT DEPARTMENT_ID
FROM employees;

--���� ���� : null
--null���� ����ϸ� null
--null�� ��ü�� �ʿ䰡 �ִ�. nvl(�񱳰�,��ü��)
--Ư�����ڰ� ���Ե� �ĺ����̸��� ""���� ���Ѵ�.
--��Ī�� ���� as�� ������ �����ϴ�.
--���Ῥ���ڴ� +�� �ƴϴ�. orcle�� ||�̴�. mysql�� concat()

select employee_id ������ȣ, first_name||' '||last_name �̸�, salary, commission_pct,
       concat(concat(first_name,' '), last_name) �̸�2,
       salary+ salary*nvl(commission_pct,0) "Ŀ�̼� ����޿�",        --�ؼ�2
       hire_date
from employees;     --�ؼ�1

--distinct�� ����Į������ �������� ������ ����
select distinct department_id, job_id
from employees;

--����ö
select employee_id, first_name, last_name, salary �޿�  --�ؼ�3
from employees  --�ؼ�1
where salary >= 10000;  --�ؼ�2
order by 4 desc; --�ؼ�4

--order by Į���̸� �Ǵ� ���� �Ǵ� select����(SQL�� ������ 1���ͽ���)
--where salary >= 10000;  --�ؼ�2
--order by salary desc; --�ؼ�4

-------------------------------------------------
select Į���̸��� --�ؼ�3
from table �̸���  --�ؼ�1
where ������ --�ؼ�2
order by Į����; --�ؼ�4
-------------------------------------------------

-->RR���� : >50 �� 1900��� �ǹ�, <50 2000��� �ǹ� 
select employee_id,first_name, salary, to_char(hire_date, 'yyyy/mm/dd hh:mi:ss') �Ի���
, department_id--�ؼ�3
from employees  --�ؼ�1
where salary >= 10000 --�ؼ�2
and department_id =80
and first_name = 'Lisa'
order by hire_date asc, salary desc; --�ؼ�4

-------------------------------------------------

--DUAL table�� Oracle���� �����ϴ� dummy table
desc DUAL;
select*from dual;

select distinct 1+2,sysdate, floor(10.9)�����ǹ���,ceil(10.1) �����ǿø�,
    round(35.678)�����ιݿø�,round(35.678,1)�ݿø�2,round(35.678,-1)�ݿø�3
from dual;
-------------------------------------------------
--����� Ȧ���� ������ ���϶�
select *
from EMPLOYEES;
where mod (EMPLOYEE_ID,2)= 1

select first_name, upper(first_name), lower(first_name),initCap(email)
from EMPLOYEES;

--first_name�� david�� �˻��Ѵ�.
--���࿡ first_nameĮ������ ����(index)�� �����Ǿ��־��ٸ� �Լ��� �̿������� index�� ������. (index���Ұ�.
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
select first_name,upper(first_name),lower(first_name),initCap(email),length('�ѱ�'),lengthB('�ѱ�')
from EMPLOYEES;

----------------------------------------------------
--�޿��� 15000 �̻��� �������� �̸�, �޿�, �μ�id�� ��ȸ�Ͻÿ�.
select first_name, salary, department_id
from employees
where salary >=15000; 


----------------------------------------------------
--���� �߿��� ������ 170000 �̻��� �������� �̸�, ������ ��ȸ�Ͻÿ�.  ������ �޿�(salary)�� 12�� ���� ���Դϴ�.
select first_name, salary*12 ���� 
from employees
where salary*12 >=170000;

----------------------------------------------------
--���� �߿��� �μ�id�� ���� ������ �̸��� �޿��� ��ȸ�Ͻÿ�.
--null�� ���� ���� �̹Ƿ� =�����ڷ� �񱳺Ұ�
select first_name, salary
from employees
where department_id is null;
----------------------------------------------------
--2004�� ������ �Ի��� ������ �̸�, �޿�, �Ի����� ��ȸ�Ͻÿ�.
select first_name,salary,hire_date
from employees
where hire_date <='2004/12.31'; --�ڵ�����ȯ


select first_name,salary,hire_date
from employees
where to_char(hire_date,'yyyy') <='2004';

----------------------------------------------------
--1. 80, 50 �� �μ��� ���������鼭 �޿��� 13000 �̻��� ������ �̸�, �޿�, �μ�id �� ��ȸ�Ͻÿ�.
--�������� �켱���� not and or

select first_name,salary,department_id
from employees
where (department_id=80 or department_id=50) and salary >=13000; 

2. 2005�� ���Ŀ� �Ի��� ������ �߿��� �޿��� 1300 �̻� 20000 ������ �������� 
�̸�, �޿�, �μ�id, �Ի����� ��ȸ�Ͻÿ�.

select employee_id, first_name ,salary, department_id, hire_date
from employees
where to_char(hire_date,'yyyy') >= '2005' and salary >= 1300 and salary <= 20000;

---111�� ������ �޿� 7700�̾��� 1500���� �����ϱ�
update employees
set salary = 7700
where employee_id = 111;
commit;

select * from v$nls_parameters;



-- SQL �񱳿����� --
1. 80, 50 �� �μ��� ���������鼭 �޿��� 13000 �̻��� ������ �̸�, �޿�, �μ�id
�� ��ȸ�Ͻÿ�.


2. 2005�� ���Ŀ� �Ի��� ������ �߿��� �޿��� 1300 �̻� 30000 ������ �������� 
�̸�, �޿�, �μ�id, �Ի����� ��ȸ�Ͻÿ�.




3. 2005�⵵ �Ի��� ������ ������ ����Ͻÿ�.

select employee_id, first_name ,salary, department_id, hire_date
from employees
where to_char(hire_date,'yyyy')='2005';

4. �̸��� D�� �����ϴ� ������ �̸�, �޿�, �Ի����� ��ȸ�Ͻÿ�.

select first_name, salary ,hire_date
from employees
where substr(first_name,1,1)='D';



5. 12���� �Ի��� ������ �̸�, �޿�, �Ի����� ��ȸ�Ͻÿ�.

select first_name ,salary,  hire_date
from employees
where to_char(hire_date,'mm')='12';

----indexã�� instr(first_name,'a',������ġ,���°)
select first_name,instr(first_name,'a'), instr(first_name,'a',2,2)
from employees;

5. �̸��� �� ��° �ڸ��� R�� ������ ����� �˻��ϱ� ���ؼ� ���ϵ�ī�� _ �� LIKE �����ڸ� ����Ͽ� ������ ���� ǥ���� �� �ֽ��ϴ�.
-- _�� ������ ���� 1��, %�� �����ǹ��� 0���̻�
select first_name
from employees
where first_name like '__r%';


6. �̸��� le �� �� ������ �̸�, �޿�, �Ի����� ��ȸ�Ͻÿ�.
select first_name ,salary,  hire_date
from employees
where first_name like '%le%';



7. �̸��� m���� ������ ������ �̸�, �޿�, �Ի����� ��ȸ�Ͻÿ�.
select first_name ,salary,  hire_date
from employees
where first_name like '%m';



8. �̸��� ����° ���ڰ� r�� �̸�, �޿�, �Ի����� ��ȸ�Ͻÿ�.
select first_name ,salary,  hire_date
from employees
where first_name like '__r%';

select first_name ,salary,  hire_date
from employees
where substr(first_name,3,1) = 'r';


9. Ŀ�̼��� �޴� ������ �̸�, Ŀ�̼�, �޿��� ��ȸ�Ͻÿ�.
select first_name ,commission_pct, salary  
from employees
where commission_pct is not null;



10. Ŀ�̼��� ���� �ʴ� ������ �̸�, Ŀ�̼�, �޿��� ��ȸ�Ͻÿ�.

select first_name ,commission_pct, salary  
from employees
where commission_pct is null;


05�⵵�� �Ի��� ������ �˾Ƴ��� ���� SUBSTR �Լ��� �̿��Ͽ� 
HIREDATE �÷����� ù ���ں��� 2���� �����Ͽ� �� ���� 05������ üũ�ϴ� ������ε� ���� ������ �ϼ���.

select *
from employees
where substr(hire_date,1,2)='05';

select *
from employees
where to_char(hire_date,'RR')='05';







������ �̸��� E�� ������ ����� �˻��� ������ �սô�. 
SUBSTR �Լ��� �̿��Ͽ� ENAME �÷��� ������ ���� �Ѱ��� �����ؼ� 
�̸��� E�� ������ ����� �˻��� ������ �Ͻÿ�.
<��Ʈ> ���� ��ġ�� -1�� �ְ� ������ ���� ������ 1�� �ָ� �˴ϴ�. 

select *
from employees
where substr(first_name,-1)='e';


11. 2000��뿡 �Ի��ؼ� 30, 50, 80 �� �μ��� ���������鼭, 
�޿��� 5000 �̻� 17000 ���ϸ� �޴� ������ ��ȸ�Ͻÿ�. 
��, Ŀ�̼��� ���� �ʴ� �������� �˻� ��󿡼� ���ܽ�Ű��, ���� �Ի��� ������ 
���� ��µǾ�� �ϸ� �Ի����� ���� ��� �޿��� ���� ������ ���� ��µǷ� �Ͻÿ�.

select first_name,salary,commission_pct
from employees
where substr(hire_date,1,1)=2 
and department_id in (30,50,80)
and salary >= 5000 and salary <=17000 
and commission_pct is not null
order by hire_date, salary desc;

--ASC : null�� �ڿ����� ��å.
--DESC : null�� �տ����� ��å.
select *
from employees
order by commission_pct desc nulls last;
--order by commission_pct nulls first;

select lpad(first_name,8,'#'), rpad(first_name,8,'#'), 
    '!'||ltrim('    oracle')||'!' ����, '!'||rtrim('    oracle    ')||'!' ������,
    '!'||trim('    oracle    ')||'!' ����,
    '!'||trim('o' from 'oooooracleoooo')||'!' 
    
from employees;



select * from tab;


select * from countries;
select * from employees;

first_name ,salary,  hire_date

1. �̸��� 'adam' �� ������ �޿��� �Ի����� ��ȸ�Ͻÿ�.
select first_name, salary, hire_date
from employees
where first_name =initCap('adam');


2. ���� ���� 'united states of america' �� ������ ���� �ڵ带 ��ȸ�Ͻÿ�.
select country_id
from countries
where lower(country_name) = 'united states of america' ;


3. 'Adam�� �Ի����� 95/11/02 �̰�, �޿��� 7000 �Դϴ�.' �̷� ������ ���������� ��ȸ�Ͻÿ�.

select first_name||'�� �Ի�����'|| hire_date||'�̰�, �޿���'|| salary||'�Դϴ�.'
from employees
where first_name ='Adam';


4. �̸��� 5���� ������ �������� �̸�, �޿�, �Ի����� ��ȸ�Ͻÿ�.
select first_name, salary, hire_date
from employees
where length(first_name)<=5;



5.2006�⵵�� �Ի��� ������ �̸�, �Ի����� ��ȸ�Ͻÿ�.
select first_name, hire_date
from employees
where to_char(hire_date,'yyyy')='2006';




6. 7�� �̻� ��� �ټ��� �������� �̸�, �Ի���, �޿�, �ٹ������� ��ȸ�Ͻÿ�.
select first_name, hire_date, salary, trunc(months_between(sysdate,hire_date)/12)
from employees
where trunc(months_between(sysdate,hire_date)/12) >= 7;

=============Group �Լ�==================


7. �� �μ��� �ο����� ��ȸ�ϵ� �ο����� 5�� �̻��� �μ��� ��µǵ��� �Ͻÿ�.

select department_id, count(*)
from employees
group by department_id
having count(*) >= 5;
 





8. �� �μ��� �ִ�޿��� �ּұ޿��� ��ȸ�Ͻÿ�.
   ��, �ִ�޿��� �ּұ޿��� ���� �μ��� ������ �Ѹ��� ���ɼ��� ���⶧���� 
   ��ȸ������� ���ܽ�Ų��.

select max(salary),min(salary)
from employees
group by department_id
having max(salary) <> min(salary);



   
9. �μ��� 50, 80, 110 ���� ������ �߿��� �޿��� 5000 �̻� 24000 ���ϸ� �޴�
   �������� ������� �μ��� ��� �޿��� ��ȸ�Ͻÿ�.
   ��, ��ձ޿��� 8000 �̻��� �μ��� ��µǾ�� �ϸ�, ��°���� ��ձ޿��� ����
   �μ����� ��µǵ��� �ؾ� �Ѵ�.
   
select department_id, avg(salary)
from employees
where department_id in(50,80,110) 
and salary between 5000 and 24000
group by department_id
having avg(salary) >= 8000
order by avg(salary) desc;




--���ڿ���
select sysdate, hire_date,
            floor((sysdate- hire_date)/365) �⵵1,
            floor(months_between(sysdate, hire_date)/12) �⵵2,
            add_months(hire_date,1) "1���� ��",
            last_day(hire_date) ��������,
            next_day(hire_date,'������') ó�����ÿ���,
            round(hire_date,'month') "�ݿø�1-16�̻�",
            trunc(hire_date,'month') "����1-�������� ����",
            first_name, salary
from EMPLOYEES;
--where
order by

select sysdate, to_char(sysdate,'yyyy/mm/dd/hh:mi:ss DAY DY MON AM/PM'),
         to_char(1000000000,'L999,9999,999'),
         to_date(20220101,'YYYYMMDD')
from dual;

--rr/mm/dd  rrmmdd rr�� 50�̻��̸� 19, �̸��̸�20
--nls_date_format������ �ٲܼ��ִ�. alter session set nls_date_format='';

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
         salary+salary*nvl(commission_pct,0) �Ǽ��ɾ�,
          salary+salary*nvl2(commission_pct, commission_pct,0) �Ǽ��ɾ�2,
          nvl2(commission_pct, 'Ŀ�̼�����','Ŀ�̼Ǿ���') "nvl2����"
from EMPLOYEES
order by commission_pct; --nulls first


select first_name, manager_id, nvl(to_char(manager_id),'CEO'),
         nvl2(manager_id, to_char(manager_id),'CEO'), 
         department_id,
         nvl(to_char(department_id),'�μ�����')"nvl ����", 
         decode(department_id,10,'A',60,'B',90,'C','D') �μ�decode,
         salary, case  when salary>=10000 then '�ſ츹��'
                           when salary>=7000 then '����'
                           when salary>=5000 then '�⺻'
                            else '����'
                           end "case����",
                           case when first_name like 'A%' then 'A�� ����' else '�ƴ�' end "case����2",
                           case when first_name like '%a' then 'a�� ����' else '�ƴ�' end "case����2"
from EMPLOYEES;


--------------Group
--�����Լ�(Į���̸�): ���� null�� �����Ѵ�.
--�����Լ� (*) : null������
--group by ���� ������ ��ü�� ���� �����̴�.
select sum(salary), sum(commission_pct), avg(salary), count(salary), sum(salary)/count(salary),
         count(salary), count(*) ��ü�Ǽ�, count(commission_pct), count(manager_id)

from employees;


select max(hire_date) "���� �ֱٿ� �Ի�", min(hire_date) "���� ������ �Ի�"
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


--�����Լ��� ������� ���� Į���� select���� �ִٸ� �ݵ�� group by���� �����ؾ��Ѵ�.
--�μ��� salary ���
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


--100�� ������ �ٹ��ϴ� �μ��̸��� �˰�ʹ�

select *
from employees
where employee_id = 100;

select *
from departments
where department_id = 90;
--2���� ��ħ

--DB Vendor ����
select employee_id, first_name, departments.department_id
from employees, departments
where employees.department_id = departments.department_id(+)
order by 1;

--join �ϰ����ϴ� Į���� ��ġ�ϴ� ��� ���
select employee_id, first_name, department_name, department_id
from employees join departments using(department_id);

--join �ϰ����ϴ� Į���� ��ġ���� �ʴ� ��� ���
select employee_id, first_name, department_name, departments.department_id
from employees join departments on(employees.department_id = departments.department_id);

select employee_id, first_name, department_name, departments.department_id
from employees left outer join departments on(employees.department_id = departments.department_id);

select employee_id, first_name, department_name, departments.department_id
from employees full outer join departments on(employees.department_id = departments.department_id);

--������ � �������� �ڼ��� �˰����Ѵ�. job_title, max_salary, min_salary

desc employees;
desc jobs;
--PK (primary key) : NULL�Ұ� + UNIQUE
--FK(Foreign key) : ����Ű, �ٸ����̺� Ȥ�� �ڽ��� table�� pk�� �����Ѵ�.

select employees.first_name, employees.salary, jobs.*
from employees,jobs
where employees.job_id = jobs.job_id;

select employees.first_name, employees.salary, job_id, job_title, max_salary,min_salary
from employees join jobs using(job_id);

select employees.first_name, employees.salary, jobs.*
from employees join jobs on(employees.job_id = jobs.job_id);

--table �̸��� ������
select emp.first_name, emp.salary, jobs.*
from employees emp join jobs on(emp.job_id = jobs.job_id)
where emp.job_id = 'IT_PROG';


--Seattle �� �ٹ��ϰ��ִ� ���� ��ȸ

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


--ACCOUNTING �μ� �Ҽ� ����� �̸��� �Ի����� ����Ͻÿ�.
select first_name, hire_date
from departments join employees using(department_id)
where department_name = initCap('ACCOUNTING');






1.�������� �̸��� ���޸�(job_title)�� ��ȸ�Ͻÿ�.

select first_name, job_title
from employees join  jobs using(job_id);


2.�μ��̸��� �μ��� ���� ���ø�(city)�� ��ȸ�Ͻÿ�.
select department_name, city
from departments join locations using(location_id);


3. ������ �̸��� �ٹ��������� ��ȸ�Ͻÿ�. (employees, departments, locations,countries)
 
select first_name, country_name
from employees join departments using(department_id)
                        join locations using(location_id)
                        join countries using(country_id);


4. ��å(job_title)�� 'manager' �� ����� �̸�, ��å, �μ����� ��ȸ�Ͻÿ�.
 
select first_name, job_title, department_name
from employees join jobs using (job_id)
                       join departments using (manager_id)
where lower(job_title) like '%manager';

5. �������� �̸�, �Ի���, �μ����� ��ȸ�Ͻÿ�.
 
select first_name, hire_date, department_name
from employees join departments using (department_id);
                        

6. �������� �̸�, �Ի���, �μ����� ��ȸ�Ͻÿ�.
��, �μ��� ���� ������ �ִٸ� �� ���������� ��°���� ���Խ�Ų��.
select first_name, hire_date, department_name
from employees left outer join departments using(department_id);



7. ������ �̸��� ��å(job_title)�� ����Ͻÿ�.
��, ������ �ʴ� ��å�� �ִٸ� �� ��å������ ��°���� ���Խ�Ű�ÿ�.

select first_name, job_title
from  employees right outer join jobs using(job_id);

select * from employees;
select * from jobs;


--0314
select count(distinct job_id)
from employees;

select count(*) from jobs;

desc jobs;

insert into jobs values('play','���ϸ��� play',1000,20000);
commit;

select * from jobs;

















--Non equi join (=�̿��� �����ڸ� �̿��ؼ� ����)
create table salgrade( grade char(1) primary key, minsal number, maxsal number);

insert into salgrade values('A',0,5000);
insert into salgrade values('B',5000,15000);
insert into salgrade values('C',15001,20000);
insert into salgrade values('D',20001,30000);
commit;

select * from salgrade;

--�����̸��� �޿��� �޿���  ������
select first_name, salary, grade
from employees, salgrade
where employees.salary between salgrade.minsal and salgrade.maxsal;

select first_name, salary, grade
from employees join salgrade on (salary between minsal and maxsal);

select ����. employee_id, ����.first_name, �Ŵ���.employee_id, �Ŵ���.first_name
from employees ����, employees �Ŵ���
where ����.manager_id = �Ŵ���.employee_id(+)
order by 1;

select ����. employee_id, ����.first_name, �Ŵ���.employee_id, �Ŵ���.first_name
from employees ���� join employees �Ŵ��� on (����.manager_id = �Ŵ���.employee_id);

select ����. employee_id, ����.first_name, �Ŵ���.employee_id, �Ŵ���.first_name
from employees ���� left outer join employees �Ŵ��� on (����.manager_id = �Ŵ���.employee_id);

--�Ŵ����� king �� ������� �̸��� ������ ����Ͻÿ�
select emp.first_name, emp.last_name, emp.manager_id ,jobs.job_title
from employees emp, employees m,jobs
where emp.manager_id = m.employee_id
and emp.job_id = jobs.job_id
and m.last_name = 'King';

select * from employees;

select ����.employee_id, ����.first_name, ����.last_name
from employees ����, employees �Ŵ���, jobs
where ����.manager_id = �Ŵ���.employee_id
and ����.job_id = jobs.job_id
and �Ŵ���.last_name = 'King';

--King ��  ���� id �˾Ƴ���
select* from employees
where first_name = 'Steven' and last_name = 'King';


select employee_id, first_name,last_name
from employees
where manager_id = (select employee_id from employees
                                where first_name = 'Steven' and last_name = 'King');
                                
-- Steven King �� ������ �μ� ���� �ٹ��ϴ� ����� �̸��� ����Ͻÿ�.
--1. Steven�� �ٹ��� �˾Ƴ���
--2. ������ �ٹ���

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
select ����.employee_id, ����.first_name, ����.last_name, ����.department_id
from employees ����, employees ��Ƽ��
where ����.department_id = ��Ƽ��.department_id
and ��Ƽ��.first_name ='Steven'  and ��Ƽ��.last_name = 'King';

--subquery
select *
from emplyees
where department_id = (select department_id from emplyees
                                    where first_name = 'Steven' and last_name = 'King');

--�μ��� ����
desc departments;
desc employees;

--�μ��������, manager_id�� �μ����� �ǹ�, �μ����� �����߿� 1���̴�. (�μ����̸�,�޿�,�Ի���)
--�μ����� ���� �μ��� ��°���� �����Ѵ�.
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


--��������
--Neena�� ������ ������ ���� ����� ����ϴ� SQL ���� �ۼ��� ���ÿ�
--subquery���� subquery�� ����� ���������� ���������� ����...�����࿬����(=,<,>), �����࿬���� (in)
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


--SCOTT�� �޿��� �����ϰų� �� ���� �޴� ��� ��� �޿��� ����Ͻÿ�
-- subquery����� 1�� �̸� ������ �����ڸ� ��� : => , =<, <
-- subquery����� 1�� �̻��̸� ������ �����ڸ� ��� : in, >= All, >All, >=ANY 
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
            where first_name = 'Alexander');    --9000,3100 All�� 9000���� ũ�ų� ������ , any�� 3100���� ũ�ų� ������
            


select salary
from employees
where first_name = 'Neena';


--seattle���� �ٹ��ϴ� ����� �̸��� �μ���
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


-- IT �μ����� �ٹ��ϴ� ��� ����� �̸��� �ݿ��� ����Ͻÿ�

select first_name, salary
from employees
where department_id = (
            select department_id
            from departments
            where department_name = 'IT');


select *
from departments
where department_name = 'IT';

--���ӻ���� Steven King�� ����� �̸��� �޿��� ����Ͻÿ�
select*
from employees
where manager_id = (
            select  employee_id
            from employees
            where last_name = 'King' and first_name = 'Steven');

select  *
from employees
where last_name = 'King' and first_name = 'Steven';

--��� �޿����� �� ���� �޿��� �޴� ����� �˻��ϴ� ����

select * 
from employees
where salary >= any (
                        select avg(salary)
                        from emloyees group by department_id );


--�μ����� ���� �޿��� ���� �޴� ����� ����(��� ��ȣ, ����̸�, �޿�, �μ���ȣ)�� ����Ͻÿ�.(IN ������ �̿�)
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


--����(JOB)�� MANAGER�� ����� ���� �μ��� �μ� ��ȣ�� �μ���� ������ ����Ͻÿ�.
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
--����� �ø��°� ���� 
alter table tbl_emp4 modify (first_name varchar2(30));
--data�� �־ ��������.
alter table tbl_emp4 drop column first_name;


insert into tbl_emp4 values(1,'12345678901234567890','ABC');

drop table tbl_emp4;

desc tbl_employee;

select* from tbl_employee;
--������ ���� ����.
truncate table tbl_emp2;    --�����Ұ�

select * from tbl_emp;
delete from tbl_emp;    --��������
rollback;-- ���󺹱� ����


rename tbl_emp to tbl_employee;

--��ųʸ���
select* from user_tables;
desc user_tables;

select* from all_tables;

select* from dba_tables;

--���������� ����ȵ�
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

--Į���� ���� ���� ������ �Ͻ������� null�̴�.
--��������� null���� �ο�����
insert into tbl_emptest(employee_id, first_name, hire_date) values(4,null,sysdate);
insert into tbl_emptest(employee_id, first_name, hire_date) values(5,'',sysdate);       --''�� null�̴�.


--table�� ���� �����
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


--transaction ó���� �ϴ� ��ɾ� (transaction : �ϳ��� ������ �۾�)
rollback; --�۾��� ������ db�� �ݿ��Ѵ�.

commit; --db�� �ݿ��Ѵ�.


--department_id�� 90����
--Diana������ ���� �μ�, ���� salary�� �����Ѵ�.
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



--EMP02�� �ִ� 1�� �����ϱ�
select * from emp02;
select * from emp01;

update emp02 set job='aa', sal = 9999, comm=0.1, deptno=88
where empno=103;
--EMP02�� �űԸ� �����ϱ�
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

1. 'IT'�μ����� �ٹ��ϴ� �������� �̸�, �޿�, �Ի����� ��ȸ�Ͻÿ�.
select * from departments;--60

select first_name, salary, hire_date
from employees
where department_id =( select department_id
                                    from departments
                                    where department_name = 'IT');
                                    
select first_name, salary, hire_date
from employees join departments using(department_id) 
where department_id = 'IT';


2. 'Alexander' �� ���� �μ����� �ٹ��ϴ� ������ �̸��� �μ�id�� ��ȸ�Ͻÿ�.
select * from employees
where first_name = 'Alexander'; --2��

select emp.first_name,emp.last_name, emp.department_id, emp.department_id
from employees emp, employees alx
where emp.department_id = alx.department_id
and alx.first_name = 'Alexander' ;



3. 80���μ��� ��ձ޿����� ���� �޿��� �޴� ������ �̸�, �μ�id, �޿��� ��ȸ�Ͻÿ�.

select first_name, department_id, salary
from employees 
where salary > (
                select avg(salary)
                from employees
                where department_id = 80);
                
--��� �޿��� ���
select first_name, department_id, salary, (
                                                                select avg(salary)
                                                                from employees
                                                                where department_id = 80)
from employees 
where salary > (
                select avg(salary)
                from employees
                where department_id = 80);
                
--��� �޿��� ��� 2
select first_name, department_id, salary,dept80.sal80
from employees, (
                            select avg(salary) sal80
                            from employees
                            where department_id = 80) dept80
where salary > dept80.sal80;


4. 'South San Francisco'�� �ٹ��ϴ� ������ �ּұ޿����� �޿��� ���� �����鼭 
50 ���μ��� ��ձ޿����� ���� �޿��� �޴� ������ �̸�, �޿�, �μ���, 
�μ�id�� ��ȸ�Ͻÿ�.

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
1. ������ �̸��� ������ �̸��� ��ȸ�Ͻÿ�.

select emp.first_name �����̸�, admin.first_name �������̸�
from employees emp, employees admin
where emp.manager_id = admin.employee_id;

2. ������ �̸��� ������ �̸��� ��ȸ�Ͻÿ�.
�����ڰ� ���� ���������� ��� ����Ͻÿ�.


select emp.first_name �����̸�, admin.first_name �������̸�
from employees emp, employees admin
where emp.manager_id = admin.employee_id(+);
----------------------------------

select emp.first_name �����̸�, admin.first_name �������̸�
from employees emp left outer join employees admin on(emp.manager_id = admin.employee_id);



3. ������ �̸��� �����ڰ� �����ϴ� ������ ���� ��ȸ�Ͻÿ�.
��, ������������ 3�� �̻��� �����ڸ� ��µǵ��� �Ͻÿ�.

select admin.first_name �������̸�, count(emp.first_name) 
from employees emp, employees admin
where emp.manager_id = admin.employee_id
group by admin.first_name 
having count(emp.first_name)>3
order by 1;


--LAB6

1. �������� �̸�, �Ի���, �μ����� ��ȸ�Ͻÿ�.
��, �μ��� ���� ������ �ִٸ� �� ���������� ��°���� ���Խ�Ų��.
�׸��� �μ��� ���� ������ ���ؼ��� '<�μ�����>' �� ��µǵ��� �Ѵ�.
(outer-join , nvl() )

select first_name, hire_date, 
nvl(department_name, '<�μ�����>') department_name,
nvl(department_name, '<�μ�����>') department_name
from employees lefr join departments using(department_id);





2. ������ ��å�� ���� ������ �ٸ��� �����Ϸ��� �Ѵ�.
��å�� 'Manager'�� ���Ե� ������ �޿��� 0.5�� ���ϰ�
������ �����鿡 ���ؼ��� ������ �޿��� �����ϵ��� �Ѵ�. 
�����ϰ� ��ȸ�Ͻÿ�. (decode)

select first_name, job_id, salary, job_title,
decode(substr(job_title,-7,7), 'Manager', salary*0.5, salary) salary2,
case when job_title like '%Manager' then salary*0.5 else salary end salary3
from emplyees join jobs using(job_id);

update employees
set salary =(select decode(substr(job_title,-7,7),'Manager',salary*0.5,salary)
                    from employees join  jobs using (job_id)

);


3. �� �μ����� �����޿��� �޴� ������ �̸��� �μ�id, �޿��� ��ȸ�Ͻÿ�.

select first_name, department_id, salary
from employees
where (department_id, salary) in (
            select department_id, min(salary)
            from employees
            group by department_id
);




4. �� ���޺�(job_title) �ο����� ��ȸ�ϵ� ������ ���� ������ �ִٸ� �ش� ���޵�
��°���� ���Խ�Ű�ÿ�. �׸��� ���޺� �ο����� 3�� �̻��� ���޸� ��°���� ���Խ�Ű�ÿ�.

select job_title,count(*) �ο���
from employees right outer join jobs using(job_id)
group by job_title
having count(*) >= 3;
 

5. �� �μ��� �ִ�޿��� �޴� ������ �̸�, �μ���, �޿��� ��ȸ�Ͻÿ�.

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


--6�� Scalar subquery, ����� subquery
6. ������ �̸�, �μ�id, �޿��� ��ȸ�Ͻÿ�. �׸��� ������ ���� �ش� �μ��� 
�ּұ޿��� �������� ���Խ��� ��� �Ͻÿ�.

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
1. �޿��� ���� ���� �޴� ���� 5���� ���� ������ ��ȸ�Ͻÿ�.
--pseudo Į�� (����Į���� �ƴѵ� Į���ΰ�ó�� �ൿ�ϴ� ��ü)

select*from(

select rownum rr, aa.*
from( 
                select rownum, first_name, salary       
                from employees                                
                order by salary desc ) aa ) bb                     
where rr <= 5;








2. Ŀ�̼��� ���� ���� �޴� ���� 3���� ���� ������ ��ȸ�Ͻÿ�.

select rownum, aa.*
from(
            select first_name, salary, commission_pct
            from employees
            order by commission_pct desc nulls last, salary desc ) aa
where rownum <= 3;







3. ���� �Ի��� ���� ��ȸ�ϵ�, �Ի��� ���� 5�� �̻��� ���� ����Ͻÿ�.

select to_char(hire_date, 'mm') ��,count(*) "�Ի��� ��"
from employees
group by to_char(hire_date,'mm')
having count(*) >= 5;



4. �⵵�� �Ի��� ���� ��ȸ�Ͻÿ�. 
��, �Ի��ڼ��� ���� �⵵���� ��µǵ��� �մϴ�.

select to_char(hire_date, 'yyyy') ��,count(*) "�Ի��� ��"
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

--�ֹ�( ��, ��ǰ, ����,����)
create table tbl_order(�� number, ��ǰ number, order_date date, price number,
          constraint pk_order primary key(��, ��ǰ)                  
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


--parent key ���� ������ ����
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
    ���� varchar2(30) default '�ѱ�'
        );

insert into tbl_child(empid,empname, deptid, salary, gender, phone_number ) values(1,'aa',10, null, null, null);
insert into tbl_child values(2,'bb',10, 1500, 'M', '12345');
insert into tbl_child values(3,'bb',10, 1500, 'M', '12345');


insert into tbl_parent(deptid, deptname) values(10, '���ߺ�');
insert into tbl_parent(deptid, deptname) values(20, '������');
insert into tbl_parent(deptid, deptname) values(30, '�ѹ���');

insert into tbl_child(empid, empname, deptid) values(1,'aa',100);
insert into tbl_child values(1,'aa',10);

select * from tbl_child;

--subquery�� �̿��ؼ� table����, notnull�� ����

create table tbl_emp_backup
as
select * from employees
where department_id = 60;

select * from tbl_emp_backup;
select * from user_ constraints where table name = 'TBL_EMP_BACKUP';

update tbl_emp_backup
set department_id = 1;

rollback;

--���������߰�
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

--force, noforce(default) : üũ�ؼ� ���� ������ ����

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
                                
insert into tbl_board (bno, title, contents, writer) values (seq_board.nextval,'������', 'SQL����', 'jj');

select* from tbl_board
where title = '������';

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
--����1 �ڽ��� ���� �μ��� ��ձ޿����� �� ���� �޿��� �޴� �������� ��ȸ�Ͻÿ�

select first_name,salary
from employees outeremp
where salary <( 
                        select avg(salary) 
                        from employees
                        where department_id = outeremp.department_id
                        );                        
                        
--2) inlineview (from ��)
select*
from employees,(
                            select department_id , avg(salary) sal
                            from employees
                            group by department_id  ) inlineview_emp
where employees.department_id = inlineview_emp.department_id
and employees.salary < inlineview_emp.sal;


--jdbc�� �ۼ��غ���
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


--����2(����Ű������ table�� FK�� �����ϱ�)



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





































































































