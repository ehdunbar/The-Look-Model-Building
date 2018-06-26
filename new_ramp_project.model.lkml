connection: "thelook"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

datagroup: 6_hour_persist {
  max_cache_age: "4 hours"
}

explore: inventory_items {
  join: products {
    view_label: "Products"
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
    fields: [brand, category, id, item_name, retail_price]
  }

  join: order_items {
    view_label: "Order Items"
    type: left_outer
    sql_on: ${inventory_items.id} = ${order_items.inventory_item_id} ;;
    relationship: one_to_many
  }
}

## Explore aliassing
# explore: order_items_2 {
#   view_name: order_items
#
# }

explore: users {

  sql_always_where: ${created_date} >= '2015-01-01' ;;

  join: orders {
    view_label: "Orders"
    type: left_outer
    sql_on: ${users.id} = ${orders.user_id} ;;
    relationship: one_to_many
  }

  join: user_data {
    view_label: "User Data"
    type: left_outer
    sql_on: ${users.id} = ${user_data.user_id} ;;
    relationship: one_to_one
  }
}

explore: order_items {

  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }
}
