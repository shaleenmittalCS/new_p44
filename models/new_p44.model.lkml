connection: "scl_twin_private"

# include all the views
include: "/views/**/*.view"

datagroup: new_p44_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: new_p44_default_datagroup

explore: asset {
  join: company {
    type: left_outer
    sql_on: ${asset.company_id} = ${company.id} ;;
    relationship: many_to_one
  }

  join: carrier {
    type: left_outer
    sql_on: ${asset.carrier_id} = ${carrier.id} ;;
    relationship: many_to_one
  }

  join: tenant {
    type: left_outer
    sql_on: ${company.tenant_id} = ${tenant.id} ;;
    relationship: many_to_one
  }
}

explore: inventory_item {
  join: tenant {
    type: left_outer
    sql_on: ${inventory_item.tenant_id} = ${tenant.id} ;;
    relationship: many_to_one
  }

  join: company {
    type: left_outer
    sql_on: ${tenant.company_id} = ${company.id} ;;
    relationship: many_to_one
  }
}

explore: company_identifier {
  join: company {
    type: left_outer
    sql_on: ${company_identifier.company_id} = ${company.id} ;;
    relationship: many_to_one
  }

  join: tenant {
    type: left_outer
    sql_on: ${company.tenant_id} = ${tenant.id} ;;
    relationship: many_to_one
  }
}

explore: company {
  join: tenant {
    type: left_outer
    sql_on: ${company.tenant_id} = ${tenant.id} ;;
    relationship: many_to_one
  }
}

explore: inventory_item_identifier {
  join: inventory_item {
    type: left_outer
    sql_on: ${inventory_item_identifier.inventory_item_id} = ${inventory_item.id} ;;
    relationship: many_to_one
  }

  join: tenant {
    type: left_outer
    sql_on: ${inventory_item.tenant_id} = ${tenant.id} ;;
    relationship: many_to_one
  }

  join: company {
    type: left_outer
    sql_on: ${tenant.company_id} = ${company.id} ;;
    relationship: many_to_one
  }
}

explore: carrier_identifier {
  join: carrier {
    type: left_outer
    sql_on: ${carrier_identifier.carrier_id} = ${carrier.id} ;;
    relationship: many_to_one
  }

  join: company {
    type: left_outer
    sql_on: ${carrier_identifier.company_id} = ${company.id} ;;
    relationship: many_to_one
  }

  join: tenant {
    type: left_outer
    sql_on: ${company.tenant_id} = ${tenant.id} ;;
    relationship: many_to_one
  }
}

explore: carrier {
  join: company {
    type: left_outer
    sql_on: ${carrier.company_id} = ${company.id} ;;
    relationship: many_to_one
  }

  join: tenant {
    type: left_outer
    sql_on: ${company.tenant_id} = ${tenant.id} ;;
    relationship: many_to_one
  }
}


explore: invitation {
  join: tenant {
    type: left_outer
    sql_on: ${invitation.tenant_id} = ${tenant.id} ;;
    relationship: many_to_one
  }

  join: carrier {
    type: left_outer
    sql_on: ${invitation.carrier_id} = ${carrier.id} ;;
    relationship: many_to_one
  }

  join: company {
    type: left_outer
    sql_on: ${tenant.company_id} = ${company.id} ;;
    relationship: many_to_one
  }
}

explore: inventory_order_identifier {
  join: inventory_order {
    type: left_outer
    sql_on: ${inventory_order_identifier.inventory_order_id} = ${inventory_order.id} ;;
    relationship: many_to_one
  }

  join: shipment {
    type: left_outer
    sql_on: ${inventory_order.shipment_id} = ${shipment.id} ;;
    relationship: many_to_one
  }

  join: tenant {
    type: left_outer
    sql_on: ${inventory_order.tenant_id} = ${tenant.id} ;;
    relationship: many_to_one
  }

  join: company {
    type: left_outer
    sql_on: ${tenant.company_id} = ${company.id} ;;
    relationship: many_to_one
  }
}

