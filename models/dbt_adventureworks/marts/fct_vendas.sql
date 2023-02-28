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
        from {{ ref('int_vendas') }}
    )

    , joined as (
        select 				
            numero_revisao 				
            , data_pedido 				
            , data_vencimento 				
            , data_envio				
            , status_pedido  				
            , flag_pedido_online				
            , numero_pedido_compra				
            , numero_conta				 				
            , id_pessoa_venda								
            , id_conta_para_endereco 				
            , id_envio_para_endereco 				
            , id_metodo_envio 							
            , codigo_aprovacao_cartao_credito								
            , subtotal   				
            , valor_imposto 				
            , frete 				
            , total_devido 				
            , comentario 				  				
            , data_modificacao_pedidos_vendas_header  			
            , id_pedidos_vendas_detalhes  			
            , numero_rastreamento_operadora  			
            , quantidade_pedido 						
            , id_oferta_especial 			
            , preco_unitario 			
            , preco_unitario_desconto 			  			
            , data_modificacao_pedidos_vendas_detalhes       
            , cambio.sk_cambio as fk_cambio
            , cartoes.sk_cartoes as fk_cartoes
            , clientes.sk_clientes as fk_clientes
            , localizacoes.sk_localizacoes as fk_localizacoes
            , produtos.sk_produtos as fk_produtos
            , razao.sk_razao as fk_razao
        
        from vendas
        left join cambio on vendas.id_taxa_cambio = cambio.id_taxa_cambio    
        left join cartoes on vendas.id_cartao_credito = cartoes.id_cartao_credito    
        left join clientes on vendas.id_pedidos_vendas = clientes.id_entidade_negocio  
        left join localizacoes on vendas.id_conta_para_endereco = localizacoes.id_endereco    
        left join produtos on vendas.id_produto = produtos.id_produto     
        left join razao on vendas.id_pedidos_vendas = razao.id_razao_vendas    
    )

select *
from joined 
