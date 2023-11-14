
{{
  config(
    materialized='view'
  )
}}

WITH src_orders AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'orders') }}
    ),

renamed_casted AS (
    SELECT
          order_id
        , tracking_id
        , user_id
        , shipping_service
        , status
        , order_total
        , order_cost
        , shipping_cost
        , created_at AS date_creation
        , estimated_delivery_at AS date_estimated_delivery
        , delivered_at AS date_delivered
        , _fivetran_synced AS date_load
    FROM src_orders
    )

SELECT * FROM renamed_casted
