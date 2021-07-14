BEGIN TRANSACTION

/*
	Criação de tabela Cliente
*/

CREATE TABLE Cliente
(
	Codigo int Identity (1,1) NOT NULL,
	CPF CHAR(11) NOT NULL,
	Nome VARCHAR(40),
	Email VARCHAR(40),
	Telefone CHAR(11),
	Celular CHAR(11),
	CEP CHAR(8),
	Logadouro VARCHAR(40),
	Estado CHAR(2),
	Cidade VARCHAR(35),
	CONSTRAINT PK_CodigoCliente PRIMARY KEY (Codigo)
)

/*
	Criação de tabela Fidelidade
*/

CREATE TABLE Fidelidade
(
	Codigo_Cliente int,
	Data_Adesao DATETIME NOT NULL,
	Pontos INT,
	CONSTRAINT PK_CodigoClienteFidelidade PRIMARY KEY (Codigo_Cliente),
	CONSTRAINT FK_CodigoCliente_Fidelidade FOREIGN KEY (Codigo_Cliente) REFERENCES Cliente(Codigo)
)

/*
	Criação de tabela Forma de Pagamento
*/

CREATE TABLE Forma_Pagamento
(
	Codigo INT IDENTITY (1,1) NOT NULL,
	Nome VARCHAR(25),
	Tipo VARCHAR(25),
	CONSTRAINT PK_CodigoPagamento PRIMARY KEY (Codigo)
)

/*
	Criação de tabela Marca
*/

CREATE TABLE Marca
(
	Codigo INT IDENTITY(1,1) NOT NULL,
	Nome VARCHAR(20),
	Empresa VARCHAR(30),
	CONSTRAINT PK_CodigoMarca PRIMARY KEY (Codigo)
)

/*
	Criação de tabela Produto
*/

CREATE TABLE Produto
(
	Codigo INT IDENTITY(1,1) NOT NULL,
	Nome VARCHAR(30),
	Descricao VARCHAR(MAX),
	Codigo_Marca INT NOT NULL,
	CONSTRAINT PK_CodigoProduto PRIMARY KEY (Codigo),
	CONSTRAINT FK_CodigoMarca FOREIGN KEY (Codigo_Marca) REFERENCES Marca(codigo)
)

/*
	Criação de tabela Pedido de Venda
*/

CREATE TABLE Pedido_Venda
(
	Codigo INT IDENTITY(1,1) NOT NULL,
	Valor DECIMAL(6,2),
	Valor_Imposto DECIMAL(6,2),
	Data DATETIME NOT NULL,
	Codigo_Forma_Pagamento INT NOT NULL,
	Codigo_Cliente INT NOT NULL,
	CONSTRAINT PK_CodigoVenda PRIMARY KEY (Codigo),
	CONSTRAINT FK_CodigoFormaPagamento FOREIGN KEY (Codigo_Forma_Pagamento) REFERENCES Forma_Pagamento(Codigo),	
	CONSTRAINT FK_CodigoCliente FOREIGN KEY (Codigo_Cliente) REFERENCES Cliente(Codigo)
)

/*
	Criação de tabela Item de Pedido de Venda
*/

CREATE TABLE Item_Pedido_Venda
(
	Codigo INT IDENTITY(1,1) NOT NULL,
	Valor_Total DECIMAL(6,2),
	Valor_Imposto DECIMAL(6,2),
	Valor_Unitario DECIMAL(6,2),
	Quantidade int,
	Codigo_Produto INT NOT NULL,
	Codigo_Pedido_Venda INT NOT NULL,
	CONSTRAINT PK_CodigoPedidoVenda PRIMARY KEY (Codigo),
	CONSTRAINT FK_CodigoProduto FOREIGN KEY (Codigo_Produto) REFERENCES Produto(Codigo),
	CONSTRAINT FK_CodigoVenda FOREIGN KEY (Codigo_Pedido_Venda) REFERENCES Pedido_Venda(Codigo)
)

/*
	Criação de tabela Distribuidor
*/

CREATE TABLE Distribuidor 
(
	Codigo INT IDENTITY(1,1) NOT NULL,
	CNPJ VARCHAR(14) NOT NULL,
	Nome_Fantasia VARCHAR(40) NOT NULL,
	Razao_Social VARCHAR(40) NOT NULL,
	CEP NCHAR(8),
	Logadouro VARCHAR(40),
	Estado CHAR(2),
	Cidade VARCHAR(35),
	CONSTRAINT PK_CodigoDistribuidor PRIMARY KEY (Codigo)
)

/*
	Criação de tabela Pedido de Compra
*/

CREATE TABLE Pedido_Compra
(
	Codigo INT IDENTITY(1,1) NOT NULL,
	Data DATETIME NOT NULL,
	Valor DECIMAL(6,2),
	Entregue BIT,
	Codigo_Distribuidor INT NOT NULL,
	CONSTRAINT PK_CodigoPedidoCompra PRIMARY KEY (Codigo),
	CONSTRAINT FK_CodigoDistribuidor FOREIGN KEY (Codigo_Distribuidor) REFERENCES Distribuidor(Codigo)
)

/*
	Criação de tabela Item de Pedido de Compra
*/

CREATE TABLE Item_Pedido_Compra
(
	Codigo INT IDENTITY(1,1) NOT NULL,
	ValorTotal DECIMAL(6,2),
	ValorUnitario DECIMAL(6,2),
	Quantidade int,
	Codigo_Produto INT NOT NULL,
	Codigo_Pedido_Compra INT NOT NULL,
	CONSTRAINT PK_CodigoItemPedidoCompra PRIMARY KEY (Codigo),
	CONSTRAINT FK_CodigoProduto2 FOREIGN KEY (Codigo_Produto) REFERENCES Produto(Codigo),
	CONSTRAINT FK_CodigoPedidoCompra FOREIGN KEY (Codigo_Pedido_Compra) REFERENCES Pedido_Compra(Codigo),
)

--COMMIT
--ROLLBACK




