with 

customers as (

    select * from {{ ref('stg_sales__customers') }}

),

delivery_methods as (

    select * from {{ ref('stg_application__delivery_methods') }}

),

invoices as (

    select * from {{ ref('stg_sales__invoices') }}

),

invoice_lines as (

    select * from {{ ref('stg_sales__invoice_lines') }}

),

person as (

    select * from {{ ref('stg_application__person') }}

),

stock_items as (

    select * from {{ ref('stg_warehouse__stock_items') }}

),

promotion as (

    select * from {{ ref('stg_sales__promotion') }}

),

transform_base as (

    select

        -- Key
        iv.invoice_id as invoice_key,
        ctm.customer_id as customer_key,
        si.stock_item_id as product_key,
        dm.delivery_method_id as delivery_method_key,
        iv.sales_person_id as sales_person_key,
        pmt.special_deal_id as promotion_key,
        {{ convert_date_id('iv.invoice_date') }} as date_key,
        
        -- cast type
        cast(ivl.extended_price as float) as gross_revenue,
        cast(ivl.unit_price as float) as net_unit_price,
        cast(si.unit_price as float) as regular_unit_price,
        cast(ivl.line_profit as float) as line_profit,
        cast(ivl.quantity as int) as quantity        

    from invoice_lines as ivl
    left join invoices as iv using (invoice_id)
    left join customers as ctm using (customer_id)
    left join delivery_methods as dm using (delivery_method_id)
    left join person as ps on iv.sales_person_id = ps.person_id
    left join stock_items as si using (stock_item_id)
    left join promotion as pmt using (buying_group_id)

),

transform_unit as (

    select

        *,
        regular_unit_price - net_unit_price as discount_unit_price,
        line_profit / quantity as unit_profit,
        net_unit_price - (line_profit / quantity) as unit_cost
    
    from transform_base

),

final as (

    select

        *,
        net_unit_price * quantity as net_revenue,
        unit_cost * quantity as cost_amount,
        gross_revenue - (unit_cost * quantity) as gross_profit,
        (net_unit_price * quantity) - (unit_cost * quantity) as net_profit

    from transform_unit

)

select * from final
