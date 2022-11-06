CLASS zcl_load_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS list
      RETURNING
        VALUE(count) TYPE i .
    CLASS-METHODS load
      RAISING zcx_abapgit_exception.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LOAD_TEST IMPLEMENTATION.


  METHOD list.

    DATA tab TYPE STANDARD TABLE OF zload WITH DEFAULT KEY.

    SELECT * FROM zload INTO TABLE tab.

    count = lines( tab ).

  ENDMETHOD.


  METHOD load.

    DATA lt_files TYPE zif_abapgit_definitions=>ty_files_tt.
    DATA ls_file LIKE LINE OF lt_files.
    DATA li_config TYPE REF TO zif_abapgit_data_config.
    DATA li_deser TYPE REF TO zif_abapgit_data_deserializer.
    DATA lt_result TYPE zif_abapgit_data_deserializer=>ty_results.

* only run in transpiler
    ASSERT sy-sysid = 'ABC'.

    ls_file-path     = zif_abapgit_data_config=>c_default_path.
    ls_file-filename = 'todo'.
    ls_file-data     = 'FFAA11'.
    APPEND ls_file TO lt_files.

* todo, replace with factory call, https://github.com/abapGit/abapGit/pull/5858
    CREATE OBJECT li_config TYPE zcl_abapgit_data_config.
    li_config->from_json( lt_files ).

    li_deser = zcl_abapgit_data_factory=>get_deserializer( ).
    lt_result = li_deser->deserialize(
      ii_config = li_config
      it_files  = lt_files ).
    li_deser->actualize( lt_result ).
  ENDMETHOD.
ENDCLASS.
