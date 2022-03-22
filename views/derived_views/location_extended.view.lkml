view: location_extended {
  derived_table: {
    sql: SELECT ST_GEOGPOINT(CAST(SPLIT(substr(LOCATION_GEOM,INSTR(LOCATION_GEOM,'[') + 1,INSTR(LOCATION_GEOM,']') - INSTR(LOCATION_GEOM,'[') - 1),',')[safe_ordinal(1)] as FLOAT64),
       CAST(SPLIT(substr(LOCATION_GEOM,INSTR(LOCATION_GEOM,'[') + 1,INSTR(LOCATION_GEOM,']') - INSTR(LOCATION_GEOM,'[') - 1),',')[safe_ordinal(2)] as FLOAT64)) AS LOCATION_POINT,
       ST_X(ST_GEOGPOINT(CAST(SPLIT(substr(LOCATION_GEOM,INSTR(LOCATION_GEOM,'[') + 1,INSTR(LOCATION_GEOM,']') - INSTR(LOCATION_GEOM,'[') - 1),',')[safe_ordinal(1)] as FLOAT64),
       CAST(SPLIT(substr(LOCATION_GEOM,INSTR(LOCATION_GEOM,'[') + 1,INSTR(LOCATION_GEOM,']') - INSTR(LOCATION_GEOM,'[') - 1),',')[safe_ordinal(2)] as FLOAT64))) as LONGITUDE,
       ST_Y(ST_GEOGPOINT(CAST(SPLIT(substr(LOCATION_GEOM,INSTR(LOCATION_GEOM,'[') + 1,INSTR(LOCATION_GEOM,']') - INSTR(LOCATION_GEOM,'[') - 1),',')[safe_ordinal(1)] as FLOAT64),
       CAST(SPLIT(substr(LOCATION_GEOM,INSTR(LOCATION_GEOM,'[') + 1,INSTR(LOCATION_GEOM,']') - INSTR(LOCATION_GEOM,'[') - 1),',')[safe_ordinal(2)] as FLOAT64))) as LATITUDE
       ,LOCATION_GEOM,
       ID  AS location_id
 FROM `dev-cs-1.p44_dt_poc_prd_copy_us.location`
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: location_point {
    type: string
    sql: ${TABLE}.LOCATION_POINT ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.LONGITUDE ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.LATITUDE ;;
  }

  dimension: location_geom {
    type: string
    sql: ${TABLE}.LOCATION_GEOM ;;
  }

  dimension: location_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.location_id ;;
  }

  dimension: location {
    type: location
    sql_latitude: ${TABLE}.latitude ;;
    sql_longitude: ${TABLE}.longitude ;;
  }

  set: detail {
    fields: [
      location_point,
      longitude,
      latitude,
      location_geom,
      location_id,
      location
    ]
  }
}
