class ZCL_DANIEL_TESTCLASS definition
  public
  final
  create public .

public section.

  interfaces /NEPTUNE/IF_RESTAPI .

  data:
    gt_ekko TYPE TABLE OF ekko .
  data GS_EKKO type EKKO .

  methods GET_EKKO .
protected section.
private section.
ENDCLASS.



CLASS ZCL_DANIEL_TESTCLASS IMPLEMENTATION.


  METHOD get_ekko.

    SELECT * FROM ekko INTO CORRESPONDING FIELDS OF TABLE gt_ekko UP TO 10 ROWS.

  ENDMETHOD.
ENDCLASS.
