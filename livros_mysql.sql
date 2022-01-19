CREATE DATABASE LIVROS_MYSQL;
use LIVROS_MYSQL;

CREATE TABLE funcionarios (
codigo INT auto_increment,
nome varchar(255),
email varchar(255),
telefone VARCHAR (255),
cidade varchar(255),
departamento varchar(255),
salario numeric(10,2),
data_admissao DATE,
primary key (codigo)
);

CREATE TABLE presenca (
codigo INT, 
codigo_funcionario INT,
data DATETIME, 
status VARCHAR(30),
primary key (codigo)
);

CREATE TABLE fornecedores ( 
codigo INT auto_increment, 
nome VARCHAR(255),
email VARCHAR (255), 
telefone VARCHAR (255), 
cidade VARCHAR (255),
data_cadastro DATE,
primary key (codigo)
 );
 
alter table fornecedores
add column estado char(2) after cidade;

alter table fornecedores
modify column telefone char(11);
alter table fornecedores
modify column nome varchar(30);
alter table fornecedores
modify column cidade varchar(20);

CREATE TABLE compra(
codigo int auto_increment, 
data_compra datetime,
valor numeric(10,2),
primary key (codigo)
);

CREATE TABLE ferias(
codigo int auto_increment, 
codigo_funcionario int not null,
data_inicio date not null,
data_fim date not null,
primary key (codigo)
);

insert into funcionarios
(codigo, nome, email, telefone, cidade, departamento, salario, data_admissao)
values
(default, 'Emily', 'emy.guidi@gmail.com', '11981194857', 'São Paulo', "Compras", '8540.70', '09/03/17'),
(default, 'Eduardo', 'dudu.br@gmail.com', '11987675640', 'São Paulo', "Compras", '8540.70', '21/03/19' ),
(default, 'Armando', 'ar.pereira@gmail.com', '11923987039', 'São Paulo', "Vendas", '3700.90', '30/05/18');
select *from funcionarios;

update funcionarios set data_admissao="2017-03-17" where codigo="1";
update funcionarios set data_admissao="2019-03-21" where codigo="2";
update funcionarios set data_admissao="2018-05-30" where codigo="3";
insert into presenca
(codigo, codigo_funcionario, data, status)
values
('1', '67', '29-04-21', 'presente'),
('45', '452', '29-04-21', 'falta'),
('236', '21', '29-04-21', 'presente');
select *from presenca;
update presenca set data="2017-04-21" where codigo="1";
update presenca set data="2019-03-21" where codigo="45";
update presenca set data="2018-05-21" where codigo="21";

insert into ferias
(codigo, codigo_funcionario, data_inicio, data_fim)
values
(default, '1', '09-02-21','08-03-21'),
(default, '2', '20-02-21','19-03-21'),
(default, '3', '25-12-20','01-02-21');
select *from ferias ;

insert into fornecedores
(codigo, nome, email, telefone, cidade, data_cadastro)
values
(default, 'Elias Braga', 'eli.ba@gmail.com', '11934508967', 'São Paulo','08-03-21'),
(default, 'Ana Monteiro', 'ana.monte2001@gmail.com', '11921674520', 'Curitiba','19-03-21'),
(default, 'Joagueim Alves', 'emy.guidi@gmail.com', '11976903852', 'Sergipe','01-02-21');
select *from fornecedores;

insert into compra 
(codigo, data_compra, valor)
values
(default, '18-03-21', '245,00'),
(default, '02-01-20', '4500,80'),
(default, '04-04-21', '7048,90');
select *from compra;

/*Consultas avançadas*/
/* consultas com beteween, distinct, in, order by(para consultas em ordem crescente e decrescente), limit(qtd de registros para consulta) e like */
select *from funcionarios where nome like 'a%';
select distinct departamento from funcionarios;
select cidade from funcionarios where cidade in ('São Paulo');
select *from funcionarios where salario between '4000' and '9000';
select *from funcionarios where departamento="Compras" order by nome;
select *from funcionarios limit 2;
select * from funcionarios order by nome limit 1,4;

/*somar salários por departamento*/
select departamento, SUM(salario) as total from funcionarios group by departamento order by departamento;

/*retornar nomes de departamento*/
select departamento from funcionarios group by departamento order by departamento;

/*total de funcionários em cada departamento*/
select departamento, count(*) as total from funcionarios group by departamento having count(*) order by departamento;

/*união de resultado de duas ou mais tabelas*/
select nome, cidade,'FUNCIONARIO' as tipo from funcionarios
union all
select nome, cidade, 'FORNECEDOR' as tipo
from fornecedores;

