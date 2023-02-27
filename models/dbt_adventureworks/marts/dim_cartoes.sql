with
    cartoes as (
        select
            id_cartao_credito 					
            , tipo_cartao				
            , numero_cartao					
            , mes_expedicao				
            , ano_expedicao 					
            , data_modificacao_cartao
        from {{ ref('stg_aw_cartoes_credito') }}
    )

    , transformacoes as (
        select 
        {{ dbt_utils.surrogate_key(['id_cartao_credito']) }} as sk_cartoes
        ,*
        from cartoes
    )

select *
from transformacoes