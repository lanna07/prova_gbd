DROP DATABASE gbd;
CREATE DATABASE gbd;

USE gbd;

--
-- Banco de Dados: `loja`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `IDCliente` int(10) unsigned NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Logradouro` varchar(100) DEFAULT NULL,
  `Numero` varchar(16) DEFAULT NULL,
  `Complemento` varchar(50) DEFAULT NULL,
  `Bairro` varchar(50) DEFAULT NULL,
  `CEP` varchar(12) DEFAULT NULL,
  `Cidade` varchar(60) DEFAULT NULL,
  `UF` varchar(2) NOT NULL,
  `IE` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`IDCliente`)
);

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`IDCliente`, `Nome`, `Logradouro`, `Numero`, `Complemento`, `Bairro`, `CEP`, `Cidade`, `UF`, `IE`) VALUES
(20, 'Beth', 'Av. Climerio', '45', 'Sobrado', 'Centro', '30077500', 'São Paulo', 'SP', '1923'),
(110, 'Jorge', 'Rua Caiapo', '13', 'Prédio', 'Centro', '22124391', 'Curitiba', 'PR', '2985'),
(130, 'Edmar', 'Rua da Praia', 'SN', 'Prédio', 'Centro', '30078900', 'Salvador', 'BH', '7411'),
(157, 'Paulo', 'Tv. Moraes', 'c/3', 'BOX3', 'Centro', '30046500', 'Londrina', 'PR', '2530'),
(180, 'Livio', 'Av. Beira Mar', '1256', 'Sala 23', 'Centro', '30225900', 'Florianopolis', 'SC', '1820'),
(222, 'Lúcia', 'Rua Habira', '123', 'Loja 9', 'Centro', '30126830', 'Belo Horizonte', 'MG', '9343'),
(234, 'José', 'Rua Silva Jardim', '3', 'Bloco 3 Sala 1003', 'Centro', '30225900', 'Brasilia', 'DF', '4631'),
(260, 'Susana', 'Rua Lopes Mendes', '12', 'Bloco 1 Sala 345', 'Centro', '25679300', 'Niteroi', 'RJ', '9071'),
(290, 'Renato', 'Rua Meireles', '123', 'Bloco 2 Sala 345', 'Centro', '30077500', 'São Paulo', 'SP', '2911'),
(390, 'Sebastião', 'Rua da Igreja', '10', 'Bloco 5 Sala 45', 'Centro', '30046500', 'Uberaba', 'MG', '2134'),
(410, 'Rodolfo', 'Largo da Lapa', '27', 'Sobrado', 'Centro', '25679300', 'Rio de Janeiro', 'RJ', '9280'),
(720, 'Ana', 'Rua 17', '19', 'Prédio', 'Centro', '24358310', 'Niterói', 'RJ', '2134'),
(830, 'Mauricio', 'Av. Paulista', '1236', 'Sala 2345', 'Centro', '30079300', 'São Paulo', 'SP', '7121'),
(870, 'Flávio', 'Av. Pres. Vargas', '10', 'Prédio', 'Centro', '22763931', 'São Paulo', 'SP', '4631');

-- --------------------------------------------------------

--
-- Estrutura da tabela `itempedido`
--

CREATE TABLE IF NOT EXISTS `itempedido` (
  `IDPedido` int(10) unsigned NOT NULL,
  `IDProduto` int(10) unsigned NOT NULL,
  `Quantidade` int(10) unsigned NOT NULL,
  PRIMARY KEY (`IDPedido`,`IDProduto`),
  KEY `IDProduto` (`IDProduto`)
);

--
-- Extraindo dados da tabela `itempedido`
--

INSERT INTO `itempedido` (`IDPedido`, `IDProduto`, `Quantidade`) VALUES
(91, 22, 37),
(97, 77, 20),
(98, 77, 5),
(101, 13, 5),
(101, 31, 9),
(101, 78, 18),
(103, 77, 70),
(105, 78, 10),
(108, 13, 35),
(111, 53, 10),
(111, 78, 10),
(119, 13, 17),
(119, 22, 40),
(119, 53, 6),
(119, 77, 18),
(121, 25, 10),
(121, 31, 35),
(137, 13, 10),
(138, 53, 10),
(138, 77, 40),
(143, 31, 20),
(143, 78, 45),
(148, 25, 10),
(148, 31, 7),
(148, 45, 8),
(148, 77, 3),
(148, 78, 30),
(189, 31, 6),
(203, 53, 32);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE IF NOT EXISTS `pedido` (
  `IDPedido` int(10) unsigned NOT NULL,
  `IDVendedor` int(10) unsigned NOT NULL,
  `IDCliente` int(10) unsigned NOT NULL,
  `PrazoEntrega` int(10) unsigned NOT NULL,
  PRIMARY KEY (`IDPedido`),
  KEY `IDVendedor` (`IDVendedor`),
  KEY `IDCliente` (`IDCliente`)
);

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `pedido` (`IDPedido`, `IDVendedor`, `IDCliente`, `PrazoEntrega`) VALUES
(91, 11, 260, 20),
(97, 101, 720, 20),
(98, 109, 410, 20),
(101, 101, 720, 15),
(103, 11, 260, 20),
(104, 101, 110, 30),
(105, 240, 180, 15),
(108, 310, 290, 15),
(111, 240, 260, 20),
(119, 250, 390, 30),
(121, 109, 410, 20),
(127, 11, 410, 10),
(137, 720, 720, 20),
(138, 11, 260, 20),
(143, 111, 20, 30),
(148, 101, 720, 20),
(189, 213, 870, 15),
(203, 250, 830, 30);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE IF NOT EXISTS `produto` (
  `IDProduto` int(10) unsigned NOT NULL,
  `Descricao` varchar(100) DEFAULT NULL,
  `Unidade` varchar(4) DEFAULT NULL,
  `ValorUnitario` double NOT NULL,
  PRIMARY KEY (`IDProduto`)
);

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`IDProduto`, `Descricao`, `Unidade`, `ValorUnitario`) VALUES
(13, 'Ouro', 'G', 6.18),
(22, 'Linho', 'M', 0.11),
(25, 'Queijo', 'KG', 0.97),
(30, 'Acúçar', 'SAC', 0.3),
(31, 'Chocolate', 'BAR', 0.87),
(45, 'Madeira', 'M', 0.25),
(53, 'Linha', 'M', 1.8),
(77, 'Papel', 'M', 1.05),
(78, 'Vinho', 'L', 2),
(87, 'Cano', 'M', 1.97);

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendedor`
--

