
{{
  config(
    materialized='view'
  )
}}

WITH src_addresses AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'addresses') }}
    ),

renamed_casted AS (
    SELECT
          address_id
        , country
        , state
        , zipcode
        , address
        , _fivetran_synced AS date_load
    FROM src_addresses
    )

SELECT * FROM renamed_casted
