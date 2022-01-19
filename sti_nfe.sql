CREATE DATABASE sti_nfe;
use sti_nfe;
CREATE TABLE produtos(
    codigo integer not null,
    nome text not null,
    preco numeric
);
CREATE TABLE cliente(
	nome text,
    codigo int not null auto_increment,
    data_nasc date,
    endereco VARCHAR(45),
    primary key (codigo)
);
select database();