with
    source_produtos as (
        select
            cast(productid as int) as id_produto				
            , cast(name as string) as nome_produto  				
            , cast(productnumber as string) as numero_produto  				
            , cast(makeflag as int) as makeflag  				
            , cast(finishedgoodsflag as int) as produtos_acabados  				
            , cast(color as string) as cor_produto  				
            , cast(safetystocklevel as int) as nivel_estoque_seguranca  				
            , cast(reorderpoint as int) as ponto_reabastecimento 				
            , cast(standardcost	as numeric) as custo_padrao  				
            , cast(listprice as numeric) as preco_lista  				
            , cast('size' as string) as tamanho_produto  				
            , cast(sizeunitmeasurecode as string) as codigo_mensuracao_tamanho_unitario				
            , cast(weightunitmeasurecode as string) as codigo_mensuracao_peso_unitario  				
            , cast(weight as numeric) as peso_produto				
            , cast(daystomanufacture as int) as dias_para_fabricar 				
            , cast(productline as string) as linha_produto 				
            , cast(class as string) as classe_produto			
            , cast(style as string) as estilo_produto  				
            , cast(productsubcategoryid	as int) as id_subcategoria_produto  				
            , cast(productmodelid as int) as id_modelo_produto  				
            , cast(sellstartdate as string) as data_inicio_vendas 				
            , cast(sellenddate as string) as data_final_vendas 				
            , cast(discontinueddate as int) as data_descontinuado 				
            , cast(rowguid as string) as rowguid   				
            , cast(modifieddate as string) as data_modificacao_produtos 
        from {{ source('adventureworks-378020', 'product') }}
    )

select * from source_produtos 