with
    source_cartoes_credito as (
        select
            cast(creditcardid as int) as id_cartao_credito 					
            , cast(cardtype as string) as tipo_cartao				
            , cast(cardnumber as int) as numero_cartao					
            , cast(expmonth as int)	as mes_expedicao				
            , cast(expyear as int) as ano_expedicao 					
            , cast(modifieddate as string) as data_modificacao_cartao
        from {{ source('adventureworks-378020', 'creditcard') }}
    )

select * from source_cartoes_credito 