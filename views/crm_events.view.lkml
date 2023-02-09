# The name of this view in Looker is "Crm Events"
view: crm_events {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `retail_banking_demo_data.crm_events`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Client ID" in Explore.

  dimension: client_id {
    type: string
    sql: ${TABLE}.Client_ID ;;
  }

  dimension: company_response_to_consumer {
    type: string
    sql: ${TABLE}.Company_response_to_consumer ;;
  }

  dimension: complaint_id {
    type: string
    sql: ${TABLE}.Complaint_ID ;;
  }

  dimension: consumer_complaint_narrative {
    type: string
    sql: ${TABLE}.Consumer_complaint_narrative ;;
  }

  dimension: consumer_consent_provided_ {
    type: string
    sql: ${TABLE}.Consumer_consent_provided_ ;;
  }

  dimension: consumer_disputed_ {
    type: yesno
    sql: ${TABLE}.Consumer_disputed_ ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date_received {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Date_received ;;
  }

  dimension_group: date_sent_to_company {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Date_sent_to_company ;;
  }

  dimension: issue {
    type: string
    sql: ${TABLE}.Issue ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}.Product ;;
  }

  dimension: sub_issue {
    type: string
    sql: ${TABLE}.Sub_issue ;;
  }

  dimension: sub_product {
    type: string
    sql: ${TABLE}.Sub_product ;;
  }

  dimension: submitted_via {
    type: string
    sql: ${TABLE}.Submitted_via ;;
  }

  dimension: tags {
    type: string
    sql: ${TABLE}.Tags ;;
  }

  dimension: timely_response_ {
    type: yesno
    sql: ${TABLE}.Timely_response_ ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
