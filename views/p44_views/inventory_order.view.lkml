view: inventory_order {
  sql_table_name: `p44_dt_poc_prd_copy_us.inventory_order`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.ID ;;
  }

  dimension_group: created_utc {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.CREATED_UTC ;;
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

  dimension: shipment_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.SHIPMENT_ID ;;
  }

  dimension: status_code {
    type: string
    sql: ${TABLE}.STATUS_CODE ;;
  }

  dimension: tenant_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.TENANT_ID ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.TYPE ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      shipment.id,
      tenant.id,
      tenant.name,
      inventory_order_identifier.count,
      inventory_load_order.count,
      inventory_order_item.count
    ]
  }
}
