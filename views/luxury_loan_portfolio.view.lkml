# The name of this view in Looker is "Luxury Loan Portfolio"
view: luxury_loan_portfolio {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `retail_banking_demo_data.luxury_loan_portfolio`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called " 10 Yr Treasury Index Date Funded" in Explore.

  dimension: _10_yr_treasury_index_date_funded {
    type: number
    sql: ${TABLE}._10_yr_treasury_index_date_funded ;;
  }

  dimension: address_1 {
    type: string
    sql: ${TABLE}.ADDRESS_1 ;;
  }

  dimension: address_2 {
    type: string
    sql: ${TABLE}.ADDRESS_2 ;;
  }

  dimension: building_class_at_present {
    type: string
    sql: ${TABLE}.BUILDING_CLASS_AT_PRESENT ;;
  }

  dimension: building_class_category {
    type: string
    sql: ${TABLE}.BUILDING_CLASS_CATEGORY ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.CITY ;;
  }

  dimension: duration_months {
    type: number
    sql: ${TABLE}.duration_months ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_duration_months {
    type: sum
    sql: ${duration_months} ;;
  }

  measure: average_duration_months {
    type: average
    sql: ${duration_months} ;;
  }

  dimension: duration_years {
    type: number
    sql: ${TABLE}.duration_years ;;
  }

  dimension: employment_length {
    type: number
    sql: ${TABLE}.employment_length ;;
  }

  dimension: firstname {
    type: string
    sql: ${TABLE}.firstname ;;
  }

  dimension: funded_amount {
    type: number
    sql: ${TABLE}.funded_amount ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: funded {
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
    sql: ${TABLE}.funded_date ;;
  }

  dimension: gross_square_feet {
    type: string
    sql: ${TABLE}.GROSS_SQUARE_FEET ;;
  }

  dimension: interest_rate {
    type: number
    sql: ${TABLE}.interest_rate ;;
  }

  dimension: interest_rate_percent {
    type: number
    sql: ${TABLE}.interest_rate_percent ;;
  }

  dimension: land_square_feet {
    type: string
    sql: ${TABLE}.LAND_SQUARE_FEET ;;
  }

  dimension: lastname {
    type: string
    sql: ${TABLE}.lastname ;;
  }

  dimension: loan_balance {
    type: number
    sql: ${TABLE}.loan_balance ;;
  }

  dimension: loan_id {
    type: string
    sql: ${TABLE}.loan_id ;;
  }

  dimension: middlename {
    type: string
    sql: ${TABLE}.middlename ;;
  }

  dimension: payments {
    type: number
    sql: ${TABLE}.payments ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: property_value {
    type: number
    sql: ${TABLE}.property_value ;;
  }

  dimension: purpose {
    type: string
    sql: ${TABLE}.purpose ;;
  }

  dimension: social {
    type: string
    sql: ${TABLE}.social ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.STATE ;;
  }

  dimension: tax_class_at_present {
    type: string
    sql: ${TABLE}.TAX_CLASS_AT_PRESENT ;;
  }

  dimension: tax_class_at_time_of_sale {
    type: number
    sql: ${TABLE}.TAX_CLASS_AT_TIME_OF_SALE ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: total_past_payments {
    type: number
    sql: ${TABLE}.total_past_payments ;;
  }

  dimension: total_units {
    type: number
    sql: ${TABLE}.TOTAL_UNITS ;;
  }

  dimension: zip_code {
    type: zipcode
    sql: ${TABLE}.ZIP_CODE ;;
  }

  measure: count {
    type: count
    drill_fields: [firstname, middlename, lastname]
  }
}
