class ycl_rt23_sn_dynamic_tile definition
  public
  final
  create public .

public section.

  interfaces /neptune/if_nad_server .

  types: begin of ty_menu,
          tile_title       type string,
          tile_info        type string,
          tile_footer      type string,
          tile_number      type string,
          tile_unit        type string,
          tile_infostate   type string,
          tile_indicator   type string,
          tile_valuecolor  type string,
          tile_value1      type string,
          tile_value2      type string,
          tile_value3      type string,
          tile_disp_value1 type string,
          tile_disp_value2 type string,
          tile_disp_value3 type string,
          tile_color1      type string,
          tile_color2      type string,
          tile_color3      type string,
          tile_title1      type string,
          tile_title2      type string,
          tile_title3      type string,
          tile_scale       type string,
          tile_details     type string,
          tile_sidetitle1  type string,
          tile_sidenumber1 type string,
          tile_sideunit1   type string,
          tile_sidetitle2  type string,
          tile_sidenumber2 type string,
          tile_sideunit2   type string,
    end of ty_menu.

  data gv_menu type ty_menu.
protected section.
private section.

  methods GET_DATA_NUMBER
    importing
      !SERVER type ref to /NEPTUNE/CL_NAD_SERVER .
  methods GET_DATA_BULLET
    importing
      !SERVER type ref to /NEPTUNE/CL_NAD_SERVER .
  methods GET_DATA_COMPARISON
    importing
      !SERVER type ref to /NEPTUNE/CL_NAD_SERVER .
  methods GET_DATA_COLUMN
    importing
      !SERVER type ref to /NEPTUNE/CL_NAD_SERVER .
  methods GET_DATA_DELTA
    importing
      !SERVER type ref to /NEPTUNE/CL_NAD_SERVER .
  methods GET_DATA_HARVEY
    importing
      !SERVER type ref to /NEPTUNE/CL_NAD_SERVER .
  methods GET_DATA_RADIAL
    importing
      !SERVER type ref to /NEPTUNE/CL_NAD_SERVER .
  methods GET_DATA_RANDOM
    changing
      !WA_MENU type /NEPTUNE/MENU .
ENDCLASS.



CLASS YCL_RT23_SN_DYNAMIC_TILE IMPLEMENTATION.


method /neptune/if_nad_server~handle_on_ajax.


  case ajax_id.

    when 'TILE_NUMBER'.
      call method get_data_number( server ).

    when 'TILE_BULLET'.
      call method get_data_bullet( server ).

    when 'TILE_COMPARISON'.
      call method get_data_comparison( server ).

    when 'TILE_COLUMN'.
      call method get_data_column( server ).

    when 'TILE_DELTA'.
      call method get_data_delta( server ).

    when 'TILE_HARVEY'.
      call method get_data_harvey( server ).

    when 'TILE_RADIAL'.
      call method get_data_radial( server ).

  endcase.


endmethod.


method get_data_bullet.

data: lv_menu type /neptune/menu.


* Get Random Data
  call method get_data_random
      changing
         wa_menu = lv_menu.

  move-corresponding lv_menu to gv_menu.

* Set Data
  call method server->api_tile_info
     exporting
       number      = '120'
       title1      = 'ActualValueLabel'
       value1      = gv_menu-tile_value1
       value2      = gv_menu-tile_value2
       value3      = gv_menu-tile_value3
       color1      = gv_menu-tile_color1
       color2      = gv_menu-tile_color2
       color3      = gv_menu-tile_color3
       valuecolor  = gv_menu-tile_valuecolor.


endmethod.


method get_data_column.

  data: lv_menu type /neptune/menu.

  "Get Random Data
  call method get_data_random
    changing
      wa_menu = lv_menu.

  move-corresponding lv_menu to gv_menu.

  "Set Data
  server->api_tile_info(
    exporting
      value1      = gv_menu-tile_value1
      value2      = gv_menu-tile_value2
      value3      = gv_menu-tile_value3
      color1      = gv_menu-tile_color1
      color2      = gv_menu-tile_color2
      color3      = gv_menu-tile_color3
    ).

endmethod.


method get_data_comparison.

  data lv_menu type /neptune/menu.

  me->get_data_random(
    changing
      wa_menu = lv_menu
  ).

  move-corresponding lv_menu to gv_menu.

  concatenate gv_menu-tile_value1 '%' into gv_menu-tile_disp_value1.
  concatenate gv_menu-tile_value2 '%' into gv_menu-tile_disp_value2.
  concatenate gv_menu-tile_value3 '%' into gv_menu-tile_disp_value3.

  server->api_tile_info(
    exporting
      title1         = 'Europe'
      title2         = 'USA'
      title3         = 'Asia'
      value1         = gv_menu-tile_value1
      value2         = gv_menu-tile_value2
      value3         = gv_menu-tile_value3
      display_value1 = gv_menu-tile_disp_value1
      display_value2 = gv_menu-tile_disp_value2
      display_value3 = gv_menu-tile_disp_value3
      color1         = gv_menu-tile_color1
      color2         = gv_menu-tile_color2
      color3         = gv_menu-tile_color3
  ).

