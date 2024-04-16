create database sprint2;
use sprint2;
drop database sprint2;

create table cadastro(
idCadastro int primary key auto_increment,
nome varchar (45),
cpf char(11) unique,
email varchar (60),
senha varchar (45),
permissao varchar (45) not null,
constraint chkPermissao check (permissao in('Administrador', 'Funcionario')));

create table museu(
idMuseu int primary key auto_increment,
cnpj char (14), 
logradouro varchar(55), 
numeroLogradouro varchar (5), 
cep char(8),
fkCadastro int not null,
constraint fkCadastroMuseu foreign key (fkCadastro)
references cadastro (idCadastro));

create table sensor(
idSensor int primary key auto_increment, 
nome varchar (45), 
tipoSensor varchar (45), 
localidade varchar (45), 
fkMuseu int not null,
constraint fkMuseuSensor foreign key (fkMuseu)
references museu (idMuseu));

create table condicoesClima(
idCondicao int primary key auto_increment, 
descricao varchar (80), 
tempMinima decimal, 
tempMax decimal, 
umidadeMinima decimal, 
umidadeMaxima decimal, 
dataHora datetime, 
fkCondIdeal int, 
fkCondAdversa int,
constraint fkIdeal foreign key (fkCondIdeal)
	references condicoesClima(idCondicao),
constraint fkAdversa foreign key (fkCondAdversa)
	references condicoesClima(idCondicao));

create table registroSensor (
idRegistro int,
fkSensor int,
constraint pkComposta primary key (idRegistro, fkSensor),
temperatura decimal(4,2),
umidade decimal(4,2), 
dataHora datetime,
fkCondicaoClima int not null,
constraint fkCondicaoRegistro foreign key (fkCondicaoClima)
references condicoesClima(idCondicao),
constraint fkSensorRegistro foreign key (fkSensor)
references sensor(idSensor));

    insert into cadastro values 
    (default, 'João Pedro', '45967201947', 'joao.pedro@gmail.com', 'joao123456', 'Administrador'),
    (default, 'Beatriz Cardoso', '19462702634', 'beatriz.cardoso@gmail.com', 'true123Cardoso', 'Funcionario'),
    (default, 'Cesar Lima', '45662782634', 'lima.cesar@gmail.com', 'Lima123Cesar', 'Funcionario');
    
	insert into museu values
	(default, '12345678000146', 'rua ana rosa', '148', '09336565', 3),
	(default, '18796579000138', 'avenida castelo branco', '200', '09554732', 2),
	(default, '14551189000190', 'alameda são caetano', '566', '09257413', 1);
    
	insert into sensor values
    (default, 'DHT11', 'temperatura e umidade', default, 1),
    (default, 'DHT11', 'temperatura e umidade', default, 2),
    (default, 'DHT11', 'temperatura e umidade', default, 3);
    
    insert into condicoesClima values
    (default, 'Quente', 25.0, 35.0, 40.0, 60.0, '2024-04-14 12:00:00', null, null),
    (default, 'Neutro', 20.0, 25.0, 30.0, 50.0, '2024-04-14 13:00:00', null, null),
    (default, 'Frio', 10.0, 15.0, 20.0, 40.0, '2024-04-14 14:00:00', null, null);
    
    insert into registroSensor values
    (1, 1, 25.5, 60.2, '2024-04-14 12:00:00', 1),
    (2, 3, 15.0, 35.3, '2024-04-14 13:00:00', 2),
    (3, 2, 32.5, 50.0, '2024-04-14 14:00:00', 3);
    
	update condicoesClima set fkCondIdeal = 2, fkCondAdversa = 1
    where idCondicao = 1;
    
    update condicoesClima set fkCondIdeal = 2, fkCondAdversa = 1
    where idCondicao = 2;
    
    update condicoesClima set fkCondIdeal = 2, fkCondAdversa = 3
    where idCondicao = 3;
    
    select * from cadastro join museu
    on idCadastro = fkCadastro;
    
    select * from sensor join registroSensor
    on idSensor = fkSensor;
    
	select sensor.nome as Nome,
	registroSensor.temperatura as Temperatura,
	registroSensor.umidade as Umidade,
    registroSensor.dataHora as 'Data e Hora'
	from registroSensor join sensor
	on idSensor = fkSensor;
    
	select * from condicoesClima as condicoes
    join condicoesClima as ideal
    on condicoes.fkCondIdeal = ideal.idCondicao
    join condicoesClima as adversa
	on condicoes.fkCondAdversa = adversa.idCondicao;
	
    select c.idCadastro, c.nome as NomeCadastro, c.cpf,
       m.idMuseu, m.cnpj,
       s.idSensor, s.nome as NomeSensor, s.tipoSensor, s.localidade,
       cc.idCondicao, cc.descricao as Descricao, cc.tempMinima, cc.tempMax, cc.umidadeMinima, cc.umidadeMaxima, cc.dataHora,
       r.idRegistro, r.temperatura, r.umidade, r.dataHora as DataHoraRegistro
		from cadastro c
		join museu m on c.idCadastro = m.fkCadastro
		join sensor s on m.idMuseu = s.fkMuseu
		join registroSensor r on s.idSensor = r.fkSensor
		join condicoesClima cc on r.fkCondicaoClima = cc.idCondicao;