CREATE TABLE IF NOT EXISTS `vendedor` (
  `IDVendedor` int(10) unsigned NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `SalarioFixo` double NOT NULL,
  `FaixaComissao` char(1) DEFAULT NULL,
  PRIMARY KEY (`IDVendedor`)
);

--
-- Extraindo dados da tabela `vendedor`
--

INSERT INTO `vendedor` (`IDVendedor`, `Nome`, `SalarioFixo`, `FaixaComissao`) VALUES
(11, 'Manoel', 2780, 'C'),
(101, 'João', 2650, 'C'),
(109, 'José', 1800, 'C'),
(111, 'Carlos', 2490, 'A'),
(213, 'Jonas', 2300, 'A'),
(240, 'Antonio', 9500, 'C'),
(250, 'Mauricio', 2930, 'B'),
(310, 'Josias', 870, 'B'),
(720, 'Felipe', 4600, 'A');

--
-- Restrições para as tabelas dumpadas
--


--
-- Restrições para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`IDVendedor`) REFERENCES `vendedor` (`IDVendedor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`IDCliente`) REFERENCES `cliente` (`IDCliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para a tabela `itempedido`
--
ALTER TABLE `itempedido`
  ADD CONSTRAINT `itempedido_ibfk_1` FOREIGN KEY (`IDPedido`) REFERENCES `pedido` (`IDPedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `itempedido_ibfk_2` FOREIGN KEY (`IDProduto`) REFERENCES `produto` (`IDProduto`) ON DELETE CASCADE ON UPDATE CASCADE;

				-- FUNCIONARIOS			

-- INSERÇÃO DE FUNCIONÁRIOS

DELIMITER $$
CREATE PROCEDURE sp_inserir_vendedores(IN _IDVendedor INT(40), IN _Nome VARCHAR(100), IN _SalarioFixo DOUBLE, IN _FaixaComissao CHAR(1))

BEGIN 

INSERT INTO vendedor(IDVendedor, Nome, SalarioFixo, FaixaComissao)
VALUES (_IDVendedor, _Nome, _SalarioFixo, _FaixaComissao);
    
END $$
    
DELIMITER ;


-- EXCLUSÃO DE FUNCIONÁRIOS (num sei)

drop procedure if exists sp_deletar_vendedores;
DELIMITER $$

CREATE PROCEDURE sp_deletar_vendedores(IN _IDVendedor INT(40))

BEGIN 

DELETE FROM vendedor WHERE IDVendedor = _IDVendedor;
    
END $$
    
DELIMITER ;

CALL sp_deletar_vendedores();



				-- CLIENTES
-- INSERÇÃO DE CLIENTES

DELIMITER $$
CREATE PROCEDURE sp_inserir_clientes(IN _Nome VARCHAR(100), IN _Logradouro VARCHAR(100), IN _Numero VARCHAR(16), IN _Complemento VARCHAR(50), IN _Bairro VARCHAR(50), IN _CEP VARCHAR(12), IN _Cidade VARCHAR(60), IN _UF VARCHAR(2), IN _IE VARCHAR(16))

BEGIN 

INSERT INTO cliente(Nome, Logradouro, Numero, Complemento, Bairro, CEP, Cidade, UF, IE)
VALUES (_Nome, _Logradouro, _Numero, _Complemento, _Bairro, _CEP, _Cidade, _UF, _IE);
    
END $$
    
DELIMITER ;

-- EXCLUSÃO DE CLIENTES (num sei)

drop procedure if exists sp_deletar_cliente;
DELIMITER $$

CREATE PROCEDURE sp_deletar_cliente(IN _IDCliente INT(40))

BEGIN 

DELETE FROM cliente WHERE IDCliente = _IDCliente;
    
END $$
    
DELIMITER ;

-- PRODUTOS
-- INSERÇÃO DE PRODUTOS

DELIMITER $$
CREATE PROCEDURE sp_inserir_produtos(IN _IDProduto INT(10), IN _Descricao VARCHAR(100), IN _Unidade VARCHAR(4), IN ValorUnitario DOUBLE)

BEGIN 

INSERT INTO produto(IDProduto, Descricao, Unidade, ValorUnitario)
VALUES (_IDProduto, _Descricao, _Unidade, _ValorUnitario);
    
END $$
    
DELIMITER ;

-- EXCLUSÃO DE PRODUTOS (num sei)

drop procedure if exists sp_deletar_produto;
DELIMITER $$

CREATE PROCEDURE sp_deletar_produto(IN _IDProduto INT(40))

BEGIN 

DELETE FROM produto WHERE IDProduto = _IDProduto;
    
END $$
    
DELIMITER ;



-- CADASTRAR ITEMVENDA E VERIFICA SE O ESTOQUE É SUFICIENTE

DELIMITER $$

CREATE PROCEDURE 
BEGIN

	SELECT quantidade FROM itemVenda 
		IF (quantidade =>1) {
			INSERT INTO itemVenda (codvenda, codProduto, quantidade) VALUES (1, 11, '1');
		ELSE 
			SELECT 'Estoque insuficiente' AS Msg;
		END IF;

END $$

DELIMITER ;

