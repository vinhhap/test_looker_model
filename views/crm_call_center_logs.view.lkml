# The name of this view in Looker is "Crm Call Center Logs"
view: crm_call_center_logs {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `retail_banking_demo_data.crm_call_center_logs`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Call ID" in Explore.

  dimension: call_id {
    type: number
    sql: ${TABLE}.call_id ;;
  }

  dimension: complaint_id {
    type: string
    sql: ${TABLE}.Complaint_ID ;;
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

  dimension: outcome {
    type: string
    sql: ${TABLE}.outcome ;;
  }

  dimension: phonefinal {
    type: string
    sql: ${TABLE}.phonefinal ;;
  }

  dimension: priority {
    type: number
    sql: ${TABLE}.priority ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_priority {
    type: sum
    sql: ${priority} ;;
  }

  measure: average_priority {
    type: average
    sql: ${priority} ;;
  }

  dimension: rand_client {
    type: string
    sql: ${TABLE}.rand_client ;;
  }

  dimension: ser_exit {
    type: string
    sql: ${TABLE}.ser_exit ;;
  }

  dimension: ser_start {
    type: string
    sql: ${TABLE}.ser_start ;;
  }

  dimension: ser_time {
    type: string
    sql: ${TABLE}.ser_time ;;
  }

  dimension: server {
    type: string
    sql: ${TABLE}.server ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: vru_line {
    type: string
    sql: ${TABLE}.vru_line ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
