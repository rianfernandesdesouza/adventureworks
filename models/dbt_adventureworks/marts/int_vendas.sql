with
    pedidos_vendas_header as (
        select
            id_pedidos_vendas				
            , numero_revisao 				
            , data_pedido 				
            , data_vencimento 				
            , data_envio				
            , status_pedido  				
            , flag_pedido_online				
            , numero_pedido_compra				
            , numero_conta				
            , id_cliente 				
            , id_pessoa_venda				
            , id_territorio  				
            , id_conta_para_endereco 				
            , id_envio_para_endereco 				
            , id_metodo_envio 				
            , id_cartao_credito				
            , codigo_aprovacao_cartao_credito				
            , id_taxa_cambio				
            , subtotal   				
            , valor_imposto 				
            , frete 				
            , total_devido 				
            , comentario 				
            , rowguid  				
            , data_modificacao_pedidos_vendas_header
        from {{ ref('stg_aw_pedidos_vendas_header') }}
    )

    , pedidos_vendas_detalhes as (
        select  			
            id_pedidos_vendas_detalhes  			
            , numero_rastreamento_operadora  			
            , quantidade_pedido 			
            , id_produto 			
            , id_oferta_especial 			
            , preco_unitario 			
            , preco_unitario_desconto 			  			
            , data_modificacao_pedidos_vendas_detalhes 
        from {{ ref('stg_aw_pedidos_vendas_detalhes') }}
    )

    , joined as (
        select *
        from pedidos_vendas_header
        left join pedidos_vendas_detalhes on pedidos_vendas_header.id_pedidos_vendas = pedidos_vendas_detalhes.id_pedidos_vendas_detalhes 
    )

    , transformacoes as (
        select 
        {{ dbt_utils.surrogate_key(['id_pedidos_vendas','id_pedidos_vendas_detalhes']) }} as sk_vendas 
        ,*
        from joined 
    )
    
select *
from transformacoes 
