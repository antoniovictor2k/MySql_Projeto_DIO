 use eCommerce;
 
 desc clientes;
 
 -- alter table clientes auto_increment=10;
 
 insert into clientes (Nome, CPF, Sexo, Endereco, DataDeNascimento) values
 ('Antonio Carlos', 12345678912,'masculino','Maceió-AL, Av fernandes Lima, N4100 CEP:57081480', '1989-01-12');
 
 insert into clientes (Nome, CPF, Sexo, Endereco, DataDeNascimento) values
 ('João Pedro', 12345678923,'masculino','Maceió-AL, Av Josefa De Melo, N 2541 apt 7 bloco 3  CEP:57081480', '1999-06-03'),
 ('João Vitor', 12345678934,'masculino','Maceió-AL, Av Josefa De Melo, N 2541 apt 4 bloco 2  CEP:57081480', '2003-10-17'),
 ('Allana Scalet', 12345678945,'feminino','Rio Largo-AL, Rua do Curioso, N 102 CEP:5787456', '2000-04-08'),
 ('Safyra Lyra', 12345678954,'feminino','Pilar-AL, Rua dos empresários, N 410 cs 08 bloco 15 CEP:5725478', '1985-11-24');
 
-- delete from clientes where CPF = 12345;
 select * from clientes;
 show tables;
 
 
 desc pedidos;
 alter table pedidos auto_increment = 100;
 
 insert into pedidos (idCliente, Frete, FormaDePagamento) values
 (2,25.10, 'PIX');
 
 insert into pedidos (idCliente, statusDaOrdem, Frete,  FormaDePagamento) values
 (3, 'confirmado', 45.54, 'debito'),
 (4, 'confirmado', 61.15, 'credito'),
 (5, 'confirmado', 0, 'boleto')
 ;
 
 -- delete from pedidos;
 
 select * from pedidos;
 
 
show tables;
 desc produtos;
 alter table produtos auto_increment = 10;
 
 insert into produtos (titulo, descricao, Preco, categoria, avaliacao, pesoDoProduto, tamanhoDoProduto) values
 ('Desktop','Pc gamer i7 14G 32gb RTX4090TI top de linha, roda tudo', 46141.03, 'informatica',4,8.4,'30x30x30'),
 ('Jaqueta','Jaqueta Motocross Top de linha',657.45,'vestuario',3.1,2.0,'20x25x20'),
 ('JBL','JBL Original Top de linha',3640.87,'eletronico',5.0,1.4,'15x15x17'),
 ('Guarda Roupas','Guarda Roupas 12 Portas com espelho inovador',5320.00,'moveis',3.8,15,'250X20X50'),
 ('Inglesso Manuel Gomes','Inglesso do Show Manuel Gomes Musicas do momento e tudo mais',89.93,'outros',4.6,null,null),
 ('Picalha KG','Picalha de Primeira',13.13,'alimentos',3.3,1,'10x10x10'),
 ('Carro','Carrinho de controle remoto',240.56,'brinquedo',3.5,0.8,'15x15x15');
 
 select count(*) from produtos;
 
 delete from produtos;
 
 
 desc fornecedores;
 alter table fornecedores auto_increment = 20;
 
 insert into fornecedores (RazaoSocial, CNPJ, Endereco, NomeDoRepresentante, CpfDoRepresentante, ContatoDoRepresentante) values
 ('Vtec Imports', 123456789123456,'Atalaia-AL, Rua da Alegria N4000, CEP57690000','Antonio Victor',98765432121,82991981626),
 ('Mundo das Variedades', 123456789987987,'Satuba-AL, Av da Senador Laele N340, CEP57874400','Jose Ricardo',98765432132,82999981727),
 ('Mega Atacado', 123456789654321,'Arapiraca-AL, Av Cabral Santos N199, CEP57954100','Augusto Pereira',98765432134,82998995525);
 select * from fornecedores;
 
 desc vendedores;
 alter table vendedores auto_increment = 30;
 
 insert into vendedores (Nome, CPF, Endereco, Contato) values
 ('Italo Silva', 65432165432,'Maceió-AL,Av João Carlos N47', '82997989192'),
 ('Matheus Souza', 65432165123,'Rio Largo-AL,Av Dr Silva N17', '82997984141'),
 ('Junior Santos', 65432165456,'Maceió-AL,Av Durval Monteiro N9999', '82997986565');
 select * from vendedores;
 
 show tables;
 desc local_de_armazenamento;
 alter table local_de_armazenamento auto_increment = 30;
 
 insert into local_de_armazenamento (quantidade) values
 (100),
 (150),
 (300),
 (456),
 (40),
 (5),
 (49);
 
 select * from local_de_armazenamento;
 
 select * from produtos;
  select * from local_de_armazenamento;

 desc produtos_e_local_de_armazenamento;
 insert into produtos_e_local_de_armazenamento values
 (24,35, 'Maceio'),
 (25,32, 'Maceio'),
 (26,30, 'Maceio'), -- jbl
 (28,34, 'Rio Largo'), -- Inglesso Manuel Gomes
 (29,36, 'Rio Largo'); -- picanha
 
 --  update  produtos set titulo = 'picanha' where idProduto = 29;
 
 select * from produtos_e_local_de_armazenamento;
 
select * from produtos;
select * from pedidos;
 desc produtos_e_pedidos;
 insert into produtos_e_pedidos values
 (24,105,default,default),
 (26,104,4,default),
 (28,107,8,default),
 (29,106,5,default);
 
 -- 104	2	processamento	25.1	PIX
-- 105	3	confirmado	45.54	debito
--  106	4	confirmado	61.15	credito
-- 107	5	confirmado	0	boleto

 
 select * from produtos;
 select * from fornecedores;
 desc produtos_e_fornecedores;
 insert into produtos_e_fornecedores values
 (20,24,50),
 (20,26,40),
 (22,28,20),
 (21,29,80),
 (22,25,47);
 
 select * from produtos_e_fornecedores;
 

 
 
 