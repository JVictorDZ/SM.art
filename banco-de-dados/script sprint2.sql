create database sprint2;
use sprint2;
-- drop database sprint2;
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

select * from usuario;

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
select * from alerta;
select * from usuario;

select * from usuario join museu
on usuario.fkMuseu = museu.idMuseu;

-- select para obter informações de registro de sensores e salas de um museu específico
select registroSensor.temperatura as temperatura, 
registroSensor.umidade as umidade, 
sensor.nome as 'Nome do sensor',
sala.nome as 'Nome da sala',
museu.logradouro as 'Endereço do museu'
from registroSensor
join sensor on registroSensor.idSensor = sensor.idSensor
join sala on sensor.fkSala = sala.idSala
join museu on sala.fkMuseu = museu.idMuseu
where museu.idMuseu = 1;

-- selecionando dados dos sensores registrados com os parâmetros e alertas associados a eles
select registroSensor.temperatura as temperatura,
registroSensor.umidade as umidade,
sensor.nome as 'Nome do sensor',
parametro.temperaturaMin as 'Temperatura Mínima',
parametro.temperaturaMax as 'Temperatura Máxima',
parametro.umidadeMin as 'Umidade Mínima',
parametro.umidadeMax as 'Umidade Máxima',
alerta.descricao as 'Descrição do Alerta'
from registroSensor
join sensor on registroSensor.idSensor = sensor.idSensor
join parametro on sensor.idSensor = parametro.fkSensor
left join alerta on registroSensor.idRegistro = alerta.fkRegistro
and sensor.idSensor = alerta.fkSensor;

select * from usuario;