
{{
  config(
    materialized='view'
  )
}}

WITH src_users AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'users') }}
    ),

renamed_casted AS (
    SELECT
          user_id
        , first_name
        , last_name
        , email
        , phone_number
        , address_id
        , total_orders
        , created_at as date_created
        , updated_at as date_updated
        , _fivetran_synced AS date_load
    FROM src_users
    )

 SELECT * FROM renamed_casted
