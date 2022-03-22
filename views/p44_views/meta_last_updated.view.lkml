view: meta_last_updated {
  sql_table_name: `p44_dt_poc_prd_copy_us.meta_last_updated`
    ;;

  dimension_group: dw_update_ended {
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
    sql: ${TABLE}.DW_UPDATE_ENDED ;;
  }

  dimension_group: dw_update_started {
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
    sql: ${TABLE}.DW_UPDATE_STARTED ;;
  }

  dimension: table_name {
    type: string
    sql: ${TABLE}.TABLE_NAME ;;
  }

  measure: count {
    type: count
    drill_fields: [table_name]
  }
}
