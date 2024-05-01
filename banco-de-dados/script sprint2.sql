create database sprint2;
use sprint2;
drop database sprint2;
create table museu(
idMuseu int primary key auto_increment,
cnpj char (14), 
logradouro varchar(55), 
numLogradouro varchar (45), 
cep char(9));

create table sala(
idSala int primary key auto_increment,
nome varchar(45), 
qtdObras int, 
fkMuseu int,
constraint fkMuseuSala foreign key (fkMuseu)
references museu (idMuseu));

create table usuario(
idUsuario int primary key auto_increment,
nome varchar (45),
cpf char(11) unique,
email varchar (60),
senha varchar (45),
permissao varchar (45) not null,
constraint chkPermissao check (permissao in('Administrador', 'Funcionario')),
fkMuseu int,
constraint fkMuseuUsuario foreign key (fkMuseu)
references museu (idMuseu)
);

create table sensor(
idSensor int primary key auto_increment, 
nome varchar (45), 
fator float,
fkSala int not null,
constraint fkSalaSensor foreign key (fkSala)
references sala (idSala));

create table registroSensor (
idRegistro int,
idSensor int,
constraint pkComposta primary key (idRegistro, idSensor),
temperatura decimal(4,2),
umidade decimal(4,2), 
dataHora datetime);

create table parametro(
idParametro int primary key auto_increment, 
temperaturaMin decimal(4,2), 
umidadeMin decimal(4,2), 
temperaturaMax decimal(4,2), 
umidadeMax decimal(4,2), 
fkSensor int,
constraint fkSensorParametro foreign key (fkSensor)
references sensor (idSensor));

create table alerta(
idAlerta int primary key auto_increment,
descricao varchar(55),
fkRegistro int,
constraint fkRegistroAlerta foreign key (fkRegistro)
references registroSensor (idRegistro),
fkSensor int,
constraint fkSensorAlerta foreign key (fkSensor)
references sensor (idSensor),
fkParametro int,
constraint fkParametroAlerta foreign key (fkParametro)
references parametro (idParametro));

select registroSensor.temperatura as temperatura,
registroSensor.umidade as umidade,
sensor.nome as 'Nome do sensor'
from registroSensor join sensor
on registroSensor.idSensor = sensor.idSensor;

insert into museu values
(default, '12345678000146', 'rua ana rosa', '148', '09336565'),
(default, '18796579000138', 'avenida castelo branco', '200', '09554732'),
(default, '14551189000190', 'alameda são caetano', '566', '09257413');

insert into sala values
(default, 'catavento', 10, 1),
(default, 'portinari', 11, 2),
(default, 'picasso', 8, 3);

insert into usuario values 
(default, 'João Pedro', '45967201947', 'joao.pedro@gmail.com', 'joao123456', 'Administrador', 3),
(default, 'Beatriz Cardoso', '19462702634', 'beatriz.cardoso@gmail.com', 'true123Cardoso', 'Funcionario', 2),
(default, 'Cesar Lima', '45662782634', 'lima.cesar@gmail.com', 'Lima123Cesar', 'Funcionario', 1);
    
insert into sensor values 
(default, 'Sensor 1', 1, 1),
(default, 'Sensor 2', 1.5, 2),
(default, 'Sensor 3',2, 3);
    
insert into registroSensor values
(1, 1, 25.5, 60.2, '2024-04-14 12:00:00', 1),
(2, 3, 15.0, 35.3, '2024-04-14 13:00:00', 2),
(3, 2, 32.5, 50.0, '2024-04-14 14:00:00', 3);

select (registro.umidade * sensor.fator) as Umidade, 
(registro.temperatura * sensor.fator) as Temperatura, 
sensor.nome from registroSensor as registro, sensor as sensor;

create view teste as (select (registro.umidade * sensor.fator) as umidade, 
(registro.temperatura * sensor.fator) as temperatura, sensor.nome as nomeSensor 
from registroSensor as registro, sensor as sensor);

select * from teste;

select * from teste where nomeSensor = 'Sensor1';
select * from teste where nomeSensor = 'Sensor2';
select * from teste where nomeSensor = 'Sensor3';

select * from sensor;
select * from museu;
select * from parametro;
select*from alerta;

select * from usuario join museu
on usuario.fkMuseu = museu.idMuseu;
    
select * from sensor join registroSensor
on idSensor = fkSensor;

    select usuario.idUsuario, usuario.nome as NomeUsuario, cpf,
       museu.idMuseu, cnpj,
       sala.idSala, qtdObras as 'Quantidade de obbras',
       sensor.idSensor, sensor.nome as NomeSensor,
       cc.idCondicao, cc.descricao as Descricao, cc.tempMinima, cc.tempMax, cc.umidadeMinima, cc.umidadeMaxima, cc.dataHora,
       r.idRegistro, r.temperatura, r.umidade, r.dataHora as DataHoraRegistro
		from cadastro c
		join museu m on c.idCadastro = m.fkCadastro
		join sensor s on m.idMuseu = s.fkMuseu
		join registroSensor r on s.idSensor = r.fkSensor
		join condicoesClima cc on r.fkCondicaoClima = cc.idCondicao;