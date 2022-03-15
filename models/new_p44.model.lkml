connection: "scl_twin_private"

# include all the views
include: "/views/**/*.view"

datagroup: new_p44_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: new_p44_default_datagroup

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

  join: shipment_identifier {
    type: left_outer
    sql_on: ${inventory_order.shipment_id} = ${shipment_identifier.shipment_id};;
    relationship: many_to_one
  }

  join: shipment_event {
    type: left_outer
    sql_on: ${inventory_order.shipment_id} = ${shipment_event.shipment_id} ;;
    relationship: many_to_one
  }

  join: stop {
    type: left_outer
    sql_on: ${inventory_order.shipment_id} = ${stop.shipment_id} ;;
    relationship: many_to_one
  }

  join: location {
    type: left_outer
    sql_on: ${stop.location_id} = ${location.id} ;;
    relationship: many_to_one
  }

}
