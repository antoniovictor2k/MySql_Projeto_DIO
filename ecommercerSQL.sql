 -- drop database eCommerce ;
 
 create database if not exists eCommerce;
 use eCommerce;
 -- show tables;
 
  -- select * from clientes;
 
-- desc clientes;
 
 create table clientes(
	idCliente int auto_increment primary key,
    Nome varchar(45) not null,
    CPF char(11) not null unique,
    Sexo enum('masculino', 'feminino', 'outro'),
    Endereco varchar(80),
	DataDeNascimento date
    
 );
 
-- drop table clientes;
 
-- select * from clientes;
-- desc Clientes;
 
-- alter table clientes modify Sexo enum('masculino', 'feminino', 'outro');
 
 
 create table produtos(
	idProduto int auto_increment primary key,
    titulo varchar(25),
    descricao varchar(255),
    Preco float default 0,
    Categoria enum('eletronico','vestuario','brinquedo','alimentos', 'informatica','moveis', 'outros') default 'outros' ,
    avaliacao float default 0,
    pesoDoProduto float default 0,
    tamanhoDoProduto varchar(45) 
 );
 
 
 
 create table pedidos(
	idPedido int auto_increment primary key,
    idCliente int,
    StatusDaOrdem enum('cancelado','confirmado','processamento') default 'processamento',
    Frete float,
    FormaDePagamento enum('PIX','debito','boleto','credito') default 'boleto',
    constraint fk_id_do_cliente foreign key (idCliente) references clientes(idCliente)
    
 );
 
 -- desc pedidos;
  
 -- drop table pedidos;

 
 create table local_de_armazenamento(
	idProdutoArmazenador int auto_increment primary key,
    quantidade int default 0
 
 );
 
-- drop table armazenamento_de_produtos;

 
 create table fornecedores(
 idFornecedor int auto_increment primary key,
 RazaoSocial varchar(45) not null,
 CNPJ char(15) not null unique,
 Endereco varchar(80),
 NomeDoRepresentante varchar(45) not null,
 CpfDoRepresentante char(11) not null,
 ContatoDoRepresentante char(11) not null
 
 );
 
 
 create table vendedores(
	idVendedor int auto_increment primary key,
    Nome varchar(45),
    CNPJ char(15) unique,
    CPF char(11) not null unique,
    Endereco varchar(80),
    Contato char(11) not null
 
 );
 
 -- N:M
 
 create table vendedores_e_produtos(
idVPVendedor int,
idVPProduto int, 
 Quantidade int,
 primary key (idVPVendedor , idVPProduto),
 constraint fk_id_do_vendedor foreign key (idVPVendedor) references vendedores(idVendedor),
 constraint fk_id_do_produto foreign key (idVPProduto) references produtos(idProduto)
 );
 
 create table produtos_e_pedidos(
	idPOProduto int,
    idPOPedido int,
    PoQuantidade int default 1,
    PoStatus enum('disponivel','sem estoque') default 'disponivel',
    primary key (idPOProduto, idPOPedido),
    constraint fk_produto_po_vendedor foreign key (idPOProduto) references produtos(idProduto),
	constraint fk_produto_po_produto foreign key (idPOPedido) references pedidos(idPedido)
 );
 
 drop table produto_e_pedido;
 
 create table produtos_e_local_de_armazenamento(
	idLProduto int,
    idLArmazenamento int,
    localizacao varchar(255) not null,
    primary key(idLProduto, idLArmazenamento),
    constraint fk_produto_localizacao_pedido foreign key (idLProduto) references produtos(idProduto),
	constraint fk_produto_localizacao_produto foreign key (idLArmazenamento) references local_de_armazenamento(idProdutoArmazenador)
 );
 
 -- drop table local_de_armazenamento;
 
 create table produtos_e_fornecedores(
	idPsFornecedor int ,
    idPsProduto int,
    quantidade int not null,
    primary key( idPsFornecedor,idPsProduto ),
    constraint fk_produto_fornecedor_fornecedor foreign key (idPsFornecedor) references fornecedores(idFornecedor),
	constraint fk_produto_fornecedro_produto foreign key (idPsProduto) references produtos(idProduto)
 );
-- drop table produto_fornecedor;
 -- tabelas 
  show tables;
 
 
 

 -- total 9 tables no video!!! sem o endereço!
 
 