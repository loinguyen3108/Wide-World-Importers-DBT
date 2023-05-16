with 

source as (

    select * from {{ source('sales', 'invoices') }}

),

transformed as (

    select
        
        invoiceid as invoice_id,
        customerid as customer_id,
        deliverymethodid as delivery_method_id,
        salespersonpersonid as sales_person_id,
        cast(invoicedate as timestamp) as invoice_date

    from source

)

select * from transformed
  