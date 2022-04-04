with raw_hosts as (
    select
        id host_id,
        name as host_name,
        is_superhost,
        created_at,
        updated_at
    from airbnb.raw.raw_hosts
)

select * from raw_hosts