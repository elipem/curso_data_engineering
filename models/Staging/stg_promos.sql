
{{
  config(
    materialized='view'
  )
}}

WITH src_promos AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'promos') }}
    ),

renamed_casted AS (
    SELECT
        cast(
            {{dbt_utils.surrogate_key(['promo_id']) }} as varchar(50)
        ) as id_promo   
        , promo_id AS desc_promo
        , discount
        , status
        , _fivetran_synced AS date_load
    FROM src_promos
    )

 SELECT * FROM renamed_casted
 union all
 SELECT
        '999' as id_promo   
        , '' as desc_promo
        , 0 as discount
        , 'active' as status
        , sysdate() AS date_load
