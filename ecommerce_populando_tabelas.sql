use ecommerce;

INSERT INTO TIPOPESSOA(PESSOA) VALUES
('PF'),
('PJ');



INSERT INTO CLIENTE(
	Pnome,
	NMeioInicial,
	Sobrenome,
	CPF,
	Endereco,
	idTipoPessoa,
	DataNascimento
)
values
('MARIA', 'M', 'MATIAS', '12345678911', 'RUA DEBAIXO, 154, SÃO PAULO, SP', 1, '1990-08-20'),
('ANDREIA', 'M', 'DION', '22358278911', 'RUA DECIMA, 1, SÃO PAULO, SP', 1, '1950-01-26'),
('EDUARDO', 'C', 'DURAN', '33335678911', 'RUA DOS LOUCOS, 1750, SÃO PAULO, SP', 1, '1985-01-01'),
('FABIO', 'F', 'NAGO', '12345678311', 'RUA DOS ESTUDANTES, 582, SÃO PAULO, SP', 1, '2000-05-15');


INSERT INTO FORNECEDOR(
	RazaoSocial,
	CNPJ,
    Contato
    )
    VALUES
    ('NESTLE', '12345678000134', 'JOAO'),
    ('BUETNNER', '54625018000111', 'HANS'),
    ('LACTA', '33335678000134', 'MARISA');

INSERT INTO ESTOQUE(
    Local,
    Quantidade
)
VALUES
('SAO PAULO', 1000),
('RIO DE JANEIRO', 800),
('CURITIBA', 400)
;

INSERT INTO PRODUTO(
    Categoria,
    Descricao,
    Dimensoes,
    Valor,
    idFornecedor
)
VALUES
('ALIMENTOS', 'BOMBONIERE', '10x5x4', 15, 1),
('ALIMENTOS', 'BOMBONIERE', '20X10X4', 7.5, 3),
('MODA', 'SAIA', '42', 40, 2);

INSERT INTO PRODUTO_EXISTE_ESTOQUE(
	idProduto,
    idEstoque,
    local
)
VALUES
(1, 2, 'RJ'),
(2, 2, 'RJ'),
(3, 3, 'PR')
;

insert into ENTREGA(
    Responsavel,
    StatusPedido,
    Rastreio
)
values
('loggi', 'Entregue', '12345678'),
('loggi', 'Encaminhado para transportadora', '55345678'),
('direct', 'Entregue', '12345688');



INSERT INTO FORMAPAGAMENTO(
    FormaPagamento)
    VALUES
    ('Pix'), ('Cartão de crédito'), ('Boleto bancário');


INSERT INTO PEDIDO(
    Descricao,
    idCliente,
    frete,
    idEntrega,
    idFormaPagamento
)
VALUES
('ALIMENTO', 1, 5, 1,1),
('ALIMENTO', 2, 10.5, 2,2);



INSERT INTO PEDIDO_CONTEM_PRODUTO(
	idPedido,
    idProduto,
    quantidade,
    status
)
VALUES
(3, 2, 5, 'DISPONÍVEL'),
(4, 1, 3, 'SEM ESTOQUE');

INSERT INTO VENDEDOR(
    RazaoSocial,
    Local,
    TipoVendedor,
    identificacao,
    NomeFantasia
)
VALUES
('LOJA DO JOAO', 'RJ', 2, '1234568977456', 'DOCES DO JOAO'),
('VESTBEM', 'PR', 2, '1234555577456', 'VESTBEM');

INSERT INTO VENDEDOR_VENDE_PRODUTO(
	idVendedor,
    idProduto,
    Qtde
)
VALUES
(1, 1, 5),
(2, 3, 3);

