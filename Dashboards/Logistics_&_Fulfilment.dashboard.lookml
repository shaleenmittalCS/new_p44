- dashboard: logistics__fulfilment
  title: Logistics & Fulfilment
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - title: Untitled
    name: Untitled
    model: Logistics_&_Fullfillment
    explore: inventory_order_identifier
    type: looker_grid
    fields: [inventory_order.type, inventory_order.status_code, shipment_identifier.identifier_type,
      shipment_identifier.identifier_value, shipment_identifier.shipment_id, tracking_provider.type,
      shipment_event.type, location.city, route_segment.transportation_mode, stop.stop_type,
      tracking_provider.name, inventory_order_identifier.inventory_order_id]
    filters:
      tracking_provider.type: "-NULL"
      inventory_order.type: "-NULL"
    sorts: [inventory_order.type]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", inventory_order_identifier.inventory_order_id,
      shipment_identifier.shipment_id, inventory_order.type, inventory_order.status_code,
      shipment_identifier.identifier_type, shipment_identifier.identifier_value, tracking_provider.type,
      shipment_event.type, location.city, route_segment.transportation_mode, stop.stop_type,
      tracking_provider.name]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      inventory_order.id: Order ID
      inventory_order.type: Order Type
      inventory_order.status_code: Order Status
      shipment_identifier.identifier_type: Identifier Type
      tracking_provider.type: Provider Type
      shipment_event.type: Shipment Event Type
      route_segment.transportation_mode: Transportation Mode
      tracking_provider.name: Provider Name
      inventory_order_identifier.inventory_order_id: Order ID
    series_column_widths:
      inventory_order_identifier.inventory_order_id: 199
    series_text_format:
      inventory_order.id:
        align: center
      inventory_order.type:
        align: center
      inventory_order.status_code:
        align: center
      shipment_identifier.identifier_type:
        align: center
      shipment_identifier.identifier_value:
        align: center
      shipment_identifier.shipment_id:
        align: center
      tracking_provider.type:
        align: center
      shipment_event.type:
        align: center
      location.city:
        align: center
      route_segment.transportation_mode:
        align: center
      stop.stop_type:
        align: center
      tracking_provider.name:
        align: center
    header_font_color: "#12B5CB"
    defaults_version: 1
    title_hidden: true
    listen:
      Shipment ID: shipment_identifier.shipment_id
      Transportation Mode: route_segment.transportation_mode
      Order ID: inventory_order_identifier.inventory_order_id
      Provider Name: tracking_provider.name
      " Shipment Stop Type": shipment_event.type
    row: 0
    col: 0
    width: 24
    height: 9
  filters:
  - name: Shipment ID
    title: Shipment ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: Logistics_&_Fullfillment
    explore: inventory_order_identifier
    listens_to_filters: []
    field: shipment_identifier.shipment_id
  - name: Transportation Mode
    title: Transportation Mode
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: Logistics_&_Fullfillment
    explore: inventory_order_identifier
    listens_to_filters: []
    field: route_segment.transportation_mode
  - name: Order ID
    title: Order ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: Logistics_&_Fullfillment
    explore: inventory_order_identifier
    listens_to_filters: []
    field: inventory_order_identifier.inventory_order_id
  - name: Provider Name
    title: Provider Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: Logistics_&_Fullfillment
    explore: inventory_order_identifier
    listens_to_filters: []
    field: tracking_provider.name
  - name: " Shipment Stop Type"
    title: " Shipment Stop Type"
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: Logistics_&_Fullfillment
    explore: inventory_order_identifier
    listens_to_filters: []
    field: shipment_event.type
