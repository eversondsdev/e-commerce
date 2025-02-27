-- Banco de Dados para E-comerce
CREATE DATABASE IF NOT EXISTS `ecommerce`;
USE `ecommerce`;

-- Criar Tabela de Clientes
CREATE TABLE IF NOT EXISTS `clientes`(
	idCliente INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(25) NOT NULL,
    sobrenome VARCHAR(20) NOT NULL,
    cpf CHAR(11) NOT NULL,
    logradouro VARCHAR(100),
    numero SMALLINT,
    complemento VARCHAR(100),
    bairro VARCHAR(30),
    cidade VARCHAR(30),
    estado CHAR(2),
    cep CHAR(8),
    PRIMARY KEY (`idCliente`),
    CONSTRAINT unique_cpf_cliente UNIQUE(cpf)
);

-- ALTER TABLE clientes DROP INDEX cpf;

-- ALTER TABLE clientes 
-- ADD COLUMN tipoCliente ENUM('PF', 'PJ') NOT NULL DEFAULT 'PF',
-- ADD COLUMN cnpj CHAR(14) UNIQUE NULL,
-- MODIFY COLUMN cpf CHAR(11) UNIQUE NULL;

-- ALTER TABLE clientes 
-- ADD CONSTRAINT chk_tipo_cliente CHECK (
 --   (tipoCliente = 'PF' AND cpf IS NOT NULL AND cnpj IS NULL) OR
 --   (tipoCliente = 'PJ' AND cnpj IS NOT NULL AND cpf IS NULL));
 
 -- ALTER TABLE clientes MODIFY COLUMN sobrenome VARCHAR(20) NULL;

-- DELIMITER $$

-- CREATE TRIGGER before_insert_clientes
-- BEFORE INSERT ON clientes
-- FOR EACH ROW
-- BEGIN
--    IF NEW.tipoCliente = 'PF' AND NEW.sobrenome IS NULL THEN
--        SIGNAL SQLSTATE '45000'
--        SET MESSAGE_TEXT = 'Erro: Clientes PF devem ter um sobrenome.';
--    END IF;
-- END $$

DELIMITER ;




-- Criar Tabela de Produtos
CREATE TABLE IF NOT EXISTS `produtos`(
	idProduto INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    categoria VARCHAR(45) NOT NULL,
    marca VARCHAR(45) NOT NULL,
    descricao VARCHAR(255) NULL,
    tamanhoProduto VARCHAR(10),
    valor DECIMAL(10,2) NOT NULL,
	PRIMARY KEY (`idProduto`)

);

-- Criar Tabela de Pedido
CREATE TABLE IF NOT EXISTS `pedido`(
	idPedido INT NOT NULL AUTO_INCREMENT,
    statusPedido ENUM('Cancelado','Processando', 'Em andamento', 'Enviado', 'Entregue') DEFAULT 'Processando',
    descricao VARCHAR(255),
    frete DECIMAL(10,2) NOT NULL,
    pedidoIdCliente INT NOT NULL,
    PRIMARY KEY (`idPedido`),
    CONSTRAINT `fk_pedido_cliente` FOREIGN KEY (`pedidoIdCliente`) REFERENCES `clientes` (`idCliente`)
);


-- Criar Tabela de Estoque
CREATE TABLE IF NOT EXISTS `estoque`(
	idEstoque INT NOT NULL AUTO_INCREMENT,
    quantidade INT NOT NULL,
	localEstoque VARCHAR(45) NULL,
    PRIMARY KEY (`idEstoque`)
);

-- Criar Tabela Fornecedor
CREATE TABLE IF NOT EXISTS `fornecedor`(
	idFornecedor INT NOT NULL AUTO_INCREMENT,
    cnpj CHAR(14) NOT NULL,
    razaoSocial VARCHAR(100) NOT NULL,
    contato VARCHAR(20) NOT NULL,
	logradouro VARCHAR(100),
    numero SMALLINT,
    complemento VARCHAR(100),
    bairro VARCHAR(30),
    cidade VARCHAR(30),
    estado CHAR(2),
    cep CHAR(8),
	PRIMARY KEY (`idFornecedor`),
    CONSTRAINT unique_cnpj_fornecedor UNIQUE(cnpj)
);


-- Criar Tabela Vendedor
CREATE TABLE IF NOT EXISTS `vendedor`(
	idVendedor INT NOT NULL AUTO_INCREMENT,
	cnpj CHAR(14) NOT NULL,
    razaoSocial VARCHAR(100) NOT NULL,
    nomeFantasia VARCHAR(45),
    contato VARCHAR(20) NOT NULL,
    logradouro VARCHAR(100),
    numero SMALLINT,
    complemento VARCHAR(100),
    bairro VARCHAR(30),
    cidade VARCHAR(30),
    estado CHAR(2),
    cep CHAR(8),
	PRIMARY KEY (`idVendedor`),
    CONSTRAINT unique_cnpj_vendedor UNIQUE(cnpj)
);

