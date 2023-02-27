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

    joined as (
        select *
        from vendas
        left join cambio on vendas.sk_cambio = cambio.sk_cambio 
        left join cartoes on vendas.sk_cartoes = cartoes.sk_cartoes        
        left join clientes on vendas.sk_clientes = clientes.sk_clientes   
        left join localizacoes on vendas.sk_localizacoes = localizacoes.sk_localizacoes   
        left join produtos on vendas.sk_produtos = produtos.sk_produtos   
        left join razao on vendas.sk_razao = razao.sk_razao    
    )