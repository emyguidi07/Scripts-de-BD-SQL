/*havia 1,2,3,4 de Emily e depois os respectivos registros*/
insert into pessoas
(id, nome, sexo, peso, altura, nacionalidade)
values
(default, 'Emily', 'F', '63.5', '1.71', default),
(default, 'Eduardo', 'M', '51.5', '1.69', default),
(default, 'Armando', 'M', '105.0', '1.89', default),
(default, 'Pedro', 'M', '31.7', '1.30', default),
(default, 'Jany', 'F', '54.8', '1.61', 'EUA');

desc pessoas;
alter table pessoas
add column profissao varchar(20) after nome;
alter table pessoas
modify column profissao varchar(20)  default 'desenvolvedor';

update pessoas
set nome= 'Linda', altura= '1.70', peso = '65.0'
where id = '2';

delete from pessoas
where id='3';

delete from pessoas
where id='4';

select * from pessoas;


