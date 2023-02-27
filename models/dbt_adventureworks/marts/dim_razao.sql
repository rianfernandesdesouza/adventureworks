with
    pedidos_vendas_razao_header as (
        select *
        from {{ ref('stg_aw_pedidos_vendas_razao_header') }}
    )

    , razao_vendas as (
        select *
        from {{ ref('stg_aw_razao_vendas') }}        
    )

    , razao as (
        select
        pedidos_vendas_razao_header.id_pedidos_vendas
        , pedidos_vendas_razao_header.id_razao_vendas
        , razao_vendas.id_razao_vendas
        , razao_vendas.nome_razao_vendas
        , razao_vendas.tipo_razao
        from pedidos_vendas_razao_header
        left join razao_vendas on pedidos_vendas_razao_header.id_razao_vendas = razao_vendas.id_razao_vendas
    )

    , transformacoes as (
        select 
        {{ dbt_utils.surrogate_key(['id_razao_vendas']) }} as sk_razao 
        ,*
        from razao   
    )

select *
from transformacoes   