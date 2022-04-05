{{ config(materialized = 'table') }}

with mart_full_moon_reviews as (
    select
        r.listing_id,
        r.review_date,
        r.reviewer_name,
        r.review_text,
        r.review_sentiment,
        case
            when fm.full_moon_date is null then 'not full moon'
            else 'full moon'
        end as is_full_moon
    from {{ ref('fct_reviews') }} r
    left join {{ ref('seed_full_moon_dates') }} fm
        on (to_date(r.review_date) = dateadd(day, 1, fm.full_moon_date))
)

select * from mart_full_moon_reviews