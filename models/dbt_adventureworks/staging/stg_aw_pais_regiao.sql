with
    source_pais_regiao as (
        select
            cast(countryregioncode as string) as codigo_pais_regiao 			
            , cast(name as string) as nome_pais_regiao 			
            , cast(modifieddate as string) as data_modificacao_pais_regiao 
        from {{ source('adventureworks-378020', 'countryregion') }}
    )

select * from source_pais_regiao  