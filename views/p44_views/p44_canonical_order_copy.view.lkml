view: p44_canonical_order_copy {
  sql_table_name: `p44_dt_poc_prd_copy_us.p44_canonical_order_copy`
    ;;

  dimension_group: actual_utc {
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
    sql: ${TABLE}.actual_utc ;;
  }

  dimension: asset_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.asset_id ;;
  }

  dimension: carrier_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.carrier_id ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: destination_location_id {
    type: string
    sql: ${TABLE}.destination_location_id ;;
  }

  dimension: destination_stop_type {
    type: string
    sql: ${TABLE}.destination_stop_type ;;
  }

  dimension: estimated_updated_utc {
    type: string
    sql: ${TABLE}.estimated_updated_utc ;;
  }

  dimension: estimated_utc {
    type: string
    sql: ${TABLE}.estimated_utc ;;
  }

  dimension: from_stop_id {
    type: string
    sql: ${TABLE}.from_stop_id ;;
  }

  dimension: item_id {
    type: number
    sql: ${TABLE}.item_id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: order_uid {
    type: string
    sql: ${TABLE}.order_uid ;;
  }

  dimension: origin_location_id {
    type: string
    sql: ${TABLE}.origin_location_id ;;
  }

  dimension: origin_stop_type {
    type: string
    sql: ${TABLE}.origin_stop_type ;;
  }

  dimension: planned_updated_utc {
    type: string
    sql: ${TABLE}.planned_updated_utc ;;
  }

  dimension: planned_utc {
    type: string
    sql: ${TABLE}.planned_utc ;;
  }

  dimension: route_identifier_source {
    type: string
    sql: ${TABLE}.route_identifier_source ;;
  }

  dimension: route_identifier_type {
    type: string
    sql: ${TABLE}.route_identifier_type ;;
  }

  dimension: route_identifier_value {
    type: string
    sql: ${TABLE}.route_identifier_value ;;
  }

  dimension: route_segment_count {
    type: string
    sql: ${TABLE}.route_segment_count ;;
  }

  dimension: route_segment_event {
    type: string
    sql: ${TABLE}.route_segment_event ;;
  }

  dimension: route_segment_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.route_segment_id ;;
  }

  dimension: route_segment_state {
    type: string
    sql: ${TABLE}.route_segment_state ;;
  }

  dimension: shipment_event {
    type: string
    sql: ${TABLE}.shipment_event ;;
  }

  dimension: shipment_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.shipment_id ;;
  }

  dimension: shipment_identifier_source {
    type: string
    sql: ${TABLE}.shipment_identifier_source ;;
  }

  dimension: shipment_identifier_type {
    type: string
    sql: ${TABLE}.shipment_identifier_type ;;
  }

  dimension: shipment_identifier_value {
    type: number
    value_format_name: id
    sql: ${TABLE}.shipment_identifier_value ;;
  }

  dimension: shipment_state {
    type: string
    sql: ${TABLE}.shipment_state ;;
  }

  dimension: stop_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.stop_id ;;
  }

  dimension: tenant_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.tenant_id ;;
  }

  dimension: to_stop_id {
    type: string
    sql: ${TABLE}.to_stop_id ;;
  }

  dimension: tracking_connection_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.tracking_connection_id ;;
  }

  dimension: tracking_end_utc {
    type: string
    sql: ${TABLE}.tracking_end_utc ;;
  }

  dimension: tracking_start_utc {
    type: string
    sql: ${TABLE}.tracking_start_utc ;;
  }

  dimension: transportation_mode {
    type: string
    sql: ${TABLE}.transportation_mode ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      tenant.id,
      tenant.name,
      asset.id,
      asset.name,
      carrier.id,
      carrier.name,
      stop.id,
      route_segment.id,
      tracking_connection.id,
      tracking_connection.name,
      shipment.id
    ]
  }
}
