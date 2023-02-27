with
    clientes as (
        select *
        from {{ ref('stg_aw_clientes') }}
    )

    , pessoas as (
        select *
        from {{ ref('stg_aw_pessoas') }}
    )

    , individuos as (
        select
        clientes.id_cliente
        clientes.id_pessoa 
        clientes.id_loja
        clientes.id_territorio
        pessoas.id_entidade_negocio
        pessoas.tipo_pessoa
        pessoas.estilo_nome
        pessoas.titulo 
        pessoas.primeiro_nome 
        pessoas.nome_meio
        pessoas.ultimo_nome
        pessoas.sufixo
        pessoas.promocao_email
        pessoas.info_contato_adicional
        pessoas.demografia
        from clientes 
        left join pessoas on clientes.id_cliente = pessoas.id_entidade_negocio
    )

    , transformacoes as (
        select 
        {{ dbt_utils.surrogate_key(['id_cliente','id_entidade_negocio']) }} as sk_clientes 
        ,*
        from clientes 
    )

select *
from transformacoes 