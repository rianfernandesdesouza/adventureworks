with
    moedas as (
        select *
        from {{ ref('stg_aw_moedas') }}
    )

    , taxas_cambio as (
        select *
        from {{ ref('stg_aw_taxas_cambio') }}
    )

    , join_de as (
        select
        id_taxa_cambio
        , taxas_cambio.data_taxa_cambio
        , taxas_cambio.codigo_cambio_para
        , taxas_cambio.taxa_media
        , taxas_cambio.taxa_final_dia
        , taxas_cambio.data_modificacao_taxas_cambio
        , moedas.nome_moeda as nome_moeda_de 
        from taxas_cambio
        left join moedas on taxas_cambio.codigo_cambio_de = moedas.codigo_cambio 
    )

    , join_para as (
        select
        id_taxa_cambio
        , join_de.data_taxa_cambio
        , join_de.taxa_media
        , join_de.taxa_final_dia
        , join_de.data_modificacao_taxas_cambio
        , moedas.nome_moeda as nome_moeda_para
        , join_de.nome_moeda_de 
        from join_de
        left join moedas on join_de.codigo_cambio_para = moedas.codigo_cambio 
    )

    , transformacoes as (
        select 
        {{ dbt_utils.surrogate_key(['id_taxa_cambio']) }} as sk_cambio 
        ,*
        from join_para
    )

select *
from transformacoes  