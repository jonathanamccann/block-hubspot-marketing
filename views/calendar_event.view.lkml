view: calendar_event {
  sql_table_name: linq_hubspot.calendar_event ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    description: "The unique id of the task."
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: avatar_url {
    type: string
    sql: ${TABLE}.avatar_url ;;
  }

  dimension: campaign_guid {
    type: number
    value_format_name: id
    sql: ${TABLE}.campaign_guid ;;
    hidden: yes
    description: "Value of campaign GUID associated with Content."
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
    description: "Type of event; one of email, recurring-email, blog-post, landing-page, legacy-page, site-page."
  }

  dimension: category_id {
    type: number
    sql: ${TABLE}.category_id ;;
    hidden: yes
    description: "One of 2 (email, recurring-email), 3 (blog-post), 1 (landing-page), 5 (legacy-page), 4 (site-page)."
  }

  dimension: content_group_id {
    type: number
    sql: ${TABLE}.content_group_id ;;
  }

  dimension: content_id {
    type: number
    sql: ${TABLE}.content_id ;;
    hidden: yes
    description: "ID value of the COS content object associated with the event, null for if nothing associated."
  }

  dimension: create_content {
    type: string
    sql: ${TABLE}.create_content ;;
  }

  dimension: created_by {
    type: string
    sql: ${TABLE}.created_by ;;
    description: "HubSpot ID of the user that the event was created by."
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
    description: "Description of Event."
  }

  dimension: event_date {
    type: string
    sql: ${TABLE}.event_date ;;
    description: "When the event is/ was scheduled to be published, in milliseconds since the epoch."
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.event_type ;;
    description: "Type of calendar event; for tasks this is PUBLISHING_TASK, for COS Items, this is CONTENT, for social media events, this is SOCIAL"
  }

  dimension: group_id {
    type: number
    sql: ${TABLE}.group_id ;;
    hidden: yes
  }

  dimension: group_order {
    type: string
    sql: ${TABLE}.group_order ;;
  }

  dimension: is_recurring {
    type: yesno
    sql: ${TABLE}.is_recurring ;;
    description: "Is the event recurring?"
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    description: "Name of Event."
  }

  dimension: owner_id {
    type: number
    hidden: yes
    sql: ${TABLE}.owner_id ;;
  }

  dimension: portal_id {
    type: number
    sql: ${TABLE}.portal_id ;;
    hidden: yes
    description: "The hub id."
  }

  dimension: preview_key {
    type: string
    sql: ${TABLE}.preview_key ;;
    description: "Preview key of content object; used for showing previews of unpublished items."
  }

  dimension: social_display_name {
    type: string
    sql: ${TABLE}.social_display_name ;;
  }

  dimension: social_username {
    type: string
    sql: ${TABLE}.social_username ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
    description: "One of SCHEDULED, PUBLISHED, PUBLISHED_OR_SCHEDULED"
  }

  dimension: template_path {
    type: string
    sql: ${TABLE}.template_path ;;
  }

  dimension: topic_ids {
    type: string
    sql: ${TABLE}.topic_ids ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
    description: "Public url of content item."
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
    hidden: yes
  }

  dimension: user_ids {
    type: string
    sql: ${TABLE}.user_ids ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      id,
      social_username,
      social_display_name,
      name,
      owner.owner_id,
      owner.last_name,
      owner.first_name
    ]
  }
}
