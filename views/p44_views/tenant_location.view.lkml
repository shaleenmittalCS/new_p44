view: tenant_location {
  sql_table_name: `p44_dt_poc_prd_copy_us.tenant_location`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.ID ;;
  }

  dimension_group: created_utc {
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
    datatype: datetime
    sql: ${TABLE}.CREATED_UTC ;;
  }

  dimension_group: deleted_utc {
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
    datatype: datetime
    sql: ${TABLE}.DELETED_UTC ;;
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
    datatype: datetime
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
    datatype: datetime
    sql: ${TABLE}.DW_UPDATED_DATETIME ;;
  }

  dimension: geofence_geom {
    type: string
    sql: ${TABLE}.GEOFENCE_GEOM ;;
  }

  dimension: geofence_meters {
    type: number
    sql: ${TABLE}.GEOFENCE_METERS ;;
  }

  dimension: geofence_minutes {
    type: number
    sql: ${TABLE}.GEOFENCE_MINUTES ;;
  }

  dimension: geofence_type {
    type: string
    sql: ${TABLE}.GEOFENCE_TYPE ;;
  }

  dimension: is_latest {
    type: yesno
    sql: ${TABLE}.IS_LATEST ;;
  }

  dimension: location_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.LOCATION_ID ;;
  }

  dimension: tenant_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.TENANT_ID ;;
  }

  dimension: version {
    type: number
    sql: ${TABLE}.VERSION ;;
  }

  measure: count {
    type: count
    drill_fields: [id, tenant.id, tenant.name, location.name, location.id]
  }
}
