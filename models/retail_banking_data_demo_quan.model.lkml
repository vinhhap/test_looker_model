# Define the database connection to be used for this model.
connection: "int_demo_looker_retail_banking_data_demo"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: retail_banking_data_demo_quan_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: retail_banking_data_demo_quan_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Retail Banking Data Demo Quan"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: completed_account {}

explore: completed_loan {
  join: completed_account {
    type: left_outer
    relationship: many_to_one
    sql_on: ${completed_loan.account_id} = ${completed_account.account_id} ;;
  }

  join: completed_district {
    type: left_outer
    relationship: many_to_one
    sql_on: ${completed_account.district_id} = ${completed_district.district_id} ;;
  }
}

explore: completed_transaction {}

explore: crm_reviews {}

explore: crm_call_center_logs {}

explore: crm_events {}

explore: completed_disposition {}

explore: completed_client {}

explore: completed_district {}

explore: completed_order {}

explore: completed_card {}

explore: luxury_loan_portfolio {}
