connection: "scl_twin_private"

# include all the views
include: "/views/**/*.view"

datagroup: new_p44_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: new_p44_default_datagroup

explore: shipment_identifier {
  label: "(1) Shipment"
  join: shipment {
    type: inner
    sql_on: ${shipment.id} = ${shipment_identifier.shipment_id} ;;
    relationship: many_to_one
  }

  join: shipment_event {
    type: left_outer
    sql_on: ${shipment_event.shipment_id} = ${shipment_identifier.shipment_id} ;;
    relationship: many_to_one

  }

  join: route_segment {
    type: left_outer
    sql_on: ${route_segment.shipment_id} = ${shipment_identifier.shipment_id} ;;
    relationship: many_to_one
  }

  join: route_segment_identifier {
    type: left_outer
    sql_on: ${route_segment_identifier.route_segment_id} = ${route_segment.id} ;;
    relationship: many_to_one
  }

  join: route_segment_tracking_kpi {
    type: left_outer
    sql_on: ${route_segment_tracking_kpi.route_segment_id} = ${route_segment_identifier.route_segment_id} ;;
    relationship: many_to_one
  }

  join: stop {
    type: left_outer
    sql_on: ${stop.shipment_id} = ${route_segment.shipment_id} ;;
    relationship: many_to_one

  }

  join: location_identifier {
    type: left_outer
    sql_on: ${location_identifier.location_id} = ${stop.location_id} ;;
    relationship: many_to_one

  }

  join: location {
    type: left_outer
    sql_on: ${location.id} = ${location_identifier.location_id} ;;
    relationship: many_to_one
  }

  join: company_identifier {
    type: left_outer
    sql_on: ${company_identifier.id} = ${route_segment_identifier.id} ;;
    relationship: many_to_one
  }

  join: company {
    type: left_outer
    sql_on: ${company.id} = ${company_identifier.company_id} ;;
    relationship: many_to_one
  }

  join: tracking_connection {
    type: left_outer
    sql_on: ${tracking_connection.company_id} = ${company_identifier.company_id} ;;
    relationship: many_to_one
  }

  join: tracking_provider {
    type: left_outer
    sql_on: ${tracking_provider.id} = ${tracking_connection.tracking_provider_id} ;;
    relationship: many_to_one
  }

  join: carrier_identifier {
    type: left_outer
    sql_on: ${carrier_identifier.company_id} = ${company_identifier.company_id} ;;
    relationship: many_to_one
  }

  join: carrier {
    type: left_outer
    sql_on: ${carrier.id} = ${carrier_identifier.carrier_id} ;;
    relationship: many_to_one
  }

}


explore: inventory_order {
  label: "(2) Inventory"
  join: inventory_order_identifier {
    type: left_outer
    sql_on: ${inventory_order.id} = ${inventory_order_identifier.inventory_order_id} ;;
    relationship: many_to_one
  }

  join: inventory_order_item {
    type: left_outer
    sql_on: ${inventory_order_item.inventory_order_id} = ${inventory_order_identifier.inventory_order_id} ;;
    relationship: many_to_one
  }

  join: inventory_item {
    type: left_outer
    sql_on: ${inventory_item.id} = ${inventory_order_item.inventory_item_id} ;;
    relationship: many_to_one
  }

  join: inventory_item_identifier {
    type: left_outer
    sql_on: ${inventory_item_identifier.inventory_item_id} = ${inventory_item.id} ;;
    relationship: many_to_one
  }

}
