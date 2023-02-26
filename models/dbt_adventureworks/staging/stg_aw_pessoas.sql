with
    source_pessoas as (
        select
            cast(businessentityid as int) as id_entidade_negocio 				
            , cast(persontype as string) as tipo_pessoa 				
            , cast(namestyle as int) as estilo_nome  				
            , cast(title as string) as titulo  				
            , cast(firstname as string) as primeiro_nome  				
            , cast(middlename as string) as nome_meio  				
            , cast(lastname as string) as ultimo_nome  				
            , cast(suffix as string) as sufixo  				
            , cast(emailpromotion as int) as promocao_email  				
            , cast(additionalcontactinfo as string) as info_contato_adicional 				
            , cast(demographics as string) as demografia  				
            , cast(rowguid as string) as rowguid   				
            , cast(modifieddate as string) as data_modificacao_pessoas  
        from {{ source('adventureworks-378020', 'person') }}
    )

select * from source_pessoas  