with
    source_enderecos as (
        select
            cast(addressid as int) as id_endereco			
            , cast(addressline1	as string) as linha_endereco_1 				
            , cast(addressline2	as string) as linha_endereco_2 				
            , cast(city	as string) as cidade 				
            , cast(stateprovinceid as int) as id_estado_provincia  				
            , cast(postalcode as string) as codigo_postal 				
            , cast(spatiallocation as string) as localizacao_espacial  				
            , cast(rowguid as string) as rowguid  				
            , cast(modifieddate	as string) as data_modificacao_enderecos 
        from {{ source('adventureworks-378020', 'address') }}
    )

select * from source_enderecos   