{{
    config(
        materialized = 'view'
    )
}}

with dim_hosts as (
    select
        host_id,
        nvl(host_name, 'Anonymous') as host_name,
        is_superhost,
        created_at,
        updated_at
    from {{ ref('src_hosts') }}
)

select * from dim_hosts