explore: inventory_order {
  join: shipment {
    type: left_outer
    sql_on: ${inventory_order.shipment_id} = ${shipment.id} ;;
    relationship: many_to_one
  }

  join: tenant {
    type: left_outer
    sql_on: ${inventory_order.tenant_id} = ${tenant.id} ;;
    relationship: many_to_one
  }

  join: company {
    type: left_outer
    sql_on: ${tenant.company_id} = ${company.id} ;;
    relationship: many_to_one
  }
}


explore: location {}

explore: inventory_order_item {
  join: inventory_item {
    type: left_outer
    sql_on: ${inventory_order_item.inventory_item_id} = ${inventory_item.id} ;;
    relationship: many_to_one
  }

  join: inventory_order {
    type: left_outer
    sql_on: ${inventory_order_item.inventory_order_id} = ${inventory_order.id} ;;
    relationship: many_to_one
  }

  join: tenant {
    type: left_outer
    sql_on: ${inventory_item.tenant_id} = ${tenant.id} ;;
    relationship: many_to_one
  }

  join: company {
    type: left_outer
    sql_on: ${tenant.company_id} = ${company.id} ;;
    relationship: many_to_one
  }

  join: shipment {
    type: left_outer
    sql_on: ${inventory_order.shipment_id} = ${shipment.id} ;;
    relationship: many_to_one
  }
}

explore: location_identifier {
  join: location {
    type: left_outer
    sql_on: ${location_identifier.location_id} = ${location.id} ;;
    relationship: many_to_one
  }
}


explore: route_segment {
  join: shipment {
    type: left_outer
    sql_on: ${route_segment.shipment_id} = ${shipment.id} ;;
    relationship: many_to_one
  }

  join: tracking_connection {
    type: left_outer
    sql_on: ${route_segment.tracking_connection_id} = ${tracking_connection.id} ;;
    relationship: many_to_one
  }

  join: asset {
    type: left_outer
    sql_on: ${route_segment.asset_id} = ${asset.id} ;;
    relationship: many_to_one
  }

  join: tenant {
    type: left_outer
    sql_on: ${route_segment.tenant_id} = ${tenant.id} ;;
    relationship: many_to_one
  }

  join: carrier {
    type: left_outer
    sql_on: ${route_segment.carrier_id} = ${carrier.id} ;;
    relationship: many_to_one
  }

  join: tracking_provider {
    type: left_outer
    sql_on: ${tracking_connection.tracking_provider_id} = ${tracking_provider.id} ;;
    relationship: many_to_one
  }

  join: company {
    type: left_outer
    sql_on: ${tracking_connection.company_id} = ${company.id} ;;
    relationship: many_to_one
  }
}

