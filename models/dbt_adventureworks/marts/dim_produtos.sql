with
    produtos as (
        select *
        from {{ ref('stg_aw_produtos') }}
    )

    , produtos_categorias as (
        select *
        from {{ ref('stg_aw_produtos_categorias') }}        
    )

    , produtos_subcategorias as (
        select *
        from {{ ref('stg_aw_produtos_subcategorias') }}        
    )

    , produtos_total as (
        select 
        produtos.id_produto				
        ,  produtos.nome_produto  				
        ,  produtos.numero_produto  				
        ,  produtos.makeflag  				
        ,  produtos.produtos_acabados  				
        ,  produtos.cor_produto  				
        ,  produtos.nivel_estoque_seguranca  				
        ,  produtos.ponto_reabastecimento 				
        ,  produtos.custo_padrao  				
        ,  produtos.preco_lista  				
        ,  produtos.tamanho_produto  				
        ,  produtos.codigo_mensuracao_tamanho_unitario				
        ,  produtos.codigo_mensuracao_peso_unitario  				
        ,  produtos.peso_produto				
        ,  produtos.dias_para_fabricar 				
        ,  produtos.linha_produto 				
        ,  produtos.classe_produto			
        ,  produtos.estilo_produto  				
        ,  produtos.id_subcategoria_produto  				
        ,  produtos.id_modelo_produto  				
        ,  produtos.data_inicio_vendas 				
        ,  produtos.data_final_vendas 				
        ,  produtos.data_descontinuado 		
        ,  produtos_categorias.id_categoria_produto				       
        ,  produtos_categorias.nome_categoria_produto 
        ,  produtos_subcategorias.id_subcategoria_produto 				
        ,  produtos_subcategorias.id_categoria_produto				
        ,  produtos_subcategorias.nome_subcategoria_produto				
        ,  produtos_subcategorias.rowguid   				
        ,  produtos_subcategorias.data_modificacao_produtos_subcategorias		      
        from produtos
        left join produtos_subcategorias on produtos.id_subcategoria_produto = produtos_subcategorias.id_subcategoria_produto
        left join produtos_categorias on produtos_subcategorias.id_categoria_produto = produtos_subcategorias.id_categoria_produto
    )

    , transformacoes as (
        select 
        {{ dbt_utils.surrogate_key(['id_produto']) }} as sk_produtos 
        ,*
        from produtos  
    )   

select *
from transformacoes      