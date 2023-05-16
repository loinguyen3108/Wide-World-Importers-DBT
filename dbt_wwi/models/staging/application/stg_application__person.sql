with 

source as (

    select * from {{ source('application', 'people') }}

),

transformed as (

    select

        personid as person_id,
        fullname as full_name,
        preferredname as preferred_name,
        searchname as search_name,
        issystemuser as is_system_user,
        isemployee as is_employee,
        issalesperson as is_sales_person,
        phonenumber as phone_number,
        faxnumber as fax_number,
        emailaddress as email_address

    from source

)

select * from transformed
