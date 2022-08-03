-- 1. Escreva uma query que exiba o maior salário da tabela.
select salary 
from hr.employees 
order by salary DESC 
limit 1;
-- or
select max(salary) 
from hr.employees;

-- 2. Escreva uma query que exiba a diferença entre o maior e o menor salário.
select max(salary) - min(salary) 
from hr.employees;

-- 3. Escreva uma query que exiba a média salarial de cada job_id, ordenando pela média salarial em ordem decrescente.
select job_id, AVG(salary) as media_salarial
from hr.employees
group by job_id
order by media_salarial DESC;

-- 4. Escreva uma query que exiba a quantidade de dinheiro necessária para realizar o pagamento de todas as pessoas funcionárias.
select sum(salary) 
from hr.employees;

-- 5. Escreva uma query que exiba quatro informações: o maior salário, o menor salário, a soma de todos os salários e a média dos salários. Todos os valores devem ser formatados para ter apenas duas casas decimais.
select 
  max(salary), 
  min(salary), 
  sum(salary), 
  round(avg(salary), 2)
from hr.employees;

-- 6. Escreva uma query que exiba a quantidade de pessoas que trabalham como pessoas programadoras (it_prog).
select count(*) as qnt_programadores 
from hr.employees 
where job_id = 'it_prog';

-- 7. Escreva uma query que exiba a quantidade de dinheiro necessária para efetuar o pagamento de cada profissão (job_id).
select 
	job_id as profissao, 
	sum(salary) as soma_salario
from hr.employees
group by job_id;

-- 8. Utilizando a query anterior, faça as alterações para que seja exibido somente a quantidade de dinheiro necessária para cobrir a folha de pagamento das pessoas programadoras (it_prog).
select 
	job_id as profissao, 
	sum(salary) as soma_salario
from hr.employees
group by job_id
having job_id = 'it_prog';

-- 9. Escreva uma query que exiba em ordem decrescente a média salarial de todos os cargos, exceto das pessoas programadoras (it_prog).
select 
	job_id as profissao,
	avg(salary) as media_salarial
from hr.employees
group by job_id
having not job_id = 'it_prog'
order by media_salarial desc;
-- or
select 
	job_id as profissao, 
	avg(salary) media_salarial
from hr.employees
where job_id <> 'it_prog'
group by job_id
order by media_salarial desc;

-- 10. Escreva um query que exiba média salarial e o número de funcionários de todos os departamentos com mais de dez funcionários. Dica: agrupe pelo department_id.
select 
	department_id,
	avg(salary) as media_salarial,
  count(*) as num_de_funcionarios
from hr.employees
group by department_id
having num_de_funcionarios > 10;

-- 11. Escreva uma query que atualize a coluna phone_number, de modo que todos os telefones iniciados por 515 agora devem iniciar com 777.
set SQL_SAFE_UPDATES = 0;

update hr.employees
set phone_number = replace(phone_number, '515', '777')
where phone_number LIKE '515%';

set SQL_SAFE_UPDATES = 1;

-- 12. Escreva uma query que só exiba as informações dos funcionários cujo o primeiro nome tenha oito ou mais caracteres.

select *
from hr.employees
where length(first_name) > 7;

-- 13. Escreva uma query que exiba as seguintes informações de cada funcionário: id, primeiro nome e ano no qual foi contratado (exiba somente o ano).

select 
	employee_id, 
  first_name,
  year(hire_date)
from hr.employees;

-- 14. Escreva uma query que exiba as seguintes informações de cada funcionário: id, primeiro nome e dia do mês no qual foi contratado (exiba somente o dia).

select 
	employee_id, 
  first_name,
  day(hire_date)
from hr.employees;

-- 15. Escreva uma query que exiba as seguintes informações de cada funcionário: id, primeiro nome e mês no qual foi contratado (exiba somente o mês).

select 
	employee_id, 
  first_name,
  month(hire_date)
from hr.employees;

-- 16. Escreva uma query que exiba os nomes dos funcionários em letra maiúscula.

select 
	ucase(concat(first_name, " ", last_name)) as nome_completo
from hr.employees;

-- 17: Escreva uma query que exiba o sobrenome e a data de contratação de todos os funcionário contratados em julho de 1987.

select 
  last_name,
  hire_date
from hr.employees
where hire_date like '1987-07%';

-- or

select 
  last_name,
  hire_date
from hr.employees
where hire_date between '1987-07-01' and '1987-07-31';

-- Ou

select 
  last_name,
  hire_date
from hr.employees
where MONTH(hire_date)= 7 and YEAR(hire_date) = 1987;

-- 18: Escreva uma query que exiba as seguintes informações de cada funcionário: nome, sobrenome, tempo que trabalha na empresa (em dias).

select 
	first_name,
    last_name,
    datediff(current_date(), hire_date) as dias_como_empregado
from hr.employees;
