view: inventory_item_identifier {
  sql_table_name: `p44_dt_poc_prd_copy_us.inventory_item_identifier`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
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
    sql: ${TABLE}.DW_UPDATED_DATETIME ;;
  }

  dimension: identifier_description {
    type: string
    sql: ${TABLE}.IDENTIFIER_DESCRIPTION ;;
  }

  dimension: identifier_type {
    type: string
    sql: ${TABLE}.IDENTIFIER_TYPE ;;
  }

  dimension: identifier_value {
    type: string
    sql: ${TABLE}.IDENTIFIER_VALUE ;;
  }

  dimension: inventory_item_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.INVENTORY_ITEM_ID ;;
  }

  measure: count {
    type: count
    drill_fields: [id, inventory_item.id]
  }
}
