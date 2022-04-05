with raw_reviews as (
    select
        listing_id,
        date as review_date,
        reviewer_name,
        comments as review_text,
        sentiment as review_sentiment
    from {{ source('airbnb', 'reviews') }}
)

select * from raw_reviews