- dashboard: logistics__fulfilment
  title: Logistics & Fulfilment
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - title: Untitled
    name: Untitled
    model: Logistics_&_Fulfilment
    explore: inventory_order_identifier
    type: looker_grid
    fields: [shipment_identifier.identifier_type, shipment_identifier.identifier_value,
      shipment_identifier.shipment_id, tracking_provider.type, shipment_event.type,
      location.city, route_segment.transportation_mode, stop.stop_type, tracking_provider.name,
      inventory_order_identifier.inventory_order_id, company.name, company.network_role,
      route_segment_identifier.identifier_type, route_segment_identifier.identifier_value,
      shipment_event.actual_utc_time, shipment_event.estimated_updated_utc_time]
    sorts: [shipment_identifier.identifier_type]
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
      shipment_identifier.shipment_id, shipment_identifier.identifier_type, shipment_identifier.identifier_value,
      tracking_provider.type, shipment_event.type, location.city, route_segment.transportation_mode,
      stop.stop_type, tracking_provider.name, company.name, company.network_role,
      route_segment_identifier.identifier_type, shipment_event.actual_utc_date, route_segment_identifier.identifier_value,
      shipment_event.dw_inserted_datetime_date]
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
      shipment_event.estimated_updated_utc_date: ETA
      company.name: Entity
      company.network_role: Entity Type
      route_segment_identifier.identifier_type: Container Type
      route_segment_identifier.identifier_value: Container ID
      shipment_event.actual_utc_time: Event Time
      shipment_event.estimated_updated_utc_time: ETA
    series_column_widths:
      inventory_order_identifier.inventory_order_id: 107
      shipment_identifier.shipment_id: 104
      shipment_event.estimated_updated_utc_date: 115
      route_segment_identifier.identifier_value: 75
      tracking_provider.type: 75
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
      company.name:
        align: center
      shipment_event.estimated_updated_utc_date:
        align: center
      inventory_order_identifier.inventory_order_id:
        align: center
      company.network_role:
        align: center
      route_segment_identifier.identifier_value:
        align: center
      route_segment_identifier.identifier_type:
        align: center
      shipment_event.actual_utc_time:
        align: center
      shipment_event.estimated_updated_utc_time:
        align: center
    header_font_color: "#12B5CB"
    defaults_version: 1
    title_hidden: true
    listen:
      Transportation Mode: route_segment.transportation_mode
      Order ID: inventory_order_identifier.inventory_order_id
      Provider Name: tracking_provider.name
      Shipment ID: shipment_identifier.shipment_id
      " Shipment Event Type": shipment_event.type
      Entity: company.name
    row: 8
    col: 0
    width: 24
    height: 8
  - title: Untitled
    name: Untitled (2)
    model: Logistics_&_Fulfilment
    explore: inventory_order_identifier
    type: looker_map
    fields: [location_extended.location, shipment_identifier.shipment_id, tracking_provider.name,
      location.country, location.city, shipment_event.type, tracking_provider.type]
    filters:
      tracking_provider.name: "-NULL"
      location.country: "-NULL"
    sorts: [location_extended.location]
    limit: 2000
    map_plot_mode: lines
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 1
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: streets
    map_position: custom
    map_scale_indicator: metric
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: true
    reverse_map_value_colors: false
    map_zoom: 3
    map_marker_radius_fixed: 10000
    map_marker_radius_min: 100
    map_marker_radius_max: 100
    map_marker_color: [Blue]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields:
    title_hidden: true
    listen:
      Order ID: inventory_order_identifier.inventory_order_id
      Shipment ID: shipment_identifier.shipment_id
      Entity: company.name
    row: 0
    col: 0
    width: 24
    height: 8
  filters:
  - name: Shipment ID
    title: Shipment ID
    type: field_filter
    default_value: 4EE7642B8D0E4BA6A5F7850683D5C442
    allow_multiple_values: true
    required: true
    ui_config:
      type: advanced
      display: popover
      options: []
    model: Logistics_&_Fulfilment
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
    model: Logistics_&_Fulfilment
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
    model: Logistics_&_Fulfilment
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
    model: Logistics_&_Fulfilment
    explore: inventory_order_identifier
    listens_to_filters: []
    field: tracking_provider.name
  - name: " Shipment Event Type"
    title: " Shipment Event Type"
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: Logistics_&_Fulfilment
    explore: inventory_order_identifier
    listens_to_filters: []
    field: shipment_event.type
  - name: Entity
    title: Entity
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: Logistics_&_Fulfilment
    explore: inventory_order_identifier
    listens_to_filters: []
    field: company.name
