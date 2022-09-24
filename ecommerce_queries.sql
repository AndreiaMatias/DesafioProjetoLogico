use ecommerce;

/*Selecionando todos os clientes*/
select * 
from cliente;

/*selecionando clientes que nasceram a partir da década de 90.*/
select * 
from cliente
where year(dataNascimento) >= 1990;

/*calculando a idade dos clientes e ordenando pelo mais velho*/
select concat(Pnome, " ", Sobrenome) as nomeCompleto,
	year(curdate()) - year(DataNascimento) as idade
from cliente
order by idade desc;

/*criando faixas etárias para criar tabela de frequência*/
select case when (year(curdate()) - year(DataNascimento)) >= 18 and  (year(curdate()) - year(DataNascimento)) <= 25 then "18-25"
	when (year(curdate()) - year(DataNascimento)) >= 26 and  (year(curdate()) - year(DataNascimento)) <= 40 then "26-40"
    when (year(curdate()) - year(DataNascimento)) >= 41 and  (year(curdate()) - year(DataNascimento)) <= 60 then "41-60"
    when (year(curdate()) - year(DataNascimento)) >= 61  then ">60"
    end as faixaEtaria,
    count(*)
    from cliente
    group by faixaEtaria;
    
    /*selecionando clientes que tenham feito pedido e seu status*/
    select p.idpedido,
		concat(c.Pnome, " ", c.Sobrenome),
		e.StatusPedido,
        e.responsavel
    from cliente c
    inner join pedido p
    on c.idCliente = p.idCliente
    left join Entrega e
    on p.idEntrega = e.idEntrega;
    
    /*lista de produtos e seus fornecedores*/
    select p.idproduto,
		p.categoria,
        p.descricao,
        p.dimensoes,
        p.valor,
		f.razaosocial as fornecedor
    from fornecedor f
    left join produto p
    on f.idfornecedor = p.idfornecedor;
    
    /*dados dos pedidos cujos produtos estavam em estoque*/
    select p.idpedido as 'nº do pedido',
		concat(c.pnome, ' ', c.sobrenome) as cliente,
		pp.idproduto as 'cod produto',
        concat(pr.descricao, ' - ', f.razaosocial) as 'descrição',
        quantidade,
        pr.valor as 'preço unitário',
        valor * quantidade as 'valor total produto',
        p.frete as 'Valor do frete'
    from pedido p
    left join pedido_contem_produto pp
    on p.idpedido = pp.idpedido
    left join cliente c
    on p.idcliente = c.idcliente
    left join produto pr
    on pp.idproduto = pr.idproduto
    left join fornecedor f
    on pr.idfornecedor = f.idfornecedor
    where status = 'disponivel';
    
    /*Produtos e seus totais independente do status*/
    select 
		pp.idproduto as 'cod produto',
        concat(pr.descricao, ' - ', f.razaosocial) as 'descrição',
        quantidade,
        pr.valor as 'preço unitário',
        valor * quantidade as 'valor total produto'
    from pedido p
    left join pedido_contem_produto pp
    on p.idpedido = pp.idpedido
    left join produto pr
    on pp.idproduto = pr.idproduto
    left join fornecedor f
    on pr.idfornecedor = f.idfornecedor;
    
    /*Quantos pedidos foram feitos por cada cliente?*/
    select 
		concat(c.Pnome, " ", c.Sobrenome) as cliente,
        count(p.idpedido) as qtdePedidos
    from cliente c
    left join pedido p
    on c.idCliente = p.idCliente
    group by c.idcliente;
    
    /*Algum vendedor também é fornecedor?*/
    select *
    from vendedor
    inner join fornecedor
    where identificacao = CNPJ;
    /*Não há vendedores que sejam fornecedores*/
    
/*Relação de produtos fornecedores e estoques;*/
select p.idproduto,
	p.descricao,
    f.razaosocial as fornecedor,
    e.local as localEstoque,
    e.quantidade
from produto p
left join fornecedor f
on p.idfornecedor = f.idfornecedor
left join produto_existe_estoque pe
on p.idproduto = pe.idproduto
left join estoque e
on pe.idestoque = e.idestoque;

/*local de estoque em que a quantidade de items seja maior que a média dos items*/

select
    e.local as localEstoque,
    SUM(e.quantidade) as totalEstoque
from produto p
left join produto_existe_estoque pe
on p.idproduto = pe.idproduto
left join estoque e
on pe.idestoque = e.idestoque
group by localEstoque
having totalEstoque > (select avg(quantidade) from estoque);

    
    
    
    
