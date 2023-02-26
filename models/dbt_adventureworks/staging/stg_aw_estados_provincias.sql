with
    source_estados_provincias as (
        select
            cast(stateprovinceid as int) as id_estado_provincia				
            , cast(stateprovincecode as string) as	codigo_estado_privincia			
            , cast(countryregioncode as string) as codigo_pais_regiao				
            , cast(isonlystateprovinceflag as int) as is_somente_estado_provincia_flag 				
            , cast(name	as string) as nome_estado_provincia  				
            , cast(territoryid as int) as id_territorio  				
            , cast(rowguid as string) as rowguid   				
            , cast(modifieddate	as string) as data_modificacao_estados_provincias
        from {{ source('adventureworks-378020', 'stateprovince') }}
    )

select * from source_estados_provincias 