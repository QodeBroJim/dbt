select
    listing_id,
    listing_name,
    room_type,
    minimum_nights,
    host_id,
    price,
    created_at,
    updated_at
from {{ ref('dim_listings_cleansed') }}
where
    minimum_nights < 1
limit 10