CLASS zcl_abapgit_user_exit DEFINITION PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES zif_abapgit_exit.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_abapgit_user_exit IMPLEMENTATION.

  METHOD zif_abapgit_exit~adjust_display_commit_url.
    RETURN. " todo, implement method
  ENDMETHOD.

  METHOD zif_abapgit_exit~adjust_display_filename.
    RETURN. " todo, implement method
  ENDMETHOD.

  METHOD zif_abapgit_exit~allow_sap_objects.
    RETURN. " todo, implement method
  ENDMETHOD.

  METHOD zif_abapgit_exit~change_local_host.
    RETURN. " todo, implement method
  ENDMETHOD.

  METHOD zif_abapgit_exit~change_max_parallel_processes.
    RETURN. " todo, implement method
  ENDMETHOD.

  METHOD zif_abapgit_exit~enhance_repo_toolbar.
    RETURN. " todo, implement method
  ENDMETHOD.

  METHOD zif_abapgit_exit~change_proxy_authentication.
    RETURN. " todo, implement method
  ENDMETHOD.

  METHOD zif_abapgit_exit~change_proxy_port.
    RETURN. " todo, implement method
  ENDMETHOD.
  METHOD zif_abapgit_exit~change_proxy_url.
    RETURN. " todo, implement method
  ENDMETHOD.

  METHOD zif_abapgit_exit~change_rfc_server_group.
    RETURN. " todo, implement method
  ENDMETHOD.

  METHOD zif_abapgit_exit~change_supported_data_objects.
    DATA ls_row LIKE LINE OF ct_objects.
    CLEAR ct_objects.
    ls_row-type = 'TABU'.
    ls_row-name = '*'.
    INSERT ls_row INTO TABLE ct_objects.
  ENDMETHOD.

  METHOD zif_abapgit_exit~change_supported_object_types.
    RETURN. " todo, implement method
  ENDMETHOD.

  METHOD zif_abapgit_exit~change_tadir.
    RETURN. " todo, implement method
  ENDMETHOD.

  METHOD zif_abapgit_exit~create_http_client.
    RETURN. " todo, implement method
  ENDMETHOD.

  METHOD zif_abapgit_exit~custom_serialize_abap_clif.
    RETURN. " todo, implement method
  ENDMETHOD.

  METHOD zif_abapgit_exit~deserialize_postprocess.
    RETURN. " todo, implement method
  ENDMETHOD.

  METHOD zif_abapgit_exit~determine_transport_request.
    RETURN. " todo, implement method
  ENDMETHOD.

  METHOD zif_abapgit_exit~get_ci_tests.
    RETURN. " todo, implement method
  ENDMETHOD.

  METHOD zif_abapgit_exit~get_ssl_id.
    RETURN. " todo, implement method
  ENDMETHOD.

  METHOD zif_abapgit_exit~http_client.
    RETURN. " todo, implement method
  ENDMETHOD.

  METHOD zif_abapgit_exit~on_event.
    RETURN. " todo, implement method
  ENDMETHOD.

  METHOD zif_abapgit_exit~pre_calculate_repo_status.
    RETURN. " todo, implement method
  ENDMETHOD.

  METHOD zif_abapgit_exit~serialize_postprocess.
    RETURN. " todo, implement method
  ENDMETHOD.

  METHOD zif_abapgit_exit~validate_before_push.
    RETURN. " todo, implement method
  ENDMETHOD.

  METHOD zif_abapgit_exit~wall_message_list.
    RETURN. " todo, implement method
  ENDMETHOD.

  METHOD zif_abapgit_exit~wall_message_repo.
    RETURN. " todo, implement method
  ENDMETHOD.

ENDCLASS.
