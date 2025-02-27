-- Inserções na Tabela Clientes
INSERT INTO clientes (nome, sobrenome, cpf, logradouro, numero, complemento, bairro, cidade, estado, cep) VALUES
('João', 'Silva', '12345678901', 'Rua das Flores', 120, 'Apto 301', 'Centro', 'São Paulo', 'SP', '01001000'),
('Maria', 'Souza', '23456789012', 'Av. Paulista', 1500, 'Bloco B', 'Bela Vista', 'São Paulo', 'SP', '01310000'),
('Carlos', 'Pereira', '34567890123', 'Rua das Acácias', 45, NULL, 'Jardins', 'Rio de Janeiro', 'RJ', '22290040'),
('Ana', 'Oliveira', '45678901234', 'Rua do Comércio', 98, 'Casa 2', 'Centro', 'Belo Horizonte', 'MG', '30120010'),
('Lucas', 'Fernandes', '56789012345', 'Av. Brasil', 500, NULL, 'Copacabana', 'Rio de Janeiro', 'RJ', '22041001'),
('Mariana', 'Alves', '67890123456', 'Rua XV de Novembro', 210, NULL, 'Centro', 'Curitiba', 'PR', '80020010'),
('Fernando', 'Costa', '78901234567', 'Av. Ipiranga', 3200, 'Sala 1002', 'República', 'São Paulo', 'SP', '01046010'),
('Patrícia', 'Rodrigues', '89012345678', 'Rua Augusta', 112, 'Apto 54', 'Consolação', 'São Paulo', 'SP', '01304001'),
('Rafael', 'Mendes', '90123456789', 'Rua da Praia', 75, NULL, 'Centro', 'Porto Alegre', 'RS', '90010000'),
('Juliana', 'Martins', '01234567890', 'Rua das Palmeiras', 35, NULL, 'Boa Viagem', 'Recife', 'PE', '51020000');

INSERT INTO clientes (tipoCliente, nome, sobrenome, cnpj, logradouro, numero, complemento, bairro, cidade, estado, cep) VALUES
('PJ', 'Empresa Alpha', NULL, '12345678000101', 'Av. das Indústrias', 100, 'Sala 301', 'Centro', 'São Paulo', 'SP', '01001000'),
('PJ', 'Tech Solutions', NULL, '22345678000102', 'Rua da Tecnologia', 200, 'Andar 5', 'Jardins', 'Rio de Janeiro', 'RJ', '20040000'),
('PJ', 'Comércio Global', NULL, '32345678000103', 'Alameda Comercial', 150, NULL, 'Bela Vista', 'Curitiba', 'PR', '80010000'),
('PJ', 'Indústria Forte', NULL, '42345678000104', 'Rodovia dos Trabalhadores', 5000, 'Galpão A', 'Distrito Industrial', 'Belo Horizonte', 'MG', '30110000'),
('PJ', 'Logística Express', NULL, '52345678000105', 'Rua do Transporte', 90, NULL, 'Porto', 'Salvador', 'BA', '40010000');



-- Inserções na Tabela Produtos
INSERT INTO produtos (nome, categoria, marca, descricao, tamanhoProduto, valor) VALUES
('Smartphone X', 'Eletrônicos', 'TechBrand', 'Smartphone com tela de 6.5", 128GB, câmera dupla.', NULL, 2999.90),
('Notebook Ultra', 'Informática', 'CompTech', 'Notebook com processador i7, 16GB RAM, SSD 512GB.', NULL, 5499.99),
('Tênis Running Pro', 'Calçados', 'SportMax', 'Tênis para corrida, solado antiderrapante.', '42', 399.90),
('Camisa Polo', 'Vestuário', 'FashionWear', 'Camisa polo de algodão premium.', 'M', 129.90),
('Cafeteira Elétrica', 'Eletrodomésticos', 'CaféTop', 'Cafeteira programável para até 12 xícaras.', NULL, 249.99),
('Mochila Executiva', 'Acessórios', 'UrbanStyle', 'Mochila resistente à água, compartimento para laptop.', NULL, 199.90),
('Fone de Ouvido Bluetooth', 'Eletrônicos', 'SoundPro', 'Fone de ouvido sem fio com cancelamento de ruído.', NULL, 499.90),
('Monitor 27” Full HD', 'Informática', 'ViewTech', 'Monitor LED de 27 polegadas, resolução Full HD.', NULL, 1299.99),
('Perfume Elegance', 'Perfumaria', 'LuxuryScents', 'Fragrância sofisticada, longa duração.', '100ml', 349.90),
('Bicicleta Speed Racer', 'Esportes', 'BikePro', 'Bicicleta speed com quadro de alumínio e 24 marchas.', NULL, 3599.00);