explore: p44_unified_shipment_tracking_updates_v3 {
  join: tenant {
    type: left_outer
    sql_on: ${p44_unified_shipment_tracking_updates_v3.tenant_id} = ${tenant.id} ;;
    relationship: many_to_one
  }

  join: company {
    type: left_outer
    sql_on: ${tenant.company_id} = ${company.id} ;;
    relationship: many_to_one
  }

  join: p44_unified_shipment_tracking_updates_v3__shipment_event_history__events {
    view_label: "P44 Unified Shipment Tracking Updates V3: Shipmenteventhistory Events"
    sql: LEFT JOIN UNNEST(${p44_unified_shipment_tracking_updates_v3.shipment_event_history__events}) as p44_unified_shipment_tracking_updates_v3__shipment_event_history__events ;;
    relationship: one_to_many
  }

  join: p44_unified_shipment_tracking_updates_v3__shipment_event_history__states {
    view_label: "P44 Unified Shipment Tracking Updates V3: Shipmenteventhistory States"
    sql: LEFT JOIN UNNEST(${p44_unified_shipment_tracking_updates_v3.shipment_event_history__states}) as p44_unified_shipment_tracking_updates_v3__shipment_event_history__states ;;
    relationship: one_to_many
  }

  join: p44_unified_shipment_tracking_updates_v3__shipment_event_history__shipment__sub_shipments {
    view_label: "P44 Unified Shipment Tracking Updates V3: Shipmenteventhistory Shipment Subshipments"
    sql: LEFT JOIN UNNEST(${p44_unified_shipment_tracking_updates_v3.shipment_event_history__shipment__sub_shipments}) as p44_unified_shipment_tracking_updates_v3__shipment_event_history__shipment__sub_shipments ;;
    relationship: one_to_many
  }

  join: p44_unified_shipment_tracking_updates_v3__shipment_event_history__shipment__attributes {
    view_label: "P44 Unified Shipment Tracking Updates V3: Shipmenteventhistory Shipment Attributes"
    sql: LEFT JOIN UNNEST(${p44_unified_shipment_tracking_updates_v3.shipment_event_history__shipment__attributes}) as p44_unified_shipment_tracking_updates_v3__shipment_event_history__shipment__attributes ;;
    relationship: one_to_many
  }

  join: p44_unified_shipment_tracking_updates_v3__shipment_event_history__shipment__identifiers {
    view_label: "P44 Unified Shipment Tracking Updates V3: Shipmenteventhistory Shipment Identifiers"
    sql: LEFT JOIN UNNEST(${p44_unified_shipment_tracking_updates_v3.shipment_event_history__shipment__identifiers}) as p44_unified_shipment_tracking_updates_v3__shipment_event_history__shipment__identifiers ;;
    relationship: one_to_many
  }

  join: p44_unified_shipment_tracking_updates_v3__shipment_event_history__shipment__attributes__values {
    view_label: "P44 Unified Shipment Tracking Updates V3: Shipmenteventhistory Shipment Attributes Values"
    sql: LEFT JOIN UNNEST(${p44_unified_shipment_tracking_updates_v3__shipment_event_history__shipment__attributes.values}) as p44_unified_shipment_tracking_updates_v3__shipment_event_history__shipment__attributes__values ;;
    relationship: one_to_many
  }

  join: p44_unified_shipment_tracking_updates_v3__shipment_event_history__shipment__route_info__stops {
    view_label: "P44 Unified Shipment Tracking Updates V3: Shipmenteventhistory Shipment Routeinfo Stops"
    sql: LEFT JOIN UNNEST(${p44_unified_shipment_tracking_updates_v3.shipment_event_history__shipment__route_info__stops}) as p44_unified_shipment_tracking_updates_v3__shipment_event_history__shipment__route_info__stops ;;
    relationship: one_to_many
  }

  join: p44_unified_shipment_tracking_updates_v3__shipment_event_history__shipment__route_info__route_segments {
    view_label: "P44 Unified Shipment Tracking Updates V3: Shipmenteventhistory Shipment Routeinfo Routesegments"
    sql: LEFT JOIN UNNEST(${p44_unified_shipment_tracking_updates_v3.shipment_event_history__shipment__route_info__route_segments}) as p44_unified_shipment_tracking_updates_v3__shipment_event_history__shipment__route_info__route_segments ;;
    relationship: one_to_many
  }

  join: p44_unified_shipment_tracking_updates_v3__shipment_event_history__shipment__route_info__route_segments__identifiers {
    view_label: "P44 Unified Shipment Tracking Updates V3: Shipmenteventhistory Shipment Routeinfo Routesegments Identifiers"
    sql: LEFT JOIN UNNEST(${p44_unified_shipment_tracking_updates_v3__shipment_event_history__shipment__route_info__route_segments.identifiers}) as p44_unified_shipment_tracking_updates_v3__shipment_event_history__shipment__route_info__route_segments__identifiers ;;
    relationship: one_to_many
  }

  join: p44_unified_shipment_tracking_updates_v3__shipment_event_history__shipment__route_info__stops__location__identifiers {
    view_label: "P44 Unified Shipment Tracking Updates V3: Shipmenteventhistory Shipment Routeinfo Stops Location Identifiers"
    sql: LEFT JOIN UNNEST(${p44_unified_shipment_tracking_updates_v3__shipment_event_history__shipment__route_info__stops.location__identifiers}) as p44_unified_shipment_tracking_updates_v3__shipment_event_history__shipment__route_info__stops__location__identifiers ;;
    relationship: one_to_many
  }

  join: p44_unified_shipment_tracking_updates_v3__shipment_event_history__shipment__route_info__stops__location__address__address_lines {
    view_label: "P44 Unified Shipment Tracking Updates V3: Shipmenteventhistory Shipment Routeinfo Stops Location Address Addresslines"
    sql: LEFT JOIN UNNEST(${p44_unified_shipment_tracking_updates_v3__shipment_event_history__shipment__route_info__stops.location__address__address_lines}) as p44_unified_shipment_tracking_updates_v3__shipment_event_history__shipment__route_info__stops__location__address__address_lines ;;
    relationship: one_to_many
  }
}