-- Criar Tabela de Medoto de Pagamento

CREATE TABLE IF NOT EXISTS `metodo_pagamento`(
	idMetodoPagemento INT NOT NULL AUTO_INCREMENT,
    metodoPagemento ENUM('Cartão de Credito', 'Cartao de Debito', 'Pix', 'Boleto') NOT NULL,
    
    PRIMARY KEY (`idMetodoPagemento`)
);

-- ALTER TABLE metodo_pagamento
-- MODIFY metodoPagemento ENUM('Cartão de Credito', 'Cartao de Debito', 'Pix', 'Boleto', 'Outro') NOT NULL,
-- ADD CONSTRAINT unique_metodo_pagemento UNIQUE (metodoPagemento);

-- Criar Tabela Entrega
CREATE TABLE IF NOT EXISTS `entrega`(
	idEntrega INT NOT NULL AUTO_INCREMENT,
    idPedido INT NOT NULL,
    codigoRastreio VARCHAR(10) NOT NULL,
    statusEntrega VARCHAR(45),
    dataEtrega DATE NOT NULL,
    
    PRIMARY KEY (`idEntrega`),
    CONSTRAINT `fk_Entrega_Pedido`FOREIGN KEY(`idPedido`) REFERENCES `pedido`(`idPedido`)
);

-- Criar Tabela de Relacionamento Pagamento por Pedido
CREATE TABLE IF NOT EXISTS `pagamento`(
	idPagamento  INT NOT NULL AUTO_INCREMENT,
    idPedido INT NOT NULL,
    idMetodoPagemento INT NOT NULL,
    statusPagamento ENUM('Aprovado', 'Pendende', 'Processando', 'Reprovado', 'Cancelado'),
    valorPago DECIMAL(10,2) NOT NULL,
    dataPagamento DATE NOT NULL,
    
    PRIMARY KEY (`idPagamento`),
	UNIQUE KEY `uk_pedido_metodo` (`idPedido`, `idMetodoPagemento`),
    CONSTRAINT `fk_Pedido_Pagamento` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`),
    CONSTRAINT `fk_Pagamento_Metodo_Pagamento` FOREIGN KEY (`idMetodoPagemento`) REFERENCES `metodo_pagamento` (`idMetodoPagemento`)
);



-- Criar Tabela de Relacionamento Produto_Vendedor
CREATE TABLE IF NOT EXISTS `produto_vendedor`(
	idProduto INT NOT NULL ,
    idVendedor INT NOT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY (`idProduto`, `idVendedor`),
	CONSTRAINT `fk_Produto_por_Vendedor` FOREIGN KEY (`idVendedor`) REFERENCES `vendedor` (`idVendedor`),
    CONSTRAINT `fk_Produto_Produtos` FOREIGN KEY (`idProduto`) REFERENCES `produtos` (`idProduto`)
);


-- Criar Tabela de Relacionamento Pedido_Produto
CREATE TABLE IF NOT EXISTS `pedido_produto`(
	idPedido INT NOT NULL,
	idProduto INT NOT NULL,
    quantidade INT NOT NULL,
    statusPedidoProduto ENUM('em estoque','sem estoque') DEFAULT 'sem estoque',
    
    PRIMARY KEY (`idProduto`, `idPedido`),
	CONSTRAINT `fk_Pedido_Produto` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`),
    CONSTRAINT `fk_Pedido_Produto_Produto` FOREIGN KEY (`idProduto`) REFERENCES `produtos` (`idProduto`)
);

	


-- Criar Tabela de Relacionamento Produto_Estoque
CREATE TABLE IF NOT EXISTS `produto_estoque`(
	idProduto INT NOT NULL,
	idEstoque INT NOT NULL,
    
    PRIMARY KEY (`idProduto`, `idEstoque`),
	CONSTRAINT `fk_Produto_Estoque` FOREIGN KEY (`idProduto`) REFERENCES `produtos` (`idProduto`),
    CONSTRAINT `fk_Estoque_Produto_Produto` FOREIGN KEY (`idEstoque`) REFERENCES `estoque` (`idEstoque`)
);

-- Criar Tabela de Relacionamento Produto_Fornecedor
CREATE TABLE IF NOT EXISTS `produto_fornecedor`(
		idProduto INT NOT NULL,
        idFornecedor INT NOT NULL,
        PRIMARY KEY (`idProduto`, `idFornecedor`),
        CONSTRAINT `fk_Produto_Fornecedor` FOREIGN KEY (`idProduto`) REFERENCES `produtos` (`idProduto`),
        CONSTRAINT `fk_Fornecedor_Produto_Produto` FOREIGN KEY (`idFornecedor`) REFERENCES `fornecedor` (`idFornecedor`)
);
