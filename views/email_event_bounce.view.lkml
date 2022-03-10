view: email_event_bounce {
  sql_table_name: linq_hubspot.email_event_bounce ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
    group_label: "Bounce Event"
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
    description: "The best-guess of the type of bounce encountered. If an appropriate category couldn't be determined, this property is omitted."
    group_label: "Bounce Event"
  }

  dimension: response {
    type: string
    sql: ${TABLE}.response ;;
    description: "The full response from the recipient's email server."
    group_label: "Bounce Event"
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    description: "The status code returned from the recipient's email server."
    group_label: "Bounce Event"
  }

  measure: count {
    label: "Bounce Count"
    description: "The recipient's email server couldn't or wouldn't accept the message, and no further attempts will be made to deliver the message."
    type: number
    sql: ${email_event.total_recip_bounced} ;;
    drill_fields: [id]
  }

  measure: bounced_pct {
    label: "Bounced Percent"
    description: "Percent of sent emails that were bounced."
    type: number
    sql: ${email_event.bounced_ratio} ;;
    drill_fields: [id]
    value_format_name: percent_2
  }
}
