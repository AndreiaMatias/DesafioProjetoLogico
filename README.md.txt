Foi criado o banco de dados ecommerce conforme especificações repassadas no desafio anterior.

Foram criadas algumas entradas para que fossem feitas buscas.

O banco de dados conta com as seguintes tabelas:
tipopessoa
cliente
fornecedor
estoque
produto
produto_existe_estoque (relação muitos para muitos) 
entrega
formapagamento
pedido
pedido_contem_produto (relação muitos para muitos) 
vendedor
vendedor_vende_produto (relação muitos para muitos) 

Foram feitas as seguintes buscas de informações:
-Seleção de todos os clientes;
-Seleção de clientes que nasceram a partir da década de 90;
-Cálculo da idade dos clientes e ordenação pelo mais velho;
-Criação de faixas etárias para criar tabela de frequência;
-Seleção de clientes que tenham feito pedido e seu status;
-Lista de produtos e seus fornecedores;
-Dados dos pedidos cujos produtos estavam em estoque;
-Produtos e seus totais independente do status;
-Quantos pedidos foram feitos por cada cliente;
-Se algum vendedor também é fornecedor;
-Relação de produtos fornecedores e estoques;
-Local de estoque em que a quantidade de items seja maior que a média dos items

Para tanto, foram utilizados:
- where;
- order by;
- case when;
- concat;
- group by;
- having;
- avg e sum;
- inner e left joins.


The database ecommerce has been created according to the directions given in the previous chalenge.

Some entries were inserted into the database so that it could be queried.

Here are the tables contained in the database:
tipopessoa (whether legal entity or natural person)
cliente (customer)
fornecedor (supplier)
estoque (stock)
produto (product)
produto_existe_estoque (product is in stock) - many to many relationship
entrega (shipping)
formapagamento (payment method)
pedido (order)
pedido_contem_produto (product in order) - many to many relationship
vendedor (salesperson)
vendedor_vende_produto (salesperson sells product) - many to many relationship