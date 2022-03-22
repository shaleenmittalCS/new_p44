view: p44_unified_shipment_tracking_updates_v3 {
  sql_table_name: `p44_dt_poc_prd_copy_us.p44_unified_shipment_tracking_updates_v3`
    ;;

  dimension: created_by_user_id {
    type: number
    sql: ${TABLE}.createdByUserId ;;
  }

  dimension: created_date_time {
    type: string
    sql: ${TABLE}.createdDateTime ;;
  }

  dimension: shipment_event_history__events {
    hidden: yes
    sql: ${TABLE}.shipmentEventHistory.events ;;
    group_label: "Shipment Event History"
    group_item_label: "Events"
  }

  dimension: shipment_event_history__shipment__attributes {
    hidden: yes
    sql: ${TABLE}.shipmentEventHistory.shipment.attributes ;;
    group_label: "Shipment Event History Shipment"
    group_item_label: "Attributes"
  }

  dimension: shipment_event_history__shipment__id {
    type: string
    sql: ${TABLE}.shipmentEventHistory.shipment.id ;;
    group_label: "Shipment Event History Shipment"
    group_item_label: "ID"
  }

  dimension: shipment_event_history__shipment__identifiers {
    hidden: yes
    sql: ${TABLE}.shipmentEventHistory.shipment.identifiers ;;
    group_label: "Shipment Event History Shipment"
    group_item_label: "Identifiers"
  }

  dimension: shipment_event_history__shipment__parent_shipment_id {
    type: string
    sql: ${TABLE}.shipmentEventHistory.shipment.parentShipmentId ;;
    group_label: "Shipment Event History Shipment"
    group_item_label: "Parent Shipment ID"
  }

  dimension: shipment_event_history__shipment__route_info__route_segments {
    hidden: yes
    sql: ${TABLE}.shipmentEventHistory.shipment.routeInfo.routeSegments ;;
    group_label: "Shipment Event History Shipment Route Info"
    group_item_label: "Route Segments"
  }

  dimension: shipment_event_history__shipment__route_info__stops {
    hidden: yes
    sql: ${TABLE}.shipmentEventHistory.shipment.routeInfo.stops ;;
    group_label: "Shipment Event History Shipment Route Info"
    group_item_label: "Stops"
  }

  dimension: shipment_event_history__shipment__sub_shipments {
    hidden: yes
    sql: ${TABLE}.shipmentEventHistory.shipment.subShipments ;;
    group_label: "Shipment Event History Shipment"
    group_item_label: "Sub Shipments"
  }

  dimension: shipment_event_history__states {
    hidden: yes
    sql: ${TABLE}.shipmentEventHistory.states ;;
    group_label: "Shipment Event History"
    group_item_label: "States"
  }

  dimension: tenant_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.tenantId ;;
  }

  measure: count {
    type: count
    drill_fields: [tenant.id, tenant.name]
  }
}

view: p44_unified_shipment_tracking_updates_v3__shipment_event_history__events {
  dimension: date_time {
    type: string
    sql: ${TABLE}.dateTime ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: estimate_date_time {
    type: string
    sql: ${TABLE}.estimateDateTime ;;
  }

  dimension: estimate_last_calculated_date_time {
    type: string
    sql: ${TABLE}.estimateLastCalculatedDateTime ;;
  }

  dimension: planned_date_time {
    type: string
    sql: ${TABLE}.plannedDateTime ;;
  }

  dimension: received_date_time {
    type: string
    sql: ${TABLE}.receivedDateTime ;;
  }

  dimension: route_segment_id {
    type: string
    sql: ${TABLE}.routeSegmentId ;;
  }

  dimension: stop_id {
    type: string
    sql: ${TABLE}.stopId ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }
}

view: p44_unified_shipment_tracking_updates_v3__shipment_event_history__states {
  dimension: end_date_time {
    type: string
    sql: ${TABLE}.endDateTime ;;
  }

  dimension: route_segment_id {
    type: string
    sql: ${TABLE}.routeSegmentId ;;
  }

  dimension: start_date_time {
    type: string
    sql: ${TABLE}.startDateTime ;;
  }

  dimension: stop_id {
    type: string
    sql: ${TABLE}.stopId ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }
}

view: p44_unified_shipment_tracking_updates_v3__shipment_event_history__shipment__sub_shipments {
  dimension: p44_unified_shipment_tracking_updates_v3__shipment_event_history__shipment__sub_shipments {
    type: string
    sql: p44_unified_shipment_tracking_updates_v3__shipment_event_history__shipment__sub_shipments ;;
  }
}

view: p44_unified_shipment_tracking_updates_v3__shipment_event_history__shipment__attributes {
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }

  dimension: values {
    hidden: yes
    sql: ${TABLE}.values ;;
  }
}

