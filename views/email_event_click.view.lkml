view: email_event_click {
  sql_table_name: linq_hubspot.email_event_click ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
    group_label: "Click Event"
  }

  dimension: browser {
    type: string
    sql: ${TABLE}.browser ;;
    description: "A JSON object representing the browser which serviced the event. Its comprised of the properties: 'name', 'family', 'producer', 'producer_url', 'type', 'url', 'version'."
    group_label: "Click Event"
  }

  dimension: ip_address {
    type: string
    sql: ${TABLE}.ip_address ;;
    group_label: "Click Event"
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
    description: "A JSON object representing the location where the event occurred. It's comprised of the properties: 'city', 'state', 'country'."
    group_label: "Click Event"
  }

  dimension: referer {
    type: string
    sql: ${TABLE}.referer ;;
    description: "The URL of the webpage that linked to the URL clicked. Whether this is provided, and what its value is, is determined by the recipient's email client."
    group_label: "Click Event"
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
    description: "The URL within the message that the recipient clicked."
    group_label: "Click Event"
  }

  dimension: user_agent {
    type: string
    sql: ${TABLE}.user_agent ;;
    description: "The user agent responsible for the event, e.g. “Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.95 Safari/537.36”"
    group_label: "Click Event"
  }

  measure: count {
    label: "Click Count"
    description: "The recipient clicked on a link within the message."
    sql: ${email_event.total_recip_clicks} ;;
    type: number
    drill_fields: [id]
  }

  measure: clicked_pct {
    label: "Clicked Percent"
    description: "Percent of sent emails that were clicked."
    type: number
    sql: ${email_event.click_ratio} ;;
    drill_fields: [id]
    value_format_name: percent_2
  }
}
