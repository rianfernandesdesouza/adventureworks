with
    source_pedidos_vendas_razao_header as (
        select
            cast(salesorderid as int) id_pedidos_vendas 			
            , cast(salesreasonid as int) id_razao_vendas			
            , cast(modifieddate as string) data_modificacao_pedidos_vendas_razao_header
        from {{ source('adventureworks-378020', 'salesorderheadersalesreason') }}
    )

select * from source_pedidos_vendas_razao_header  