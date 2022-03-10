view: email_event_status_change {
  sql_table_name: linq_hubspot.email_event_status_change ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
    group_label: "Status Change Event"
  }

  dimension: bounced {
    type: yesno
    sql: ${TABLE}.bounced ;;
    group_label: "Status Change Event"
  }

  dimension: portal_subscription_status {
    type: string
    sql: ${TABLE}.portal_subscription_status ;;
    description: "The recipient's portal subscription status."
    group_label: "Status Change Event"
  }

  dimension: requested_by {
    type: string
    sql: ${TABLE}.requested_by ;;
    description: "The email address of the person requesting the change on behalf of the recipient. If not applicable, this property is omitted."
    group_label: "Status Change Event"
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
    description: "The source of the subscription change."
    group_label: "Status Change Event"
  }

  dimension: subscriptions {
    type: number
    sql: ${TABLE}.subscriptions ;;
    description: "An array of JSON objects representing the status of subscriptions for the recipient. Each JSON subscription object is comprised of the properties: 'id', 'status'."
    group_label: "Status Change Event"
  }

  measure: count {
    label: "Status Changed Count"
    description: "The recipient changed their email subscriptions in some way."
    type: count
    drill_fields: [id]
  }
}
