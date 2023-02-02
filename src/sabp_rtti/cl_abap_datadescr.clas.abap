class CL_ABAP_DATADESCR definition
  public
  inheriting from CL_ABAP_TYPEDESCR
  abstract
  create public

  global friends CL_ABAP_REFDESCR
                 CL_ABAP_STRUCTDESCR
                 CL_ABAP_TABLEDESCR .

public section.

  interfaces IF_ABAP_DATA_TYPE_HANDLE .

  type-pools ABAP .
  class-methods IS_READ_ONLY
    importing
      !P_DATA type ref to DATA
    returning
      value(P_FLAG) type ABAP_BOOL .
  methods APPLIES_TO_DATA
    importing
      !P_DATA type DATA
    returning
      value(P_FLAG) type ABAP_BOOL .
  methods APPLIES_TO_DATA_REF
    importing
      !P_DATA type ref to DATA
    returning
      value(P_FLAG) type ABAP_BOOL .
  class-methods GET_DATA_TYPE_KIND
    importing
      !P_DATA type DATA
    returning
      value(P_TYPE_KIND) type ABAP_TYPEKIND .

  methods IS_INSTANTIATABLE
    redefinition .
protected section.
ENDCLASS.
CLASS cl_abap_datadescr IMPLEMENTATION.
  METHOD applies_to_data.
  ENDMETHOD.
  METHOD applies_to_data_ref.
  ENDMETHOD.
  METHOD is_read_only.
  ENDMETHOD.
  METHOD get_data_type_kind.
  ENDMETHOD.
ENDCLASS.