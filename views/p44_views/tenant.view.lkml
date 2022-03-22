view: tenant {
  sql_table_name: `p44_dt_poc_prd_copy_us.tenant`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: company_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.COMPANY_ID ;;
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

  dimension: is_demo {
    type: yesno
    sql: ${TABLE}.IS_DEMO ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.NAME ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      company.id,
      company.name,
      inventory_item.count,
      company.count,
      inventory_load.count,
      invitation.count,
      inventory_order.count,
      p44_canonical_order_copy.count,
      route_segment.count,
      p44_unified_shipment_tracking_updates_v3.count,
      shipment.count,
      shipment_attribute.count,
      stop.count,
      tenant_location.count
    ]
  }
}
