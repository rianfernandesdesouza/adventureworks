with
    cambio as (
        select *
        from {{ ref('dim_cambio') }}
    )

    , cartoes as (
        select *
        from {{ ref('dim_cartoes') }}
    )

    , clientes as (
        select *
        from {{ ref('dim_clientes') }}
    )

    , localizacoes as (
        select *
        from {{ ref('dim_localizacoes') }}
    )

    , produtos as (
        select *
        from {{ ref('dim_produtos') }}
    )

    , razao as (
        select *
        from {{ ref('dim_razao') }}
    )

    , vendas as (
        select *
        from {{ ref('fct_vendas') }}
    )

    , joined as (
        select *
        from vendas
        left join cambio on vendas.fk_cambio = cambio.sk_cambio    
        left join cartoes on vendas.fk_cartoes = cartoes.sk_cartoes    
        left join clientes on vendas.fk_clientes = clientes.sk_clientes  
        left join localizacoes on vendas.fk_localizacoes = localizacoes.sk_localizacoes   
        left join produtos on vendas.fk_produtos = produtos.sk_produtos     
        left join razao on vendas.fk_razao = razao.sk_razao      
    )

select *
from joined