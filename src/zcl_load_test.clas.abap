class ZCL_LOAD_TEST definition
  public
  final
  create public .

public section.

  methods LIST
    returning
      value(COUNT) type I .
protected section.
private section.
ENDCLASS.



CLASS ZCL_LOAD_TEST IMPLEMENTATION.


  METHOD list.

    DATA tab TYPE STANDARD TABLE OF zload WITH DEFAULT KEY.

    SELECT * FROM zload INTO TABLE tab.

    count = lines( tab ).

  ENDMETHOD.
ENDCLASS.
