view: orders {
  sql_table_name: demo_db.orders ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

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

  dimension: status {
    type: string
  #  sql: ${TABLE}.status ;;
    case: {
      when: {
        sql: ${TABLE}.status = 'complete' ;;
        label: "Order Completed"
      }
      when: {
        sql: ${TABLE}.status = 'cancelled' ;;
        label: "Order Cancelled"
      }
      else: "Unknown"
    }
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, users.first_name, users.last_name, users.id, order_items.count]
  }
}