-- Inserções na Tabela Pedido
INSERT INTO pedido (statusPedido, descricao, frete, pedidoIdCliente) VALUES
('Processando', 'Pedido de eletrônicos e acessórios.', 15.90, 1),
('Em andamento', 'Pedido de vestuário e calçados.', 20.00, 2),
('Enviado', 'Pedido de informática.', 25.50, 3),
('Entregue', 'Pedido de perfumes e cosméticos.', 10.00, 4),
('Cancelado', 'Pedido de uma bicicleta, cancelado pelo cliente.', 50.00, 5),
('Processando', 'Pedido de um monitor e acessórios de escritório.', 30.00, 6),
('Em andamento', 'Pedido de uma mochila e um fone de ouvido Bluetooth.', 18.90, 7),
('Enviado', 'Pedido de um tênis esportivo.', 12.50, 8),
('Entregue', 'Pedido de uma cafeteira elétrica.', 22.00, 9),
('Entregue', 'Pedido de um smartphone e uma capa protetora.', 15.00, 10);


-- Inserções na Tabela Estoque
INSERT INTO estoque (quantidade, localEstoque) VALUES
(50, 'Armazém Central'),
(30, 'Filial Norte'),
(20, 'Filial Sul'),
(100, 'Centro de Distribuição SP'),
(15, 'Loja Física RJ'),
(40, 'Filial Oeste'),
(60, 'Centro de Distribuição MG'),
(25, 'Loja Física SP'),
(80, 'Armazém Nordeste'),
(10, 'Filial Leste'),
(5, 'Armazém MG'),
(8, 'Filial Brasília'),
(2, 'CD Bahia');

-- Inserções na Tabela Fornecedor
INSERT INTO fornecedor (cnpj, razaoSocial, contato, logradouro, numero, complemento, bairro, cidade, estado, cep) VALUES
('12345678000199', 'Tech Solutions LTDA', '(11) 98765-4321', 'Av. Paulista', 1500, 'Sala 502', 'Bela Vista', 'São Paulo', 'SP', '01310000'),
('23456789000188', 'Eletrônicos Brasil S.A.', '(21) 99876-5432', 'Rua das Palmeiras', 120, NULL, 'Centro', 'Rio de Janeiro', 'RJ', '20040002'),
('34567890000177', 'FashionWear Indústria', '(31) 91234-5678', 'Av. Amazonas', 560, 'Galpão 3', 'Industrial', 'Belo Horizonte', 'MG', '30150010'),
('45678901000166', 'Mega Informática Ltda.', '(41) 92345-6789', 'Rua XV de Novembro', 80, NULL, 'Centro', 'Curitiba', 'PR', '80020020'),
('56789012000155', 'CaféTop Distribuidora', '(51) 93456-7890', 'Av. Brasil', 255, 'Loja A', 'Boa Vista', 'Porto Alegre', 'RS', '90010030'),
('67890123000144', 'BikePro Importadora', '(81) 94567-8901', 'Rua das Bicicletas', 75, NULL, 'Boa Viagem', 'Recife', 'PE', '51020040'),
('78901234000133', 'UrbanStyle Comércio', '(71) 95678-9012', 'Av. Tancredo Neves', 1200, 'Andar 5', 'Caminho das Árvores', 'Salvador', 'BA', '41820050'),
('89012345000122', 'LuxuryScents Perfumes', '(62) 96789-0123', 'Rua das Rosas', 90, NULL, 'Setor Bueno', 'Goiânia', 'GO', '74210060'),
('90123456000111', 'CompTech Componentes', '(85) 97890-1234', 'Av. Dom Luís', 300, 'Sala 402', 'Aldeota', 'Fortaleza', 'CE', '60160070'),
('01234567000100', 'SoundPro Áudio', '(95) 98901-2345', 'Rua da Música', 15, NULL, 'Centro', 'Manaus', 'AM', '69010080');


