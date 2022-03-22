view: asset_identifier {
  sql_table_name: `p44_dt_poc_prd_copy_us.asset_identifier`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: asset_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.ASSET_ID ;;
  }

  dimension_group: dw_inserted_datetime {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    datatype: datetime
    sql: ${TABLE}.DW_INSERTED_DATETIME ;;
  }

  dimension_group: dw_updated_datetime {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    datatype: datetime
    sql: ${TABLE}.DW_UPDATED_DATETIME ;;
  }

  dimension: identifier_source {
    type: string
    sql: ${TABLE}.IDENTIFIER_SOURCE ;;
  }

  dimension: identifier_type {
    type: string
    sql: ${TABLE}.IDENTIFIER_TYPE ;;
  }

  dimension: identifier_value {
    type: string
    sql: ${TABLE}.IDENTIFIER_VALUE ;;
  }

  measure: count {
    type: count
    drill_fields: [id, asset.id, asset.name]
  }
}