explore: route_segment_identifier {
  join: route_segment {
    type: left_outer
    sql_on: ${route_segment_identifier.route_segment_id} = ${route_segment.id} ;;
    relationship: many_to_one
  }

  join: shipment {
    type: left_outer
    sql_on: ${route_segment.shipment_id} = ${shipment.id} ;;
    relationship: many_to_one
  }

  join: tracking_connection {
    type: left_outer
    sql_on: ${route_segment.tracking_connection_id} = ${tracking_connection.id} ;;
    relationship: many_to_one
  }

  join: asset {
    type: left_outer
    sql_on: ${route_segment.asset_id} = ${asset.id} ;;
    relationship: many_to_one
  }

  join: tenant {
    type: left_outer
    sql_on: ${route_segment.tenant_id} = ${tenant.id} ;;
    relationship: many_to_one
  }

  join: carrier {
    type: left_outer
    sql_on: ${route_segment.carrier_id} = ${carrier.id} ;;
    relationship: many_to_one
  }

  join: tracking_provider {
    type: left_outer
    sql_on: ${tracking_connection.tracking_provider_id} = ${tracking_provider.id} ;;
    relationship: many_to_one
  }

  join: company {
    type: left_outer
    sql_on: ${tracking_connection.company_id} = ${company.id} ;;
    relationship: many_to_one
  }
}

explore: shipment {
  join: tenant {
    type: left_outer
    sql_on: ${shipment.tenant_id} = ${tenant.id} ;;
    relationship: many_to_one
  }

  join: company {
    type: left_outer
    sql_on: ${tenant.company_id} = ${company.id} ;;
    relationship: many_to_one
  }
}

explore: route_segment_tracking_kpi {
  join: route_segment {
    type: left_outer
    sql_on: ${route_segment_tracking_kpi.route_segment_id} = ${route_segment.id} ;;
    relationship: many_to_one
  }

  join: shipment {
    type: left_outer
    sql_on: ${route_segment.shipment_id} = ${shipment.id} ;;
    relationship: many_to_one
  }

  join: tracking_connection {
    type: left_outer
    sql_on: ${route_segment.tracking_connection_id} = ${tracking_connection.id} ;;
    relationship: many_to_one
  }

  join: asset {
    type: left_outer
    sql_on: ${route_segment.asset_id} = ${asset.id} ;;
    relationship: many_to_one
  }

  join: tenant {
    type: left_outer
    sql_on: ${route_segment.tenant_id} = ${tenant.id} ;;
    relationship: many_to_one
  }

  join: carrier {
    type: left_outer
    sql_on: ${route_segment.carrier_id} = ${carrier.id} ;;
    relationship: many_to_one
  }

  join: tracking_provider {
    type: left_outer
    sql_on: ${tracking_connection.tracking_provider_id} = ${tracking_provider.id} ;;
    relationship: many_to_one
  }

  join: company {
    type: left_outer
    sql_on: ${tracking_connection.company_id} = ${company.id} ;;
    relationship: many_to_one
  }
}