-- Inserções na Tabela Vendedor
INSERT INTO vendedor (cnpj, razaoSocial, nomeFantasia, contato, logradouro, numero, complemento, bairro, cidade, estado, cep) VALUES
('11223344000199', 'TechStore Comércio LTDA', 'TechStore', '(11) 90000-0001', 'Av. Paulista', 1000, 'Sala 101', 'Bela Vista', 'São Paulo', 'SP', '01310000'),
('22334455000188', 'EletroShop Distribuidora', 'EletroShop', '(21) 91111-1112', 'Rua das Laranjeiras', 250, NULL, 'Centro', 'Rio de Janeiro', 'RJ', '22240000'),
('33445566000177', 'Moda Fashion LTDA', 'ModaFashion', '(31) 92222-2223', 'Av. Afonso Pena', 500, 'Bloco C', 'Funcionários', 'Belo Horizonte', 'MG', '30130000'),
('44556677000166', 'Super Games Comércio', 'SuperGames', '(41) 93333-3334', 'Rua XV de Novembro', 200, NULL, 'Centro', 'Curitiba', 'PR', '80020000'),
('55667788000155', 'Bike World', 'BikeWorld', '(51) 94444-4445', 'Av. Ipiranga', 700, 'Loja 12', 'Santana', 'Porto Alegre', 'RS', '90050000'),
('66778899000144', 'Beleza & Cia LTDA', 'BelezaCia', '(81) 95555-5556', 'Rua dos Perfumes', 350, NULL, 'Boa Viagem', 'Recife', 'PE', '51020000'),
('77889900000133', 'Urban Style Comércio', 'UrbanStyle', '(71) 96666-6667', 'Av. Paralela', 1200, 'Andar 2', 'Caminho das Árvores', 'Salvador', 'BA', '41820000'),
('88990011000122', 'Casa dos Eletrônicos', 'CasaEletrônicos', '(62) 97777-7778', 'Rua 89', 90, NULL, 'Setor Sul', 'Goiânia', 'GO', '74000000'),
('99001122000111', 'CompuTech Soluções', 'CompuTech', '(85) 98888-8889', 'Av. Beira Mar', 500, 'Sala 305', 'Meireles', 'Fortaleza', 'CE', '60165000'),
('10002233000100', 'SoundMax Áudio', 'SoundMax', '(95) 99999-9990', 'Rua das Ondas', 80, NULL, 'Centro', 'Manaus', 'AM', '69010000');


-- Inserções na Tabela Metodo de Pagamento
INSERT INTO metodo_pagamento (metodoPagemento) VALUES
('Cartão de Crédito'),
('Cartão de Débito'),
('Pix'),
('Boleto'),
('Outro');


-- Inserções na Tabela Entrega
INSERT INTO entrega (idPedido, codigoRastreio, statusEntrega, dataEtrega) VALUES
(1, 'RSTR123456', 'Enviado', '2025-02-20'),
(2, 'RSTR234567', 'Entregue', '2025-02-22'),
(3, 'RSTR345678', 'Em trânsito', '2025-02-23'),
(4, 'RSTR456789', 'Aguardando retirada', '2025-02-25'),
(5, 'RSTR567890', 'Cancelado', '2025-02-24'),
(6, 'RSTR678901', 'Enviado', '2025-02-26'),
(7, 'RSTR789012', 'Entregue', '2025-02-27'),
(8, 'RSTR890123', 'Em trânsito', '2025-02-28'),
(9, 'RSTR901234', 'Enviado', '2025-02-25'),
(10, 'RSTR012345', 'Entregue', '2025-02-22');


-- Inserções na Tabela Pagamento
INSERT INTO pagamento (idPedido, idMetodoPagemento, statusPagamento, valorPago, dataPagamento) VALUES
(1, 6, 'Aprovado', 150.00, '2024-02-20'),
(2, 7, 'Aprovado', 120.50, '2025-02-22'),
(3, 8, 'Pendende', 250.00, '2025-02-23'),
(4, 9, 'Processando', 300.00, '2025-02-25'),
(5, 10, 'Reprovado', 180.75, '2025-02-24'),
(6, 8, 'Aprovado', 215.90, '2024-02-26'),
(7, 6, 'Cancelado', 0.00, '2024-02-27'),
(8, 9, 'Aprovado', 99.99, '2025-02-28'),
(9, 7, 'Aprovado', 150.00, '2023-02-25'),
(10, 10, 'Aprovado', 120.00, '2025-02-22');


-- Inserções na Tabela Produto_Vendedor
INSERT INTO produto_vendedor (idProduto, idVendedor, quantidade) VALUES
(1, 2, 50),
(2, 3, 30),
(3, 6, 20),
(4, 4, 15),
(5, 5, 100),
(6, 6, 80),
(7, 7, 60),
(8, 8, 25),
(9, 9, 40),
(10, 10, 10);


-- Inserções na Tabela Pedido_Produto
INSERT INTO pedido_produto (idPedido, idProduto, quantidade, statusPedidoProduto) VALUES
(1, 1, 10, 'em estoque'),
(1, 2, 25, 'em estoque'),
(2, 3, 14, 'sem estoque'),
(2, 4, 6, 'em estoque'),
(3, 5, 4, 'sem estoque'),
(3, 6, 80, 'em estoque'),
(4, 7, 10, 'em estoque'),
(4, 8, 2, 'sem estoque'),
(5, 9, 7, 'em estoque'),
(6, 10, 1, 'sem estoque');


-- Inserções na Tabela Produto_Estoque
INSERT INTO produto_estoque (idProduto, idEstoque) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(8, 11),
(9, 12),
(10, 13);

-- Inserções na Tabela Produto_Fornecedor
INSERT INTO produto_fornecedor (idProduto, idFornecedor) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);
