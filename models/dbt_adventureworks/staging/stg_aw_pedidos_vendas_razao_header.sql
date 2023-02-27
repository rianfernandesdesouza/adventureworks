with
    source_pedidos_vendas_razao_header as (
        select
            cast(salesorderid as int) as id_pedidos_vendas 			
            , cast(salesreasonid as int) as id_razao_vendas			
            , cast(modifieddate as string) as data_modificacao_pedidos_vendas_razao_header
        from {{ source('adventureworks-378020', 'salesorderheadersalesreason') }}
    )

select * from source_pedidos_vendas_razao_header  