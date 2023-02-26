with
    source_moedas as (
        select
            cast(currencycode as string) as codigo_cambio   			
            , cast(name as string) as nome_moeda   			
            , cast(modifieddate	as string) as data_modificacao_moedas 
        from {{ source('adventureworks-378020', 'currency') }}
    )

select * from source_moedas  