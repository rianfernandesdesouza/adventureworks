with
    source_pedidos_vendas_detalhes as (
        select
            cast(salesorderid as int) as id_pedidos_vendas  			
            , cast(salesorderdetailid as int) as id_pedidos_vendas_detalhes  			
            , cast(carriertrackingnumber as string) as numero_rastreamento_operadora  			
            , cast(orderqty as int) as quantidade_pedido 			
            , cast(productid as int) as id_produto 			
            , cast(specialofferid as int) as id_oferta_especial 			
            , cast(unitprice as numeric) as preco_unitario 			
            , cast(unitpricediscount as numeric) as preco_unitario_desconto 			
            , cast(rowguid as string) as rowguid   			
            , cast(modifieddate as string) as data_modificacao_pedidos_vendas_detalhes 
        from {{ source('adventureworks-378020', 'salesorderdetail') }}
    )

select * from source_pedidos_vendas_detalhes