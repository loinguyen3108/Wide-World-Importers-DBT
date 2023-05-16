with 

source as (

    select * from {{ source('sales', 'invoicelines') }}

),

transformed as (

    select
        
        invoicelineid as invoice_line_id,
        invoiceid as invoice_id,
        stockitemid as stock_item_id,
        packagetypeid as package_type_id,
        quantity,
        unitprice as unit_price,
        taxrate as tax_rate,
        taxamount as tax_amount,
        lineprofit as line_profit,
        extendedprice as extended_price

    from source

)

select * from transformed
  