{{
    config (
        materialized = 'incremental',
        on_schema_change = 'fail'
    )
}}

with fct_reviews as (
    select
        listing_id,
        review_date,
        reviewer_name,
        review_text,
        review_sentiment
    from {{ ref('src_reviews') }}
    where
        review_text is not null
        {% if is_incremental() %}
            and review_date > (select max(review_date) from {{ this }})
        {% endif %}
)

select * from fct_reviews

