class ZCL_IDOC_MONITOR_AFC definition
  public
  final
  create public .

public section.

  interfaces /NEPTUNE/IF_RESTAPI .

*"       IMPORTING
*"             VALUE(DOCUMENT_NUMBER) LIKE  EDIDC-DOCNUM
*"       EXPORTING
*"             VALUE(IDOC_CONTROL) LIKE  EDIDC STRUCTURE  EDIDC
*"             VALUE(NUMBER_OF_DATA_RECORDS) LIKE  SY-DBCNT
*"             VALUE(NUMBER_OF_STATUS_RECORDS) LIKE  SY-DBCNT
*"       TABLES
*"              INT_EDIDS STRUCTURE  EDIDS OPTIONAL
*"              INT_EDIDD STRUCTURE  EDIDD OPTIONAL
  data GV_DOCNUM type EDIDC-DOCNUM .
  data:
    mt_edids TYPE STANDARD TABLE OF edids .
  data:
    mt_Edidd TYPE STANDARD TABLE OF edidd .

  methods GET_IDOC .
protected section.
private section.
ENDCLASS.



CLASS ZCL_IDOC_MONITOR_AFC IMPLEMENTATION.


  method GET_IDOC.

*"       IMPORTING
*"             VALUE(DOCUMENT_NUMBER) LIKE  EDIDC-DOCNUM
*"       EXPORTING
*"             VALUE(IDOC_CONTROL) LIKE  EDIDC STRUCTURE  EDIDC
*"             VALUE(NUMBER_OF_DATA_RECORDS) LIKE  SY-DBCNT
*"             VALUE(NUMBER_OF_STATUS_RECORDS) LIKE  SY-DBCNT
*"       TABLES
*"              INT_EDIDS STRUCTURE  EDIDS OPTIONAL
*"              INT_EDIDD STRUCTURE  EDIDD OPTIONAL


gv_docnum = '0000000000005001'.

CALL FUNCTION 'IDOC_READ_COMPLETELY'
  EXPORTING
    document_number                = gv_docnum
* IMPORTING
*   IDOC_CONTROL                   =
*   NUMBER_OF_DATA_RECORDS         =
*   NUMBER_OF_STATUS_RECORDS       =
 TABLES
   INT_EDIDS                      = mt_edids
   INT_EDIDD                      = mt_edidd
 EXCEPTIONS
   DOCUMENT_NOT_EXIST             = 1
   DOCUMENT_NUMBER_INVALID        = 2
   OTHERS                         = 3
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.

  endmethod.
ENDCLASS.
