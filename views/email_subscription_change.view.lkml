view: email_subscription_change {
  sql_table_name: linq_hubspot.email_subscription_change ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(CAST(${recipient} AS STRING), CAST(${timestamp_raw} AS STRING)) ;;
  }

  dimension: caused_by_event_id {
    type: number
    sql: ${TABLE}.caused_by_event_id ;;
    description: "The event ID of the email event that caused this change."
  }

  dimension: change {
    type: string
    sql: ${TABLE}.change ;;
    description: "The change which occurred."
  }

  dimension: change_type {
    type: string
    sql: ${TABLE}.change_type ;;
    description: "The type of change which occurred."
  }

  dimension: portal_id {
    type: number
    sql: ${TABLE}.portal_id ;;
    hidden: yes
    description: "An ID referencing the HubSpot account associated with the change. This will correspond to your account."
  }

  dimension: recipient {
    type: number
    sql: ${TABLE}.recipient ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
    description: "The source of the subscription change."
  }

  dimension: subscription_id {
    type: number
    sql: ${TABLE}.subscription_id ;;
    description: "An ID referencing the email subscription associated with the change."
  }

  dimension_group: timestamp {
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    type: time
    sql:  ${TABLE}.timestamp ;;
    datatype: epoch
    description: "The timestamp (in milliseconds since epoch) when this change occurred. If 'causedByEvent' is present, this will be absent."
  }

  measure: count {
    type: count
    drill_fields: [drills*]
  }

  measure: count_subscribe_events {
    type: count

    filters: {
      field: change
      value: "SUBSCRIBED"
    }
    drill_fields: [drills*]
  }

  measure: count_unsubscribe_events {
    type: count

    filters: {
      field: change
      value: "UNSUBSCRIBED"
    }
    drill_fields: [drills*]
  }

  measure: net_subscription_events {
    type: number
    sql: ${count_subscribe_events} - ${count_unsubscribe_events} ;;
  }

  measure: count_spam_report_events {
    type: count

    filters: {
      field: change
      value: "REPORTED_SPAM"
    }
    drill_fields: [drills*]
  }

  measure: unsubribe_rate {
    type: number
    description: "Number of Unsubscibe Events / Number of Sent Emails"
    sql: ${count_unsubscribe_events} / ${email_event_sent.count} ;;
    value_format_name: percent_2
  }

  measure: subribe_rate {
    type: number
    description: "Number of Subscibe Events / Number of Sent Emails"
    sql: ${net_subscription_events} / ${email_event_sent.count} ;;
    value_format_name: percent_2
  }

  set: drills {
    fields: [
      caused_by_event_id,
      change_type,
      change,
      source,
      subscription_id,
      portal_id
    ]
  }
}