endmethod.


method get_data_delta.

  data lv_menu type /neptune/menu.

  me->get_data_random(
    changing
      wa_menu = lv_menu
  ).

  move-corresponding lv_menu to gv_menu.

  concatenate gv_menu-tile_value1 'NOK' into gv_menu-tile_disp_value1 separated by space.
  concatenate gv_menu-tile_value2 'NOK' into gv_menu-tile_disp_value2 separated by space.
  concatenate gv_menu-tile_value3 'NOK' into gv_menu-tile_disp_value3 separated by space.

  server->api_tile_info(
    exporting
      title1         = 'Europe'
      title2         = 'USA'
      value1         = gv_menu-tile_value1
      value2         = gv_menu-tile_value2
      value3         = gv_menu-tile_value3
      display_value1 = gv_menu-tile_disp_value1
      display_value2 = gv_menu-tile_disp_value2
      display_value3 = gv_menu-tile_disp_value3
      color1         = gv_menu-tile_color1
  ).

endmethod.


method get_data_harvey.

data: lv_menu type /neptune/menu.


* Get Random Data
  call method get_data_random
      changing
         wa_menu = lv_menu.

  move-corresponding lv_menu to gv_menu.

* Set Data
  call method server->api_tile_info
     exporting
       title1      = 'Sales'
       title3      = 'EUR'
       value1      = '120'
       value2      = gv_menu-tile_value2
       value3      = gv_menu-tile_value3
       color2      = gv_menu-tile_color2.


endmethod.


method get_data_number.

  data lv_menu type /neptune/menu.
  data lv_time type string.
  data lv_info type string.
  data lv_title type string.
  data lv_footer type string.

  call method get_data_random
    changing
      wa_menu = lv_menu.

  move-corresponding lv_menu to gv_menu.

  server->api_tile_info(
    exporting
      title                  = gv_menu-tile_title
      info                   = gv_menu-tile_info
      footer                 = gv_menu-tile_footer
      number                 = gv_menu-tile_number
      indicator              = gv_menu-tile_indicator
      valuecolor             = gv_menu-tile_valuecolor
      scale                  = gv_menu-tile_scale
      details                = gv_menu-tile_details
      side_indicator_title1  = gv_menu-tile_sidetitle1
      side_indicator_number1 = gv_menu-tile_sidenumber1
      side_indicator_unit1   = gv_menu-tile_sideunit1
      side_indicator_title2  = gv_menu-tile_sidetitle2
      side_indicator_number2 = gv_menu-tile_sidenumber2
      side_indicator_unit2   = gv_menu-tile_sideunit2
  ).

endmethod.


method get_data_radial.

data: lv_menu type /neptune/menu.


* Get Random Data
  call method get_data_random
      changing
         wa_menu = lv_menu.

  move-corresponding lv_menu to gv_menu.

* Set Data
  call method server->api_tile_info
     exporting
       value1      = gv_menu-tile_value1
       color1      = gv_menu-tile_color1.


endmethod.


method get_data_random.

  data lv_prng_int type ref to cl_abap_random_int.
  data lv_prng_float type ref to cl_abap_random_float.
  data lv_float type f.
  data lv_dec type dec23_2.

  data lv_seed type i.
  data lv_now type tzntstmpl.
  data lv_random_number type i.
  data lv_random1 type i.
  data lv_random2 type i.
  data lv_random3 type i.
  data lv_random4 type i.
  data lv_random5 type i.

  "Crate random numbers
  get time stamp field lv_now.
  lv_seed = frac( lv_now ) * 10000.

  "Number
  lv_prng_int = cl_abap_random_int=>create( seed = lv_seed min = -1000 max = 1000 ).
  lv_random_number = lv_prng_int->get_next( ).
  wa_menu-tile_number = lv_random_number.

  call function 'CLOI_PUT_SIGN_IN_FRONT'
    changing
      value = wa_menu-tile_number.

  if lv_random_number ge 300.
    wa_menu-tile_valuecolor = 'Good'.
    wa_menu-tile_indicator = 'Up'.
  elseif lv_random_number ge 100.
    wa_menu-tile_valuecolor = 'Neutral'.
    wa_menu-tile_indicator = 'None'.
  elseif lv_random_number ge -300.
    wa_menu-tile_valuecolor = 'Critical'.
    wa_menu-tile_indicator = 'Down'.
  else.
    wa_menu-tile_valuecolor = 'Error'.
    wa_menu-tile_indicator = 'Down'.
  endif.

  lv_prng_float = cl_abap_random_float=>create( ). "seed = lv_seed min = 0 max = 100 ).

  lv_float = lv_prng_float->get_next( ).
  lv_dec = 100 * lv_float.
  wa_menu-tile_value1 = lv_dec.

  lv_float = lv_prng_float->get_next( ).
  lv_dec = 100 * lv_float.
  wa_menu-tile_value2 = lv_dec.

  lv_float = lv_prng_float->get_next( ).
  lv_dec = 100 * lv_float.
  wa_menu-tile_value3 = lv_dec.