view: p44_unified_shipment_tracking_updates_v3__shipment_event_history__shipment__identifiers {
  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

view: p44_unified_shipment_tracking_updates_v3__shipment_event_history__shipment__attributes__values {
  dimension: p44_unified_shipment_tracking_updates_v3__shipment_event_history__shipment__attributes__values {
    type: string
    sql: p44_unified_shipment_tracking_updates_v3__shipment_event_history__shipment__attributes__values ;;
  }
}

view: p44_unified_shipment_tracking_updates_v3__shipment_event_history__shipment__route_info__stops {
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: location__address__address_lines {
    hidden: yes
    sql: ${TABLE}.location.address.addressLines ;;
    group_label: "Location Address"
    group_item_label: "Address Lines"
  }

  dimension: location__address__city {
    type: string
    sql: ${TABLE}.location.address.city ;;
    group_label: "Location Address"
    group_item_label: "City"
  }

  dimension: location__address__country {
    type: string
    sql: ${TABLE}.location.address.country ;;
    group_label: "Location Address"
    group_item_label: "Country"
  }

  dimension: location__address__postal_code {
    type: string
    sql: ${TABLE}.location.address.postalCode ;;
    group_label: "Location Address"
    group_item_label: "Postal Code"
  }

  dimension: location__address__state {
    type: string
    sql: ${TABLE}.location.address.state ;;
    group_label: "Location Address"
    group_item_label: "State"
  }

  dimension: location__coordinates__latitude {
    type: number
    sql: ${TABLE}.location.coordinates.latitude ;;
    group_label: "Location Coordinates"
    group_item_label: "Latitude"
  }

  dimension: location__coordinates__longitude {
    type: number
    sql: ${TABLE}.location.coordinates.longitude ;;
    group_label: "Location Coordinates"
    group_item_label: "Longitude"
  }

  dimension: location__id {
    type: string
    sql: ${TABLE}.location.id ;;
    group_label: "Location"
    group_item_label: "ID"
  }

  dimension: location__identifiers {
    hidden: yes
    sql: ${TABLE}.location.identifiers ;;
    group_label: "Location"
    group_item_label: "Identifiers"
  }

  dimension: location__name {
    type: string
    sql: ${TABLE}.location.name ;;
    group_label: "Location"
    group_item_label: "Name"
  }

  dimension: location__time_zone {
    type: string
    sql: ${TABLE}.location.timeZone ;;
    group_label: "Location"
    group_item_label: "Time Zone"
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }
}

view: p44_unified_shipment_tracking_updates_v3__shipment_event_history__shipment__route_info__route_segments {
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: from_stop_id {
    type: string
    sql: ${TABLE}.fromStopId ;;
  }

  dimension: identifiers {
    hidden: yes
    sql: ${TABLE}.identifiers ;;
  }

  dimension: to_stop_id {
    type: string
    sql: ${TABLE}.toStopId ;;
  }

  dimension: transportation_mode {
    type: string
    sql: ${TABLE}.transportationMode ;;
  }
}

view: p44_unified_shipment_tracking_updates_v3__shipment_event_history__shipment__route_info__route_segments__identifiers {
  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

view: p44_unified_shipment_tracking_updates_v3__shipment_event_history__shipment__route_info__stops__location__identifiers {
  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

view: p44_unified_shipment_tracking_updates_v3__shipment_event_history__shipment__route_info__stops__location__address__address_lines {
  dimension: p44_unified_shipment_tracking_updates_v3__shipment_event_history__shipment__route_info__stops__location__address__address_lines {
    type: string
    sql: p44_unified_shipment_tracking_updates_v3__shipment_event_history__shipment__route_info__stops__location__address__address_lines ;;
  }
}
