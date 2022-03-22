view: inventory_load_item {
  sql_table_name: `p44_dt_poc_prd_copy_us.inventory_load_item`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
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

  dimension: inventory_item_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.INVENTORY_ITEM_ID ;;
  }

  dimension: inventory_load_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.INVENTORY_LOAD_ID ;;
  }

  measure: count {
    type: count
    drill_fields: [id, inventory_item.id, inventory_load.id]
  }
}