explore: shipment_attribute {
  join: shipment {
    type: left_outer
    sql_on: ${shipment_attribute.shipment_id} = ${shipment.id} ;;
    relationship: many_to_one
  }

  join: tenant {
    type: left_outer
    sql_on: ${shipment_attribute.tenant_id} = ${tenant.id} ;;
    relationship: many_to_one
  }

  join: company {
    type: left_outer
    sql_on: ${tenant.company_id} = ${company.id} ;;
    relationship: many_to_one
  }
}

explore: shipment_identifier {
  join: shipment {
    type: left_outer
    sql_on: ${shipment_identifier.shipment_id} = ${shipment.id} ;;
    relationship: many_to_one
  }

  join: tenant {
    type: left_outer
    sql_on: ${shipment.tenant_id} = ${tenant.id} ;;
    relationship: many_to_one
  }

  join: company {
    type: left_outer
    sql_on: ${tenant.company_id} = ${company.id} ;;
    relationship: many_to_one
  }
}

explore: shipment_event {
  join: shipment {
    type: left_outer
    sql_on: ${shipment_event.shipment_id} = ${shipment.id} ;;
    relationship: many_to_one
  }

  join: stop {
    type: left_outer
    sql_on: ${shipment_event.stop_id} = ${stop.id} ;;
    relationship: many_to_one
  }

  join: route_segment {
    type: left_outer
    sql_on: ${shipment_event.route_segment_id} = ${route_segment.id} ;;
    relationship: many_to_one
  }

  join: tenant {
    type: left_outer
    sql_on: ${shipment.tenant_id} = ${tenant.id} ;;
    relationship: many_to_one
  }

  join: company {
    type: left_outer
    sql_on: ${tenant.company_id} = ${company.id} ;;
    relationship: many_to_one
  }

  join: location {
    type: left_outer
    sql_on: ${stop.location_id} = ${location.id} ;;
    relationship: many_to_one
  }

  join: tracking_connection {
    type: left_outer
    sql_on: ${route_segment.tracking_connection_id} = ${tracking_connection.id} ;;
    relationship: many_to_one
  }

  join: asset {
    type: left_outer
    sql_on: ${route_segment.asset_id} = ${asset.id} ;;
    relationship: many_to_one
  }

  join: carrier {
    type: left_outer
    sql_on: ${route_segment.carrier_id} = ${carrier.id} ;;
    relationship: many_to_one
  }

  join: tracking_provider {
    type: left_outer
    sql_on: ${tracking_connection.tracking_provider_id} = ${tracking_provider.id} ;;
    relationship: many_to_one
  }
}

explore: tenant {
  join: company {
    type: left_outer
    sql_on: ${tenant.company_id} = ${company.id} ;;
    relationship: many_to_one
  }
}

explore: tracking_connection {
  join: tracking_provider {
    type: left_outer
    sql_on: ${tracking_connection.tracking_provider_id} = ${tracking_provider.id} ;;
    relationship: many_to_one
  }

  join: company {
    type: left_outer
    sql_on: ${tracking_connection.company_id} = ${company.id} ;;
    relationship: many_to_one
  }

  join: tenant {
    type: left_outer
    sql_on: ${company.tenant_id} = ${tenant.id} ;;
    relationship: many_to_one
  }
}

explore: stop {
  join: shipment {
    type: left_outer
    sql_on: ${stop.shipment_id} = ${shipment.id} ;;
    relationship: many_to_one
  }

  join: tenant {
    type: left_outer
    sql_on: ${stop.tenant_id} = ${tenant.id} ;;
    relationship: many_to_one
  }

  join: location {
    type: left_outer
    sql_on: ${stop.location_id} = ${location.id} ;;
    relationship: many_to_one
  }

  join: company {
    type: left_outer
    sql_on: ${tenant.company_id} = ${company.id} ;;
    relationship: many_to_one
  }
}
