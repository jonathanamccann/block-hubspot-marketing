
view: owner {
  sql_table_name: linq_hubspot.owner ;;
  drill_fields: [owner_id]

  dimension: owner_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.owner_id ;;
    hidden: yes
  }

  dimension: created_at {
    type: string
    sql: ${TABLE}.created_at ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: portal_id {
    type: number
    sql: ${TABLE}.portal_id ;;
    hidden: yes
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: updated_at {
    type: string
    sql: ${TABLE}.updated_at ;;
  }

  measure: count {
    type: count
    drill_fields: [owner_id, last_name, first_name, calendar_event.count]
  }
}
