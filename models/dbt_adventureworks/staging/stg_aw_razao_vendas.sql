with
    source_razao_vendas as (
        select
            cast(salesreasonid as int) as id_razao_vendas  				
            , cast(name as string) as nome_razao_vendas   				
            , cast(reasontype as string) as tipo_razao   				
            , cast(modifieddate as string) as data_modificacao_razao_vendas  
        from {{ source('adventureworks-378020', 'salesreason') }}
    )

select * from source_razao_vendas 