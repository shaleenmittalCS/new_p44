view: company_identifier {
  sql_table_name: `p44_dt_poc_prd_copy_us.company_identifier`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: company_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.COMPANY_ID ;;
  }

  dimension_group: dw_inserted_datetime {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.DW_INSERTED_DATETIME ;;
  }

  dimension_group: dw_updated_datetime {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.DW_UPDATED_DATETIME ;;
  }

  dimension: identifier_type {
    type: string
    sql: ${TABLE}.IDENTIFIER_TYPE ;;
  }

  dimension: identifier_value1 {
    type: string
    sql: ${TABLE}.IDENTIFIER_VALUE1 ;;
  }

  dimension: identifier_value2 {
    type: string
    sql: ${TABLE}.IDENTIFIER_VALUE2 ;;
  }

  measure: count {
    type: count
    drill_fields: [id, company.id, company.name]
  }
}
