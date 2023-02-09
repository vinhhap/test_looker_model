# The name of this view in Looker is "Completed District"
view: completed_district {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `retail_banking_demo_data.completed_district`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "City" in Explore.

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: district_id {
    type: number
    sql: ${TABLE}.district_id ;;
  }

  dimension: division {
    type: string
    sql: ${TABLE}.division ;;
    drill_fields: [state_name,city]
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
    drill_fields: [division,state_name,city]
  }

  dimension: dynamic_region_city {
    type: string
    drill_fields: [division,state_name,city]
    sql:
      {% if state_name._is_filtered %}
        ${city}
      {% else %}
        ${region}
      {% endif %}
    ;;
  }

  dimension: state_abbrev {
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.state_abbrev ;;
    drill_fields: [city]
  }

  dimension: state_name {
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.state_name ;;
    drill_fields: [city]
  }

  measure: count {
    type: count
    drill_fields: [state_name]
  }
}
