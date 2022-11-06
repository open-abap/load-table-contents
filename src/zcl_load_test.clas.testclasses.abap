CLASS ltcl_test DEFINITION FOR TESTING DURATION SHORT RISK LEVEL HARMLESS FINAL.
  PRIVATE SECTION.
    METHODS list FOR TESTING.
ENDCLASS.


CLASS ltcl_test IMPLEMENTATION.

  METHOD list.

    DATA ref TYPE REF TO zcl_load_test.
    CREATE OBJECT ref.

    cl_abap_unit_assert=>assert_equals(
      act = ref->list( )
      exp = 2 ).

  ENDMETHOD.

ENDCLASS.
