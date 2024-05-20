create database operacMatematicas;
use operacMatematicas;

create table grupo (
    idGrupo int primary key auto_increment,
    nome varchar(45),
    descricao varchar(45)
);

create table aluno (
    RA int primary key auto_increment,
    nomeAluno varchar(45),
    email varchar(45),
    fkGrupo int,
    FOREIGN KEY (fkGrupo) REFERENCES grupo(idGrupo)
);

create table Professor (
    IdProfessor int primary key auto_increment,
    nomeProfessor varchar(45),
    disciplina varchar(45)
);

create table avaliacao (
    IdAvaliacao int primary key auto_increment,
    fkGrupo int,
    fkProfessor int,
    data_horario datetime,
    nota decimal(4,2),
    FOREIGN KEY (fkGrupo) REFERENCES grupo(idGrupo),
    FOREIGN KEY (fkProfessor) REFERENCES professor(idProfessor)
);

insert into grupo (nome, descricao) values
('Grupo 1', 'Controle de umidade em plantação de milho'),
('Grupo 2', 'Controle de temperatura em Sala de Aula');


insert into aluno (RA, nomeAluno, email, fkGrupo) values
(123456, 'João', 'joao@123.com', 1),
(234567, 'Maria', 'maria@123.com', 1),
(345678, 'Pedro', 'pedro@123.com', 2);

insert into professor (nomeProfessor, disciplina) values
('Vivian', 'Banco de Dados'),
('Matheus', 'Arq Comp');

insert into avaliacao (fkGrupo, fkProfessor, data_horario, nota) values
(1, 1, '2024-05-12 09:00:00', 8.5),
(1, 2, '2024-05-13 10:30:00', 7.9),
(2, 1, '2024-05-13 08:00:00', 9.2),
(2, 2, '2024-05-14 09:30:00', 8.7);

select * from grupo;
select * from aluno;
select * from professor;
select * from avaliacao;

select * from grupo join aluno on idGrupo = fkGrupo;

select * from grupo join aluno on idGrupo = fkGrupo
  where idGrupo = 1;
  
  select avg(nota) as 'Média das notas' from avaliacao;
  
  select min(nota) as 'Nota Mínima', max(nota) as 'Nota máxima'
    from avaliacao;
    
    select sum(nota) as 'Soma das Notas'
       from avaliacao;
       
	select professor.*, grupo.*, avaliacao.data_horario
      from professor join avaliacao on idProfessor = fkProfessor
        join grupo on idGrupo = fkGrupo;
        
	select professor.*, grupo.*, avaliacao.data_horario
      from professor join avaliacao on idProfessor = fkProfessor
        join grupo on idGrupo = fkGrupo
          where idGrupo = 1;
          
          select grupo.* from grupo join avaliacao 
            on idGrupo = fkGrupo 
              where fkProfessor = 1;
              
	select grupo.*, aluno.*, professor.*, data_horario
      from grupo join aluno on idGrupo = aluno.fkGrupo
       join avaliacao on idGrupo = avaliacao.fkGrupo
        join professor on idProfessor = fkProfessor;
        
	select count(distinct nota) as 'Quantida de Notas Distintas' from avaliacao;
    
    select professor.idProfessor, avg(nota) as 'Média das Notas', sum(nota) as 'Soma das Notas'
      from professor join avaliacao on idProfessor = fkProfessor
        group by idProfessor;
        
        select grupo.idGrupo, avg(nota) as 'Media das Notas', sum(nota) as 'Soma das Notas'
  from grupo
join avaliacao on idGrupo = avaliacao.fkGrupo
group by idGrupo;

select professor.idProfessor, min(nota) as 'Menor Nota', max(nota) as 'Maior Nota'
from professor
join avaliacao on idProfessor = fkProfessor
group by idProfessor;

select grupo.IdGrupo, min(nota) as 'Menor Nota', max(nota) as 'Maior Nota'
from grupo
join avaliacao on grupo.IdGrupo = fkGrupo
group by idGrupo;



