with
    source_produtos_subcategorias as (
        select
            cast(productsubcategoryid as int) as id_subcategoria_produto 				
            , cast(productcategoryid as int) as id_categoria_produto				
            , cast(name as string) as nome_subcategoria_produto				
            , cast(rowguid as string) as rowguid   				
            , cast(modifieddate as string) as data_modificacao_produtos_subcategorias
        from {{ source('adventureworks-378020', 'productsubcategory') }}
    )

select * from source_produtos_subcategorias  