{%- macro convert_date_id(column_name) -%}
    cast(
            cast(extract(year from {{ column_name }}) as text) || 
            cast(extract(month from {{ column_name }}) as text) || 
            cast(extract(day from {{ column_name }}) as text)
        as int)
{%- endmacro %}