with listings_with_hosts as (
    select
        l.listing_id,
        l.listing_name,
        l.room_type,
        l.minimum_nights,
        l.price,
        l.host_id,
        h.host_name,
        h.is_superhost as host_is_superhost,
        l.created_at,
        greatest(l.updated_at, h.updated_at) as updated_at
    from {{ ref('dim_listings_cleansed') }} as l
    left join {{ ref('dim_hosts_cleansed') }} as h
        on l.host_id = h.host_id
)

select * from listings_with_hosts


