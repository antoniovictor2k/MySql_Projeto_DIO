use eCommerce;

-- Recuperações simples com SELECT Statement
-- Filtros com WHERE Statement
-- Crie expressões para gerar atributos derivados
-- Defina ordenações dos dados com ORDER BY
-- Condições de filtros aos grupos – HAVING Statement
-- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados

show tables;
-- Todas as Tabelas
-- clientes
-- fornecedores
-- local_de_armazenamento
-- pedidos
-- produtos
-- produtos_e_fornecedores
-- produtos_e_local_de_armazenamento
-- produtos_e_pedidos
-- vendedores
-- vendedores_e_produtos

select * from clientes;
select * from fornecedores;
select * from produtos;


select c.Nome, c.CPF, c.Endereco from clientes c
where c.Endereco like "%Maceió%";

select titulo Título, descricao Descrição, preco Preço, categoria Categoria  from produtos p order by preco;

select titulo Título, descricao Descrição, preco Preço_À_Vista, round(preco+(preco*0.12),2) 
Preço_Prazo, round((preco+(preco*0.12))/10,2) Parcela_Em_Até_10x, round(preco*0.12,2) Acréscimo_de, categoria Categoria  
from produtos p 
order by titulo;

select titulo Título, descricao Descrição, preco Preço_sem_Promoção, round(preco-(preco*0.15),2) as Preço_Com_Promoção, round((preco-(preco*0.25)),2) Preço_Com_Promoção_no_PIX 
from produtos p 
where preco >= 2499
order by titulo;

SELECT Nome, DataDeNascimento Data_de_Nascimento, concat(YEAR(CURRENT_DATE) - YEAR(DataDeNascimento) - (RIGHT(CURRENT_DATE, 5) < RIGHT(DataDeNascimento, 5)),' Anos')  Idade
FROM clientes;


select * from produtos_e_pedidos;
select * from pedidos;


select idPOproduto, p.StatusDaOrdem,  count(*) Quantidade_de_Produto from  produtos_e_pedidos pd, pedidos p
where p.StatusDaOrdem = 'confirmado'
group by idPOproduto;


select ped.StatusDaOrdem, count(*) from clientes c, produtos_e_pedidos pd, produtos p, pedidos ped
where ped.StatusDaOrdem = 'confirmado'
group by ped.StatusDaOrdem;

select * from produtos;

SELECT COUNT(*) AS Numero_de_Avaliação, titulo Título, idProduto ID, avaliacao Avaliação
FROM produtos
GROUP BY idProduto
HAVING avaliacao >= 3;

SELECT COUNT(*) AS Numero_de_Produto, titulo Título, idProduto ID,  preco Preço
FROM produtos
GROUP BY idProduto
HAVING preco > 5000;

select * from pedidos;
select * from produtos_e_pedidos;

SELECT p.idPedido, p.idCliente, pd.idPOProduto, idPOPedido, pd.POQuantidade
FROM pedidos as p, produtos_e_pedidos pd;


SELECT p.idPedido,  pd.idPOProduto, pd.idPOPedido, pd.POQuantidade
FROM  produtos_e_pedidos as pd
INNER JOIN pedidos p ON idPedido = idPOPedido;









