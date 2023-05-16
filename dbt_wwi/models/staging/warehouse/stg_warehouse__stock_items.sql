with 

source as (

    select * from {{ source('warehouse', 'stockitems') }}

),

transformed as (

    select
        
        stockitemid as stock_item_id,
        supplierid as supplier_id,
        colorid as color_id,
        unitpackageid as unit_package_id,
        stockitemname as stock_item_name,
        brand,
        "Size" as size,
        barcode,
        taxrate as tax_rate,
        unitprice as unit_price,
        recommendedretailprice as recommended_retail_price,
        typicalweightperunit as typical_weight_per_unit,
        tags,
        quantityperouter as quantity_per_outer,
        cast(customfields as json) as custom_fields

    from source

)

select * from transformed
  