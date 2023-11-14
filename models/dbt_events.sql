
{{
  config(
    materialized='view'
  )
}}

WITH src_events AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'events') }}
    ),

renamed_casted AS (
    SELECT
          event_id
        , event_type
        , session_id
        , page_url
        , product_id
        , order_id
        , created_at AS date_transaction
        , _fivetran_synced AS date_load
    FROM src_events
    )

SELECT * FROM renamed_casted

