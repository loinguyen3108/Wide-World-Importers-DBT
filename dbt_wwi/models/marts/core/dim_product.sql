with 

stock_items as (

    select * from {{ ref('stg_warehouse__stock_items') }}

),

package_types as (

    select * from {{ ref('stg_warehouse__package_types') }}

),

colors as (

    select * from {{ ref('stg_warehouse__colors') }}

),

suppliers as (

    select * from {{ ref('stg_purchasing__suppliers') }}

),

final as (

    select

        si.stock_item_id as product_key,
        si.stock_item_name as product_name,
        sp.supplier_name,
        cl.color_name,
        pt.package_type_name,
        coalesce(si.brand, 'unknown') as brand,
        coalesce(si.size, 'unknown') as size,
        coalesce(si.barcode, 'unknown') as barcode,

        cast(si.tax_rate as float) as tax_rate,
        cast(si.unit_price as float) as unit_price,
        cast(si.recommended_retail_price as float) as recommended_retail_price,
        cast(si.typical_weight_per_unit as float) as typical_weight_per_unit,
        cast(si.quantity_per_outer as int) as quantity_per_outer,

        coalesce(custom_fields ->> 'CountryOfManufacture', 'unknown') as manufacturer,
        case
            when custom_fields ->> 'Tags' is not null
                then 
                    array_to_string(
                        string_to_array(substring(custom_fields ->> 'Tags', '"([^"]+)"'), ', '),
                        ','
                    )
        end as tags

    from stock_items as si
    join suppliers as sp using (supplier_id)
    join colors as cl using (color_id)
    join package_types as pt 
        on si.unit_package_id = pt.package_type_id

)

select * from final
