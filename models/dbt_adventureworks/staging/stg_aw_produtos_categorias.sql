with
    source_produtos_categorias as (
        select
            cast(productcategoryid as int) as id_categoria_produto				
            , cast(name as string) as nome_categoria_produto  				
            , cast(rowguid	as string) as rowguid    				
            , cast(modifieddate as string) as data_modificacao_produtos_categorias  
        from {{ source('adventureworks-378020', 'productcategory') }}
    )

select * from source_produtos_categorias   