/*Criação do banco de dados para o cenário de e-commerce*/

CREATE DATABASE ecommerce;

USE ecommerce;


CREATE TABLE IF NOT EXISTS TIPOPESSOA(
idTipoPessoa INT PRIMARY KEY AUTO_INCREMENT,
Pessoa ENUM("PF", "PJ") NOT NULL
);

CREATE TABLE IF NOT EXISTS CLIENTE(
	idCliente INT PRIMARY KEY AUTO_INCREMENT,
	Pnome VARCHAR(10) NOT NULL,
	NMeioInicial VARCHAR(3),
	Sobrenome VARCHAR(20) NOT NULL,
	CPF CHAR(11) NOT NULL,
	Endereco VARCHAR(45) NOT NULL,
	idTipoPessoa INT,
	DataNascimento date,
	CONSTRAINT unique_cpf_cliente UNIQUE(CPF),
    constraint fk_tipo_pessoa foreign key (idTipoPessoa) references tipoPessoa(idTipoPessoa)
);

CREATE TABLE IF NOT EXISTS FORNECEDOR(
	idFornecedor INT PRIMARY KEY AUTO_INCREMENT,
	RazaoSocial VARCHAR(45) NOT NULL,
	CNPJ CHAR(14) NOT NULL,
    Contato VARCHAR(45) NOT NULL,
	CONSTRAINT unique_cnpj_cliente UNIQUE(CNPJ)
);

CREATE TABLE IF NOT EXISTS ESTOQUE(
	idEstoque INT PRIMARY KEY AUTO_INCREMENT,
    Local VARCHAR(45) NOT NULL,
    Quantidade INT DEFAULT 0
);

CREATE TABLE IF NOT EXISTS PRODUTO(
	idProduto INT PRIMARY KEY AUTO_INCREMENT,
    Categoria ENUM("ELETRÔNICO", "MODA", "BRINQUEDOS", "ALIMENTOS") NOT NULL,
    Descricao VARCHAR(45) NOT NULL,
    Dimensoes VARCHAR(45) NOT NULL,
    Valor DOUBLE NOT NULL,
    idFornecedor INT NOT NULL,
    constraint fk_produto_fornecedor foreign key(idFornecedor) references Fornecedor(idFornecedor)
);

CREATE TABLE IF NOT EXISTS PRODUTO_EXISTE_ESTOQUE(
	idProduto INT,
    idEstoque INT,
    local varchar(255) not null,
    primary key(idProduto, idEstoque),
    constraint fk_produto foreign key (idProduto) references produto(idProduto),
    constraint fk_estoque foreign key (idEstoque) references estoque(idEstoque)
);

CREATE TABLE IF NOT EXISTS ENTREGA(
	idEntrega INT PRIMARY KEY AUTO_INCREMENT,
    Responsavel VARCHAR(45) NOT NULL,
    StatusPedido ENUM("Pedido recebido", "Aguardando Pagamento", "Pago", "Encaminhado para transportadora", "Entregue") NOT NULL,
    Rastreio VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS FORMAPAGAMENTO(
	idFormaPagamento INT PRIMARY KEY AUTO_INCREMENT,
    FormaPagamento ENUM('Pix', 'Cartão de crédito', 'Boleto bancário') NOT NULL
);

CREATE TABLE IF NOT EXISTS PEDIDO(
	idPedido INT PRIMARY KEY AUTO_INCREMENT,
    Descricao VARCHAR(45) NOT NULL,
    idCliente INT NOT NULL,
    frete DOUBLE NOT NULL,
    idEntrega INT NOT NULL,
    idFormaPagamento INT NOT NULL,
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    CONSTRAINT fk_formaPagamento_pedido FOREIGN KEY (idFormaPagamento) REFERENCES FormaPagamento(idFormaPagamento),
	CONSTRAINT fk_entrega_pedido FOREIGN KEY (idEntrega) REFERENCES Entrega(idEntrega)
);


CREATE TABLE IF NOT EXISTS PEDIDO_CONTEM_PRODUTO(
	idPedido INT,
    idProduto INT,
    quantidade INT,
    status ENUM("disponível", "sem estoque") DEFAULT "disponível",
    PRIMARY KEY (idPedido, idProduto),
    CONSTRAINT fk_produto_contem FOREIGN KEY (idProduto) REFERENCES Produto(idProduto),
    CONSTRAINT fk_contem_pedido FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido)
);

CREATE TABLE IF NOT EXISTS VENDEDOR(
	idVendedor INT PRIMARY KEY AUTO_INCREMENT,
    RazaoSocial VARCHAR(45) NOT NULL,
    Local VARCHAR(45) NOT NULL,
    TipoVendedor INT NOT NULL,
    identificacao VARCHAR(15) NOT NULL,
    NomeFantasia VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS VENDEDOR_VENDE_PRODUTO(
	idVendedor INT,
    idProduto INT,
    Qtde INT,
    primary key(idVendedor, idProduto),
    constraint fk_vendedor_vende foreign key (idVendedor) references Vendedor(idVendedor),
    constraint fk_vende_produto foreign key (idProduto) references Produto(idProduto)
);

show tables;

use information_schema;

desc referential_constraints;