view: form {
  sql_table_name: linq_hubspot.form ;;

  dimension: action {
    type: string
    sql: ${TABLE}.action ;;
  }

  dimension: created_at {
    type: string
    sql: ${TABLE}.created_at ;;
  }

  dimension: css_class {
    type: string
    sql: ${TABLE}.css_class ;;
  }

  dimension: follow_up_id {
    type: number
    sql: ${TABLE}.follow_up_id ;;
  }

  dimension: guid {
    primary_key: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.guid ;;
  }

  dimension: lead_nurturing_campaign_id {
    type: number
    hidden: yes
    sql: ${TABLE}.lead_nurturing_campaign_id ;;
  }

  dimension: method {
    type: string
    sql: ${TABLE}.method ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: notify_recipients {
    type: yesno
    sql: ${TABLE}.notify_recipients ;;
  }

  dimension: portal_id {
    type: number
    sql: ${TABLE}.portal_id ;;
    hidden: yes
  }

  dimension: redirect {
    type: string
    sql: ${TABLE}.redirect ;;
  }

  dimension: submit_text {
    type: string
    sql: ${TABLE}.submit_text ;;
  }

  dimension: updated_at {
    type: string
    sql: ${TABLE}.updated_at ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
