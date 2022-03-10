view: email_event_deferred {
  sql_table_name: linq_hubspot.email_event_deferred ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
    group_label: "Deferred Event"
  }

  dimension: attempt {
    type: string
    sql: ${TABLE}.attempt ;;
    description: "The delivery attempt number."
    group_label: "Deferred Event"
  }

  dimension: response {
    type: string
    sql: ${TABLE}.response ;;
    description: "The full response from the recipient's email server."
    group_label: "Deferred Event"
  }

  measure: count {
    label: "Deferred Count"
    description: "The recipient’s email server has temporarily rejected message, and subsequent attempts will be made to deliver the message."
    type: number
    sql: ${email_event.total_recip_deferred} ;;
    drill_fields: [id]
  }

  measure: deferred_pct {
    label: "Deferred Percent"
    description: "Percent of sent emails that were deferred."
    type: number
    sql: ${email_event.deferred_ratio} ;;
    drill_fields: [id]
    value_format_name: percent_2
  }
}
