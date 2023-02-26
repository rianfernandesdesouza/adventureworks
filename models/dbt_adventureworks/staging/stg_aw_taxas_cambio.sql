with
    source_taxas_cambio as (
        select
            cast(currencyrateid as int) as id_taxa_cambio 				
            , cast(currencyratedate as string) as data_taxa_cambio 				
            , cast(fromcurrencycode as string) as codigo_cambio_de 				
            , cast(tocurrencycode as string) as codigo_cambio_para 				
            , cast(averagerate as numeric) as taxa_media 				
            , cast(endofdayrate as numeric) as taxa_final_dia 				
            , cast(modifieddate	as string) as data_modificacao_taxas_cambio  
        from {{ source('adventureworks-378020', 'currencyrate') }}
    )

select * from source_taxas_cambio  