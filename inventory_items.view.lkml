view: inventory_items {
  sql_table_name: demo_db.inventory_items ;;

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  ##Creates a tier group to look at how long since the order has been purchased
  #creates the dimension group created to look at the time frame column
  dimension_group: sold {
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
    sql: ${TABLE}.sold_at ;;
  }

  #creates the number of days between the created date and the date now
  dimension: days_since_purchase {
    type: number
    sql: DATEDIFF(NOW(), ${sold_date}) ;;
  }

  #creates the tiers of how long since they have been purchased
  dimension: days_since_purchase_tier {
    type: tier
    tiers: [0, 30, 60, 90, 180, 365]
    sql: ${days_since_purchase} ;;
  }


  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

#   measure: profit {
#     type: sum
#     sql:  ${cost} - ${order_items.total_sales} ;;
#   }

  measure: count {
    type: count
    drill_fields: [id, products.item_name, products.id, order_items.count]
  }
}
