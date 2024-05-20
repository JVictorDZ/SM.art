create database venda;
use venda;

create table cliente (
idCliente int primary key auto_increment,
nome varchar(45),
email varchar (45),
endereco varchar (45),
fkIndicador int,
foreign key (fkIndicador) references cliente (idCliente));

create table produto (
idProduto int primary key auto_increment,
descricao varchar(45),
preco decimal(5, 2));

create table vendas (
idVendas int auto_increment primary key,
totalVendas int,
dtVenda date,
fkCliente int,
foreign key (fkCliente) references cliente (idCliente));

create table sistema (
idSistema int auto_increment,
fkVendas int,
fkProduto int,
qtdProduto int,
desconto int,
primary key (idSistema, fkVendas, fkProduto),
foreign key (fkVendas) references vendas (idVendas),
foreign key (fkProduto) references produto (idProduto)
);

insert into cliente values 
(default, 'Bizeli', 'bizeli123@gmail.com', 'Rua Clippers 120', 1),
(default, 'Leandro', 'leandro123@gmail.com', 'Rua Egito 202', 1),
(default, 'Raul', 'raul123@gmail.com', 'Rua Banana 304', 2);

insert into produto values 
(default, 'Tênis', 200.00),
(default, 'Camiseta', 120.00),
(default, 'Calça', 70.00);

insert into vendas values 
(default, 5, '2024-09-08', 1),
(default, 6, '2024-05-09', 1),
(default, 4, '2024-05-03', 2),
(default, 7, '2024-08-07', 3);

insert into sistema values 
(default, 1, 1, 6, 10),
(default, 1, 2, 7, 5),
(default, 2, 2, 8, 5),
(default, 3, 3, 5, 8),
(default, 3, 1, 6, 10);

select * from cliente;
select * from produto;
select * from vendas;
select * from sistema;

select * from cliente join vendas on idCliente = fkCliente;

select * from cliente join vendas on idCliente = fkCliente
    where cliente.nome = 'Leandro';
    
    select * from cliente as Cliente join cliente as Indicador
      on cliente.idCliente = Indicador.fkIndicador;
      
	select cliente.*, indicador.*
from cliente as Cliente
join cliente as Indicador on cliente.FkIndicador = Indicador.idCliente
where Indicador.nome = 'Leandro';

select * from cliente as Cliente join cliente as Indicador 
  on cliente.idCliente = Indicador.fkIndicador join
   vendas on idVendas = fkCliente join sistema on idSistema = fkProduto join produto 
    on idProduto = fkProduto;
    
    select vendas.dtVenda, produto.descricao as produto, vendas.totalVendas from vendas
      join sistema on idSistema = fkVendas join produto on idProduto = fkProduto where idVendas = 1;
      
select produto.descricao as 'Nome do Produto', produto.preco 'Preço do Produto', 
 sum(totalVendas) as 'Total de Vendas' from vendas join produto 
  on vendas.idVendas = produto.idProduto group by produto.descricao, produto.preco;
  
  insert into cliente values 
  (default, 'Ferrero', 'ferrero123@gmail.com', 'Rua Rochê 123', 2);
  
  select * from cliente join vendas on cliente.idCliente = vendas.fkCliente
   join produto on produto.idProduto where totalVendas = 0;
   
   
   
   

    
   