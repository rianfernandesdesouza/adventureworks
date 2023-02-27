with
    enderecos as (
        select *
        from {{ ref('stg_aw_enderecos') }}
    )

    , estados_provincias as (
        select *
        from {{ ref('stg_aw_estados_provincias') }}        
    )

    , pais_regiao as (
        select *
        from {{ ref('stg_aw_pais_regiao') }}        
    )

    , localizacoes as (
        select 
        enderecos.id_endereco
        , enderecos.linha_endereco_1
        , enderecos.linha_endereco_2
        , enderecos.cidade
        , enderecos.id_estado_provincia
        , enderecos.codigo_postal
        , enderecos.localizacao_espacial
        , estados_provincias.codigo_estado_provincia
        , estados_provincias.codigo_pais_regiao
        , estados_provincias.is_somente_estado_provincia_flag
        , estados_provincias.nome_estado_provincia
        , estados_provincias.id_territorio 
        , pais_regiao.nome_pais_regiao
        from enderecos
        left join estados_provincias on enderecos.id_estado_provincia = estados_provincias.id_estado_provincia
        left join pais_regiao on estados_provincias.codigo_pais_regiao = pais_regiao.codigo_pais_regiao
    )

    , transformacoes as (
        select 
        {{ dbt_utils.surrogate_key(['id_endereco']) }} as sk_localizacoes  
        ,*
        from localizacoes 
    )

select *
from transformacoes 