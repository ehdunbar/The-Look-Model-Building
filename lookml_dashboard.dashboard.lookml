- dashboard: lookml_dashboard
  title: Lookml Dashboard
  layout: tile
  tile_size: 100

  filters:

  - dashboard: brand_and_category_data
  title: Brand and Category Data
  layout: newspaper
  elements:
  - title: Top 20 Most and Least expensive sale in each Catagory
    name: Top 20 Most and Least expensive sale in each Catagory
    model: new_ramp_project
    explore: inventory_items
    type: looker_area
    fields:
    - order_items.max_sale
    - products.category
    - order_items.min_sale
    sorts:
    - products.category desc
    limit: 20
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: true
    point_style: circle
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    value_labels: legend
    label_type: labPer
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    series_types: {}
    listen:
      Time Period: inventory_items.days_since_purchase_tier
    row: 0
    col: 16
    width: 8
    height: 6
  - title: 10 Least Expensive Brands
    name: 10 Least Expensive Brands
    model: new_ramp_project
    explore: inventory_items
    type: looker_bar
    fields:
    - order_items.average_sale
    - products.brand
    sorts:
    - order_items.average_sale
    limit: 10
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Time Period: inventory_items.days_since_purchase_tier
    row: 0
    col: 8
    width: 8
    height: 6
  - title: 10 Most Expensive Brands
    name: 10 Most Expensive Brands
    model: new_ramp_project
    explore: inventory_items
    type: looker_bar
    fields:
    - order_items.average_sale
    - products.brand
    sorts:
    - order_items.average_sale desc
    limit: 10
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_null_points: true
    point_style: circle
    interpolation: linear
    value_labels: legend
    label_type: labPer
    series_types: {}
    listen:
      Time Period: inventory_items.days_since_purchase_tier
    row: 0
    col: 0
    width: 8
    height: 6
  filters:
  - name: Time Period
    title: Time Period
    type: field_filter
    default_value: '"T01 [0.0,30.0)"'
    allow_multiple_values: true
    required: false
    model: new_ramp_project
    explore: inventory_items
    listens_to_filters: []
    field: inventory_items.days_since_purchase_tier
