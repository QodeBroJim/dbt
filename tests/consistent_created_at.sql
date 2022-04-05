select
    l.listing_id,
    l.listing_name,
    l.room_type,
    l.minimum_nights,
    l.host_id,
    l.price,
    l.created_at,
    l.updated_at,
    r.listing_id,
    r.review_date,
    r.reviewer_name,
    r.review_text,
    r.review_sentiment
from {{ ref('fct_reviews') }} r
join {{ ref('dim_listings_cleansed') }} l
    using (listing_id)
where
    l.created_at >= r.review_date
