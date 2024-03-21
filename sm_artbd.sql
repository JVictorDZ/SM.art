create database sprint1;
use sprint1;
create table cadastro(
idToken int primary key,
usuario varchar(20),
senha varchar(45) not null
);

INSERT INTO cadastro values
(6565654, 'Cleber Rocha', 'macarraocomfeijao123'),
(9226372, 'Lucio Menezes', 'lucio020498'),
(4573975, 'Marcia Russo', 'lucasmeuamadofilho999'),
(1998630, 'Larissa Delaroche', 'delarocheLarissa876'),
(0283741, 'Carlos Almeida', 'AlMeIdA_2345'),
(9384524, 'Paulo Rodrigues', 'RodriPaulo888Juvenilda');

SELECT * FROM cadastro;

UPDATE cadastro set senha = 'lucio$patrao777'
WHERE idToken = 9226372;

ALTER TABLE cadastro ADD COLUMN cargo varchar(50);
UPDATE cadastro set cargo = 'Gerente de monitoramento & preservação'
WHERE idToken in(6565654, 4573975, 1998630, 9384524); 
UPDATE cadastro set cargo = 'Equipe de manutenção'
WHERE idToken in(9226372, 0283741);

SELECT idToken as 'ID',
usuario as 'Nome do usuário',
senha as 'Senha',
cargo as 'Cargo'
from cadastro;

DESCRIBE cadastro;
DROP TABLE cadastro;
--


create table obra (
idObra int primary key auto_increment,
titulo varchar(60),
autor varchar(60),
horario datetime,
material varchar(35),
temperaturaIdeal double,
umidadeIdeal int,
dataCriacao int,
constraint chkMaterial check (material IN('Óleo', 'Pastel', 'Acrílico', 'Carvão', 'Guache', 'Têmpera'))
);

INSERT INTO obra values
 (null, 'Sketch for The Death of Sardanapalus', 'Eugène Delacroix', '2020-12-02 18:22:13', 'Pastel' , 22, 50 , 1827),
 (null, 'A persistência da memória', 'Salvador Dali', '2010-02-28 10:02:10', 'Óleo' , 22, 50, 1931),
 (null, 'La Jungla', 'Wilfredo Lam', '2015-10-09 13:59:07', 'Guache' , 18, 47 , 1943),
 (null, 'Drawing from Stereoscope', 'William Kentridge', '2009-09-22 14:32:28', 'Carvão', 20, null, 1998),
 (null, 'Head of a Woman', 'Pablo Picasso', '2022-06-09 07:48:27', 'Guache' , 18, 47, 1909),
 (null, 'Eagle Claw and Bean Necklace', 'Georgia OKeeffe', '2024-01-06 18:35:59', 'Carvão' , 20, null, 1934),
 (null, 'O nascimento de Venus', 'Sandro Botticelli', '2023-07-10 10:09:56', 'Óleo', 22, 50, 1485);
 
 
SELECT * FROM obra;

ALTER TABLE obra DROP COLUMN horario;

select idObra as 'ID',
titulo as 'Título',
autor as 'Autor',
material as 'Material',
concat(temperaturaIdeal, '°C') as 'Temperatura',
concat(umidadeIdeal, '%') as 'Umidade',
dataCriacao as 'Data da criação'
from obra;
  
DELETE FROM obra
where idObra >5;  
  
DESCRIBE obra;
DROP TABLE obra;  
--



create table museu (
idMuseu int primary key auto_increment,
nomeMuseu varchar(60),
pecasCadastradas int,
cep char(8)
);

INSERT INTO museu values
(null, 'Museu das Rosas', '12', '06542135'),
(null, 'Museu Lamdberg', '38', '12369220'),
(null, 'Museu Cruzes de Manhagaba', '57', '91157979'),
(null, 'Museu Catavento ', '8', '24344734'),
(null, 'Museu Sócrates', '10', '90256731'),
(null, 'Museu Mundo Azul', '7', '84130357');


SELECT * FROM museu;

SELECT idMuseu as 'ID',
nomeMuseu as 'Nome do museu',
pecasCadastradas as 'Peças Cadastradas',
cep as 'CEP'
from museu;

SELECT nomeMuseu, pecasCadastradas FROM museu;


TRUNCATE TABLE museu;
DROP TABLE museu;
--


create table captacaoDados(
idObra int primary key auto_increment,
temperatura double,
umidade int
);

INSERT INTO captacaoDados values
(null, '23', '57'),
(null, '32', '31'),
(null, '18', '49'),
(null, '21', '52'),
(null, '23', '58'),
(null, '17', '70'),
(null, '21', '46');

DELETE FROM captacaoDados
WHERE idObra > 5;

select idObra as 'ID',
concat(temperatura, '°C') as 'Temperatura',
concat(umidade, '%') as 'Umidade'
from captacaoDados;

-- Integrantes: Arthur Ramos Dos Santos 
-- Cauê Ferreira De Oliveira 
-- Fernando Felix Da Silva
-- João Victor Dias Da Silva 
-- Matheus Yukio Makiyama 
-- Rogério Matzak Santiago 
-- Victor Hugo Ribeiro Braga 
	