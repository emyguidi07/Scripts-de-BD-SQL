create database centro_universidade;
use centro_universidade;

create table departamento(
codigo_dp int auto_increment,
nome VARCHAR(45),
telefone int(8),
centro VARCHAR (20),
primary key (codigo_dp)
);

create table aluno(
num_matricula int auto_increment,
nome VARCHAR(45),
telefone int(9),
curso VARCHAR (20),
departamento VARCHAR (40),
endereco VARCHAR (60),
sexo enum('F','M'),
data_nascimento date,
CPF int(11),
primary key (num_matricula)
);


create table curso(
id_curso int auto_increment,
nome VARCHAR(45),
tipo VARCHAR(20),
departamento VARCHAR(45),
coordenador VARCHAR(30),
vice_coordenador VARCHAR(30),
primary key(id_curso)
);

create table professor(
id_prof_cod int auto_increment,
nome VARCHAR(45),
CPF int(11),
departamento VARCHAR(45),
telefone int(9),
primary key(id_prof_cod)
);

create table disciplina(
id_dis_cod int auto_increment,
nome VARCHAR(45),
num_creditos int(6),
departamento VARCHAR(45),
descrição longtext,
primary key(id_dis_cod)
);

create table oferta(
id_oferta_cod int auto_increment,
professor VARCHAR(45),
dia_semana VARCHAR(7),
horario time,
primary key(id_oferta_cod)
);

insert into departamento
(codigo_dp, nome, telefone, centro)
values
(default, 'Tecnologia da informação', '54367539', 'Centro Vila Prudente'),
(default, 'Culinária', '78735648', 'Centro Vila Mariana' ),
(default, 'Administração', '67548976', 'Centro Mooca');
select *from departamento;

insert into aluno 
(num_matricula, nome, telefone, curso, departamento, endereco, sexo, data_nascimento, CPF)
values
(default, 'João Albuquerque Queiroz', '978656473', 'Webdesign', 'Tecnologia da informação',  'Av Tuiti, 89', 'M', '01-05-31', '12323409523'),
(default, 'Maria Eduarda Ribeiro da Silva', '945096734', 'DS', 'Tecnologia da informação',  'Rua Costa Barros, 1909', 'F', '03-07-02', '13159467830' ),
(default, 'Gabriel Laia Sousa', '945375907', 'Gestão administrativa', 'Administração',  'Rua Marechal Deodoro,apto 21, 17', 'M', '02-11-02', '24078435719');
select *from aluno;

insert into curso
(id_curso, nome,tipo,departamento,coordenador,vice_coordenador)
values
(default,  'Webdesign', 'Tecnologia da informação', 'Técnico', 'Alexandre', 'Diogo'),
(default,  'DS', 'Tecnologia da informação', 'Mestrado', 'Marcela', 'Jonas' ),
(default,  'Gestão administrativa', 'Administração', 'Doutorado', 'André', 'Gabriela');
select *from curso;

insert into professor
(id_prof_cod,nome,CPF,departamento,telefone)
values
(default, 'Felipe Augusto Oliveira', '45609823471', 'Tecnologia da informação', '971234834'),
(default, 'Cátia Costa Carvalho', '23409645667', 'Culinária','912345678' ),
(default, 'Amanda Nunes Gomes', '94523489045', 'Administração','952435719');
select *from professor;

insert into disciplina 
(id_dis_cod,nome,num_creditos,departamento,descrição)
values 
(default, 'Programação Web', '345', 'Tecnologia da informação', 'Realização de sites públicos e programação destes'),
(default, 'Elaboração doces gourmet', '247', 'Culinária','Ensino prático de vendas e receitas de doces'),
(default, 'Direitos humanos', '178', 'Administração','Reconhecimento de valores morais na sociedade');
select *from disciplina;

insert into oferta 
(id_oferta_cod, professor,dia_semana,horario)
values 
(default, 'Felipe Augusto Oliveira', 'Quarta-feira', '07:30:00'),
(default, 'Amanda Nunes Gomes',  'Segunda-feira','12:20:00'),
(default, 'Cátia Costa Carvalho ',  'Sexta-feira','10:00:00');
select *from oferta;












