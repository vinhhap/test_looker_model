# The name of this view in Looker is "Completed Loan"
view: completed_loan {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `retail_banking_demo_data.completed_loan`
    ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Account ID" in Explore.

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }

  # dimension: amount {
  #   type: number
  #   sql: ${TABLE}.amount ;;
  # }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  dimension: day {
    type: number
    sql: ${TABLE}.day ;;
  }

  dimension: duration {
    type: number
    sql: ${TABLE}.duration ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: fulldate {
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
    sql: ${TABLE}.fulldate ;;
  }

  # dimension: dynamic_timegrain {
  #   type: string
  #   sql:
  #     case when abs(date_diff(cast(coalesce({% date_start fulldate_year %}, '2013-01-01') as date), cast(coalesce({% date_end fulldate_year %}, '2018-12-31') as date), year)) >= 3
  #           then cast(${fulldate_year} as string)
  #         when abs(date_diff(cast(coalesce({% date_start fulldate_quarter %}, '2013-01-01') as date), cast(coalesce({% date_end fulldate_quarter %}, '2018-12-31') as date), quarter)) > 4
  #           then cast(${fulldate_quarter} as string)
  #         when abs(date_diff(cast(coalesce({% date_start fulldate_month %}, '2013-01-01') as date), cast(coalesce({% date_end fulldate_month %}, '2018-12-31') as date), month)) > 6
  #           then cast(${fulldate_month} as string)
  #         when abs(date_diff(cast(coalesce({% date_start fulldate_week %}, '2013-01-01') as date), cast(coalesce({% date_end fulldate_week %}, '2018-12-31') as date), week)) > 12
  #           then cast(${fulldate_week} as string)
  #         else cast(${fulldate_date} as string) end
  #   ;;
  # }

  dimension: loan_id {
    type: string
    sql: ${TABLE}.loan_id ;;
  }

  dimension: location {
    type: number
    sql: ${TABLE}.location ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  # dimension: payments {
  #   type: number
  #   sql: ${TABLE}.payments ;;
  # }

  dimension: purpose {
    type: string
    sql: ${TABLE}.purpose ;;
  }

  dimension: formatted_purpose {
    type: string
    sql: initcap(replace(${purpose}, '_', ' ')) ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: year {
    type: string
    sql: ${TABLE}.year ;;
  }

  measure: total_amount {
    type: sum
    sql: ${TABLE}.amount ;;
    drill_fields: [loan_id,account_id,fulldate_date,total_amount,total_payments,total_remaining_debt]
  }

  measure: average_amount {
    type: average
    sql: ${TABLE}.amount ;;
  }

  measure: total_payments {
    type: sum
    sql: ${TABLE}.payments ;;
  }

  measure: average_payments {
    type: average
    sql: ${TABLE}.payments ;;
  }

  measure: total_remaining_debt {
    type: sum
    sql: ${TABLE}.amount - ${TABLE}.payments ;;
  }

  measure: average_remaining_debt {
    type: average
    sql: ${TABLE}.amount - ${TABLE}.payments ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  parameter: dates_granularity {
    type: unquoted
    allowed_value: { label: "Date" value: "date" }
    allowed_value: { label: "Week" value: "week" }
    allowed_value: { label: "Month" value: "month" }
    allowed_value: { label: "Quarter" value: "quarter" }
    allowed_value: { label: "Year" value: "year" }
    allowed_value: {label: "Raw" value:"raw"}
  }

  dimension: order_fulldate_granularity {
    description: "Use it in conjunction with Dates Granularity Filter"
    sql:
      {% if dates_granularity._parameter_value == 'date' %} cast(${fulldate_date} as string)
      {% elsif dates_granularity._parameter_value == 'week' %} cast(${fulldate_week} as string)
      {% elsif dates_granularity._parameter_value == 'month' %} cast(${fulldate_month} as string)
      {% elsif dates_granularity._parameter_value == 'quarter' %} cast(${fulldate_quarter} as string)
      {% elsif dates_granularity._parameter_value == 'year' %} cast(${fulldate_year} as string)
      {% elsif dates_granularity._parameter_value == 'raw' %} cast(${fulldate_raw} as string)
      {% else %} ${fulldate_year}
      {% endif %};;
  }
}
