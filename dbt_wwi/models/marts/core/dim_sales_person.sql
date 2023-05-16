with 

persons as (

    select * from {{ ref('stg_application__person') }}
    where is_sales_person = true
),

final as (

    select

        cast(person_id as int) as sales_person_key,
        full_name,
        preferred_name,
        search_name,
        cast(is_system_user as boolean) as is_system_user,
        cast(is_employee as boolean) as is_employee,
        coalesce(phone_number, 'unknown') as phone_number,
        coalesce(fax_number, 'unknown') as fax_number,
        coalesce(email_address, 'unknown') as email_address
    
    from persons

)

select * from final