*  wa_menu-tile_value2      = lv_prng_float->get_next( ).
*  wa_menu-tile_value3      = lv_prng_float->get_next( ).
  condense wa_menu-tile_value1.
  condense wa_menu-tile_value2.
  condense wa_menu-tile_value3.

  wa_menu-tile_sidenumber1 = lv_prng_float->get_next( ).
  wa_menu-tile_sidenumber2 = lv_prng_float->get_next( ).
  "Color1
  lv_prng_int    = cl_abap_random_int=>create( seed = lv_seed min = 0 max = 3 ).
  lv_random1 = lv_prng_int->get_next( ).
  lv_random2 = lv_prng_int->get_next( ).
  lv_random3 = lv_prng_int->get_next( ).
  lv_random4 = lv_prng_int->get_next( ).

  case lv_prng_int->get_next( ).
    when '0'.
      wa_menu-tile_sidetitle1 = 'Amount'.
    when '1'.
      wa_menu-tile_sidetitle1 = 'Supply'.
    when '2'.
      wa_menu-tile_sidetitle1 = 'Volume'.
    when '3'.
      wa_menu-tile_sidetitle1 = 'Load'.
  endcase.

  case lv_prng_int->get_next( ).
    when '0'.
      wa_menu-tile_sideunit1 = 'st'.
    when '1'.
      wa_menu-tile_sideunit1 = 'kg'.
    when '2'.
      wa_menu-tile_sideunit1 = 'lbr'.
    when '3'.
      wa_menu-tile_sideunit1 = 'pac'.
  endcase.

  case lv_prng_int->get_next( ).
    when '0'.
      wa_menu-tile_sidetitle2 = 'Target'.
    when '1'.
      wa_menu-tile_sidetitle2 = 'Goal'.
    when '2'.
      wa_menu-tile_sidetitle2 = 'Estimate'.
    when '3'.
      wa_menu-tile_sidetitle2 = 'Valuation'.
  endcase.

  case lv_prng_int->get_next( ).
    when '0'.
      wa_menu-tile_sideunit2 = 'USD'.
    when '1'.
      wa_menu-tile_sideunit2 = 'GBP'.
    when '2'.
      wa_menu-tile_sideunit2 = 'EUR'.
    when '3'.
      wa_menu-tile_sideunit2 = 'CHF'.
  endcase.

  case lv_prng_int->get_next( ).
    when '0'.
      wa_menu-tile_title = 'George Orwell'.
      wa_menu-tile_info = 'Animal Farm'.
    when '1'.
      wa_menu-tile_title = 'Dan Brown'.
      wa_menu-tile_info = 'The Da Vinci Code'.
    when '2'.
      wa_menu-tile_title = 'J.R.R. Tolkien'.
      wa_menu-tile_info = 'The Lord of the Rings'.
    when '3'.
      wa_menu-tile_title = 'Douglas Adams'.
      wa_menu-tile_info = `The Hitchhiker's Guide to the Galaxy`.
  endcase.

  case lv_prng_int->get_next( ).
    when '0'.
      wa_menu-tile_details = 'Those who realize their folly...'.
      wa_menu-tile_footer = '...are not true fools'.
    when '1'.
      wa_menu-tile_details = 'Life can only be understood backwards!'.
      wa_menu-tile_footer = '...but it must be lived forwards'.
    when '2'.
      wa_menu-tile_details = 'Keep your eyes on the stars...'.
      wa_menu-tile_footer = '...and your feet on the ground'.
    when '3'.
      wa_menu-tile_details = 'Meaning is a Jumper...'.
      wa_menu-tile_footer = '...that you have to knit yourself'.
  endcase.

  case lv_prng_int->get_next( ).
    when '0'.
      wa_menu-tile_scale = 'NOK'.
    when '1'.
      wa_menu-tile_scale = 'USD'.
    when '2'.
      wa_menu-tile_scale = 'EURO'.
    when '3'.
      wa_menu-tile_scale = 'YEN'.
  endcase.

  case lv_random1.

    when '0'.
      wa_menu-tile_color1 = 'Neutral'.

    when '1'.
      wa_menu-tile_color1 = 'Error'.

    when '2'.
      wa_menu-tile_color1 = 'Critical'.

    when '3'.
      wa_menu-tile_color1 = 'Good'.

  endcase.

* Color2
  case lv_random2.

    when '0'.
      wa_menu-tile_color2 = 'Neutral'.

    when '1'.
      wa_menu-tile_color2 = 'Error'.

    when '2'.
      wa_menu-tile_color2 = 'Critical'.

    when '3'.
      wa_menu-tile_color2 = 'Good'.

  endcase.

* Color3
  case lv_random3.

    when '0'.
      wa_menu-tile_color3 = 'Neutral'.

    when '1'.
      wa_menu-tile_color3 = 'Error'.

    when '2'.
      wa_menu-tile_color3 = 'Critical'.

    when '3'.
      wa_menu-tile_color3 = 'Good'.

  endcase.

endmethod.
ENDCLASS.