/*Join: une duas ou mais tabelas com um campo em comum*/
/*Inner join: retoma registros que existem nas duas tabelas(intersecção de A e B) */ 
select A.nome, A.cidade, B.data 
from funcionarios as A 
INNER JOIN presenca as B
on A.codigo = B.codigo_funcionario
order by B.data, A.nome;
/*Left join: retoma registros que existem na A tabela (intersecção de A e B + A) */ 
/*Right join: retoma registros que existem na B tabela (intersecção de A e B + B) */ 
/*Full join: retoma todos os registros que existem nas duas tabelas (união de A e B) */ 

/*Funções de agrupamento*/ 
/*Retorno do menor valor*/
select min(salario) from funcionarios;
/*Retorno do maior valor*/
select max(salario) from funcionarios;
/*Retorno do média dos valores*/
select avg(salario) as media_salarial from funcionarios;

/*Soma com group by*/
select departamento, SUM(salario) as total from funcionarios group by departamento;
/*qtd de funcionarios com base no código anterior*/
select departamento, SUM(salario) as total, count(*) as qtde from funcionarios group by departamento;
/*Média salarial e ordernar resultado por maior média*/
select departamento, AVG(salario) as media from funcionarios group by departamento order by AVG(salario);
/*salario maior que a média*/
select *from funcionarios where salario > (select AVG(salario) from funcionarios);

/*Cálculo mensal com bônus salarial*/
select nome, salario + 500 as salario_com_bonus from funcionarios;
/*Cálculo anuel com bônus salarial*/
select nome, (salario + 500)*12 as salario_com_bonus from funcionarios;

/*comando view como consulta de resultado--tabela virtual*/
CREATE VIEW funcionarios_sp as select *from funcionarios where cidade='São Paulo';

/*Operações matemáticas*/
select 23 % 6 as sobra;
select 50 + 20 as adição;
select 45/9 as divisão;
select 39*10 as multi;
select 28 - 19 as subtração;

/*Operadores lógicos*/
/*AND - TODAS VERDADEIRAS*/
select nome, codigo from funcionarios where cidade = 'São Paulo' and salario = '8540.70';
/*OR - UMA OU TODAS VERDADEIRAS*/
select nome, codigo from funcionarios where cidade = 'São Paulo' or salario = '8540.70';
/*NOT - NENHUMA FOR VERDADEIRA*/
select nome, codigo from funcionarios where not salario = '8540.70';

/*Trabalhando com datas*/
select * from funcionarios where month(data_admissao) = 03;
select * from funcionarios where data_admissao between "2017-01-01" and "2019-01-01";
select nome, day(data_admissao) as dia, month(data_admissao) as mes, year(data_admissao) as ano from funcionarios;
select datediff (MAX(data_admissao), MIN(data_admissao)) as diferenca_dias from funcionarios where departamento = "Compras";

/*Trabalhando com horas*/
select data, hour(data) as horas from presenca;
select data, minute(data) as minutos from presenca;
select data, second(data) as segundos from presenca;


select *from funcionarios where not departamento = "TI";
select *from funcionarios where salario > (select AVG (salario) from funcionarios);
select *from funcionarios where cidade="São Paulo" and departamento = "Compras";
select nome, departamento from funcionarios where not departamento = "TI";
select nome, salario, (salario*0.3) + salario as aumento from funcionarios;


create temporary table funcionarios(
codigo INT auto_increment,
nome varchar(255),
email varchar(255),
telefone VARCHAR (255),
cidade varchar(255),
departamento varchar(255),
salario numeric(10,2),
data_admissao DATE,
primary key (codigo)
);
insert into funcionarios
(codigo, nome, email, telefone, cidade, departamento, salario, data_admissao)
values
(default, 'Emily', 'emy.guidi@gmail.com', '11981194857', 'São Paulo', null, '8540.70', '09/03/17'),
(default, 'Eduardo', 'dudu.br@gmail.com', '11987675640', 'São Paulo', "Compras", '8540.70', '21/03/19' ),
(default, 'Armando', 'ar.pereira@gmail.com', '11923987039', 'São Paulo', "Vendas", '3700.90', '30/05/18');

show fields from funcionarios;

select t.table_name as tabelas_com_pk, k.column_name as codigo
from information_schema.table_constraints t 
join information_schema.key_column_usage k
using (constraint_name, table_schema, table_name)
where t.constraint_type='PRIMARY KEY';

DELIMITER $$
create trigger registro_compra after insert on compra
for each row
begin 
insert into log_logs
(log_mensagem)
values (concat('compra realizada em', data_format(new.cmp_data_hora,'%d/%M/%Y %H:%m:%s')));
end$$
DELIMITER ;

create table log_logs(
log_id serial primary key,
log_mensagem VARCHAR (100) NOT NULL
);



