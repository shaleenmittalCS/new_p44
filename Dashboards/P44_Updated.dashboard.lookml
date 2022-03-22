- dashboard: Logistics_and_Fullfillment
  title: Logistics_And_Fullfillment
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - title: Shipments
    name: Shipments
    model: Logistics_&_Fullfillment
    explore: shipment_identifier
    type: looker_grid
    fields: [shipment_identifier.shipment_id, route_segment.transportation_mode, stop.stop_type,
      shipment_identifier.identifier_type, location_identifier.identifier_type, location_identifier.identifier_value,
      location.city, shipment_identifier.identifier_value, tracking_provider.type,
      tracking_connection.readiness]
    filters:
      tracking_provider.type: "-NULL"
    sorts: [location_identifier.identifier_type desc]
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
    enable_conditional_formatting: true
    header_text_alignment: center
    header_font_size: '13'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", shipment_identifier.shipment_id, route_segment.transportation_mode]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels: {}
    series_text_format:
      shipment_identifier.shipment_id:
        align: center
      route_segment.transportation_mode:
        align: center
      stop.stop_type:
        align: center
      shipment_identifier.identifier_type:
        align: center
      shipment_identifier.identifier_value:
        align: center
      tracking_provider.type:
        align: center
      tracking_connection.readiness:
        align: center
      location_identifier.identifier_type:
        align: center
      location_identifier.identifier_value:
        align: center
      location.city:
        align: center
    header_font_color: "#12B5CB"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Transportation Mode: route_segment.transportation_mode
      Stop Type: stop.stop_type
      Location: location.city
    row: 0
    col: 0
    width: 24
    height: 9
  filters:
  - name: Transportation Mode
    title: Transportation Mode
    type: field_filter
    default_value: AIR
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
      options: []
    model: Logistics_&_Fullfillment
    explore: shipment_identifier
    listens_to_filters: []
    field: route_segment.transportation_mode
  - name: Stop Type
    title: Stop Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: Logistics_&_Fullfillment
    explore: shipment_identifier
    listens_to_filters: []
    field: stop.stop_type
  - name: Location
    title: Location
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: Logistics_&_Fullfillment
    explore: shipment_identifier
    listens_to_filters: []
    field: location.city
