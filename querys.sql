
-- Quais clientes são do estado de São Paulo (SP)?

SELECT idCliente, nome, sobrenome, cidade, estado
FROM clientes
WHERE estado = 'SP';


-- Qual o valor total (produto * quantidade) de cada item nos pedidos?
SELECT 
    pp.idPedido, 
    pp.idProduto, 
    p.nome AS produto, 
    pp.quantidade, 
    (pp.quantidade * p.valor) AS total_item
FROM pedido_produto pp
JOIN produtos p ON pp.idProduto = p.idProduto;


-- Quais os 10 pedidos mais caros (considerando frete e valor dos produtos)?
SELECT 
    p.idPedido, 
    SUM(pp.quantidade * pr.valor) AS total_produtos,
    p.frete, 
    (SUM(pp.quantidade * pr.valor) + p.frete) AS total_pedido
FROM pedido p
JOIN pedido_produto pp ON p.idPedido = pp.idPedido
JOIN produtos pr ON pp.idProduto = pr.idProduto
GROUP BY p.idPedido
ORDER BY total_pedido DESC
LIMIT 10;


--  Quais vendedores venderam mais de 50 produtos no total?

SELECT 
    pv.idVendedor, 
    v.razaoSocial AS nome_vendedor, 
    SUM(pv.quantidade) AS total_vendido
FROM produto_vendedor pv
JOIN vendedor v ON pv.idVendedor = v.idVendedor
GROUP BY pv.idVendedor
HAVING SUM(pv.quantidade) > 50;

-- Quais pedidos já foram pagos e qual foi a forma de pagamento?

SELECT 
    p.idPedido, 
    c.nome AS cliente, 
    mp.metodoPagemento, 
    pg.statusPagamento, 
    pg.valorPago, 
    pg.dataPagamento
FROM pagamento pg
JOIN pedido p ON pg.idPedido = p.idPedido
JOIN clientes c ON p.pedidoIdCliente = c.idCliente
JOIN metodo_pagamento mp ON pg.idMetodoPagemento = mp.idMetodoPagemento
WHERE pg.statusPagamento = 'Aprovado';


-- Quais produtos no estoque têm menos de 10 unidades?

SELECT 
    e.idEstoque, 
    p.nome AS produto, 
    e.quantidade, 
    CASE 
        WHEN e.quantidade = 0 THEN 'Sem estoque'
        WHEN e.quantidade <= 10 THEN 'Baixo estoque'
        ELSE 'Estoque adequado'
    END AS status_estoque
FROM estoque e
JOIN produto_estoque pe ON e.idEstoque = pe.idEstoque
JOIN produtos p ON pe.idProduto = p.idProduto
WHERE e.quantidade <= 10;

-- Quantos pedidos foram feitos por cada cliente?

SELECT 
    c.idCliente, 
    c.nome AS nome_cliente, 
    c.sobrenome,
    COUNT(p.idPedido) AS total_pedidos
FROM clientes c
LEFT JOIN pedido p ON c.idCliente = p.pedidoIdCliente
GROUP BY c.idCliente, c.nome
ORDER BY total_pedidos DESC;


-- Algum vendedor também é fornecedor?
SELECT 
    v.idVendedor, 
    v.razaoSocial AS nome_vendedor_fornecedor
FROM vendedor v
JOIN fornecedor f ON v.cnpj = f.cnpj;

-- Relação de produtos, fornecedores e estoques

SELECT 
    p.idProduto, 
    p.nome AS nome_produto, 
    f.razaoSocial AS fornecedor, 
    e.quantidade AS qtd_estoque, 
    e.localEstoque
FROM produto_fornecedor pf
JOIN produtos p ON pf.idProduto = p.idProduto
JOIN fornecedor f ON pf.idFornecedor = f.idFornecedor
JOIN produto_estoque pe ON p.idProduto = pe.idProduto
JOIN estoque e ON pe.idEstoque = e.idEstoque;


-- Relação de nomes dos fornecedores e nomes dos produtos
SELECT 
    f.razaoSocial AS fornecedor, 
    p.nome AS produto
FROM produto_fornecedor pf
JOIN produtos p ON pf.idProduto = p.idProduto
JOIN fornecedor f ON pf.idFornecedor = f.idFornecedor
ORDER BY fornecedor, produto;


