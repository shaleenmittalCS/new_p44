view: shipment {
  sql_table_name: `p44_dt_poc_prd_copy_us.shipment`
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
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.CREATED_UTC ;;
  }

  dimension_group: deleted_utc {
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
    sql: ${TABLE}.DELETED_UTC ;;
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

  dimension: route_segment_count {
    type: number
    sql: ${TABLE}.ROUTE_SEGMENT_COUNT ;;
  }

  dimension: shipment_event {
    type: string
    sql: ${TABLE}.SHIPMENT_EVENT ;;
  }

  dimension: shipment_state {
    type: string
    sql: ${TABLE}.SHIPMENT_STATE ;;
  }

  dimension: tenant_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.TENANT_ID ;;
  }

  dimension_group: tracking_end_utc {
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
    sql: ${TABLE}.TRACKING_END_UTC ;;
  }

  dimension_group: tracking_start_utc {
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
    sql: ${TABLE}.TRACKING_START_UTC ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      tenant.id,
      tenant.name,
      inventory_load.count,
      inventory_order.count,
      p44_canonical_order_copy.count,
      route_segment.count,
      shipment_attribute.count,
      shipment_identifier.count,
      shipment_event.count,
      stop.count
    ]
  }
}
