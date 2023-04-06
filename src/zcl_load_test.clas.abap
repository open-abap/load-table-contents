CLASS zcl_load_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS list
      RETURNING
        VALUE(count) TYPE i .
    CLASS-METHODS load
      RETURNING VALUE(rt_result) TYPE zif_abapgit_data_deserializer=>ty_results
      RAISING   zcx_abapgit_exception.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_load_test IMPLEMENTATION.


  METHOD list.

    DATA tab TYPE STANDARD TABLE OF zload WITH DEFAULT KEY.

    SELECT * FROM zload INTO TABLE tab.

    count = lines( tab ).

  ENDMETHOD.


  METHOD load.

    DATA lt_files  TYPE zif_abapgit_git_definitions=>ty_files_tt.
    DATA ls_file   LIKE LINE OF lt_files.
    DATA lv_name   TYPE string.
    DATA lv_hex    TYPE xstring.
    DATA li_config TYPE REF TO zif_abapgit_data_config.
    DATA li_deser  TYPE REF TO zif_abapgit_data_deserializer.
    DATA ls_checks TYPE zif_abapgit_definitions=>ty_deserialize_checks.

* only run in transpiler
    ASSERT sy-sysid = 'ABC'.

* todo, refactor to use https://github.com/open-abap/open-abap-fs
    WRITE '@KERNEL const fs = await import("fs");'.
    WRITE '@KERNEL for (const name of fs.readdirSync("./data/")) {'.
    WRITE '@KERNEL lv_name.set(name);'.
    WRITE '@KERNEL lv_hex.set(fs.readFileSync("./data/" + name).toString("hex").toUpperCase());'.
    ls_file-path     = zif_abapgit_data_config=>c_default_path.
    ls_file-filename = lv_name.
    ls_file-data     = lv_hex.
    APPEND ls_file TO lt_files.
    WRITE '@KERNEL }'.

* todo, replace with factory call, https://github.com/abapGit/abapGit/pull/5858
    CREATE OBJECT li_config TYPE zcl_abapgit_data_config.
    li_config->from_json( lt_files ).

    li_deser = zcl_abapgit_data_factory=>get_deserializer( ).

    rt_result = li_deser->deserialize(
      ii_config = li_config
      it_files  = lt_files ).

    li_deser->actualize(
      is_checks = ls_checks
      it_result = rt_result ).
  ENDMETHOD.
ENDCLASS.
