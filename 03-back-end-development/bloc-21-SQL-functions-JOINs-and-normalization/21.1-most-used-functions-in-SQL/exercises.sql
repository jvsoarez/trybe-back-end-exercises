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