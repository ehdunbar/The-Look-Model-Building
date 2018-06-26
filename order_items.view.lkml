view: order_items {
  sql_table_name: demo_db.order_items ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: returned {
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
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  measure: total_sales {
    type: sum
    sql: ${sale_price} ;;
    value_format: "$0.00 "
  }

  measure: max_sale {
    label: "Most Expensive Sale Merge Merge Merge"
    type: max
    sql: ${sale_price} ;;
    drill_fields: [sale_price]
    value_format: "$0.00 "
  }

  measure: min_sale {
    label: "Least Expensive Sale"
    type: min
    sql: ${sale_price} ;;
    drill_fields: [sale_price]
    value_format: "$0.00 "
  }

  measure: average_sale {
    label: "Average Sale Price"
    type: average
    sql: ${sale_price} ;;
    drill_fields: [sale_price, max_sale, min_sale]
    value_format: "$0.00 "
  }

  measure: count {
    type: count
    drill_fields: [id, inventory_items.id, orders.id]
  }
}
