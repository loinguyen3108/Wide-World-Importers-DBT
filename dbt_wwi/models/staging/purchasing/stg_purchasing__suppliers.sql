with

source as (

    select * from {{ source('purchasing', 'suppliers') }}

),

transformed as (

    select

        supplierid as supplier_id,
        suppliername as supplier_name

    from source

)

select * from transformed
