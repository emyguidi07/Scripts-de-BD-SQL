create database usercookies;
use usercookies;
create table usuarios ( 
email varchar(100) NOT NULL,
 senha varchar(20) NOT NULL,
 nome varchar(100) NOT NULL,
 cidade varchar(50) NOT NULL,
 estado char(2) NOT NULL,
 primary key(email) );
 
 insert  into usuarios (email, nome, cidade,estado) values
 ('teste@gmail.com', '123456', 'Emily', 'São Paulo', 'SP'),
 ('m.guidi@gmail.com', 'root123', 'Michele', 'Niterói', 'RJ');
 
 