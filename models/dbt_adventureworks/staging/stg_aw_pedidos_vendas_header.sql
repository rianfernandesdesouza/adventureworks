with
    source_pedidos_vendas_header as (
        select
            cast(salesorderid as int) as id_pedidos_vendas				
            , cast(revisionnumber as int) as numero_revisao 				
            , cast(orderdate as string) as data_pedido 				
            , cast(duedate as string) as data_vencimento 				
            , cast(shipdate as string) as data_envio				
            , cast(status as int) as status_pedido  				
            , cast(onlineorderflag as int) as flag_pedido_online				
            , cast(purchaseordernumber as string) as numero_pedido_compra				
            , cast(accountnumber as string) as numero_conta				
            , cast(customerid as int) as id_cliente 				
            , cast(salespersonid as int) as id_pessoa_venda				
            , cast(territoryid	as int) as id_territorio  				
            , cast(billtoaddressid	as int) as id_conta_para_endereco 				
            , cast(shiptoaddressid	as int) as id_envio_para_endereco 				
            , cast(shipmethodid as int) as id_metodo_envio 				
            , cast(creditcardid as int) as id_cartao_credito				
            , cast(creditcardapprovalcode as string) as codigo_aprovacao_cartao_credito				
            , cast(currencyrateid as int) as id_taxa_cambio				
            , cast(subtotal as numeric) as subtotal   				
            , cast(taxamt as numeric) as valor_imposto 				
            , cast(freight as numeric) as frete 				
            , cast(totaldue as numeric) as total_devido 				
            , cast(comment as int) as comentario 				
            , cast(rowguid as string) as rowguid  				
            , cast(modifieddate as string) as data_modificacao_pedidos_vendas_header
        from {{ source('adventureworks-378020', 'salesorderheader') }}
    )

select * from source_pedidos_vendas_header