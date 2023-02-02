class CL_ABAP_TYPEDESCR definition
  public
  abstract
  create public

  global friends CL_ABAP_DATA_TYPE_HANDLE
                 CL_ABAP_REFDESCR .

public section.

  data ABSOLUTE_NAME type ABAP_ABSTYPENAME read-only .
  data DECIMALS type I read-only .
  constants FALSE type ABAP_BOOL value ABAP_FALSE ##NO_TEXT.
  data KIND type ABAP_TYPECATEGORY read-only .
  data LENGTH type I read-only .
  data TYPE_KIND type ABAP_TYPEKIND read-only .
  constants KIND_CLASS type ABAP_TYPECATEGORY value 'C' ##NO_TEXT.
  constants KIND_ELEM type ABAP_TYPECATEGORY value 'E' ##NO_TEXT.
  constants KIND_INTF type ABAP_TYPECATEGORY value 'I' ##NO_TEXT.
  constants KIND_REF type ABAP_TYPECATEGORY value 'R' ##NO_TEXT.
  constants KIND_STRUCT type ABAP_TYPECATEGORY value 'S' ##NO_TEXT.
  constants KIND_TABLE type ABAP_TYPECATEGORY value 'T' ##NO_TEXT.
  constants TRUE type ABAP_BOOL value ABAP_TRUE ##NO_TEXT.
  constants TYPEKIND_ANY type ABAP_TYPEKIND value '~' ##NO_TEXT.
  constants TYPEKIND_CHAR type ABAP_TYPEKIND value 'C' ##NO_TEXT.
  constants TYPEKIND_CLASS type ABAP_TYPEKIND value '*' ##NO_TEXT.
  constants TYPEKIND_CLIKE type ABAP_TYPEKIND value '&' ##NO_TEXT.
  constants TYPEKIND_CSEQUENCE type ABAP_TYPEKIND value '?' ##NO_TEXT.
  constants TYPEKIND_DATA type ABAP_TYPEKIND value '#' ##NO_TEXT.
  constants TYPEKIND_DATE type ABAP_TYPEKIND value 'D' ##NO_TEXT.
  constants TYPEKIND_DECFLOAT type ABAP_TYPEKIND value '/' ##NO_TEXT.
  constants TYPEKIND_DECFLOAT16 type ABAP_TYPEKIND value 'a' ##NO_TEXT.
  constants TYPEKIND_DECFLOAT34 type ABAP_TYPEKIND value 'e' ##NO_TEXT.
  constants TYPEKIND_DREF type ABAP_TYPEKIND value 'l' ##NO_TEXT.
  constants TYPEKIND_FLOAT type ABAP_TYPEKIND value 'F' ##NO_TEXT.
  constants TYPEKIND_HEX type ABAP_TYPEKIND value 'X' ##NO_TEXT.
  constants TYPEKIND_INT type ABAP_TYPEKIND value 'I' ##NO_TEXT.
  constants TYPEKIND_INT1 type ABAP_TYPEKIND value 'b' ##NO_TEXT.
  constants TYPEKIND_INT8 type ABAP_TYPEKIND value '8' ##NO_TEXT.
  constants TYPEKIND_INT2 type ABAP_TYPEKIND value 's' ##NO_TEXT.
  constants TYPEKIND_INTF type ABAP_TYPEKIND value '+' ##NO_TEXT.
  constants TYPEKIND_IREF type ABAP_TYPEKIND value 'm' ##NO_TEXT.
  constants TYPEKIND_NUM type ABAP_TYPEKIND value 'N' ##NO_TEXT.
  constants TYPEKIND_NUMERIC type ABAP_TYPEKIND value '%' ##NO_TEXT.
  constants TYPEKIND_OREF type ABAP_TYPEKIND value 'r' ##NO_TEXT.
  constants TYPEKIND_PACKED type ABAP_TYPEKIND value 'P' ##NO_TEXT.
  constants TYPEKIND_SIMPLE type ABAP_TYPEKIND value '$' ##NO_TEXT.
  constants TYPEKIND_STRING type ABAP_TYPEKIND value 'g' ##NO_TEXT.
  constants TYPEKIND_STRUCT1 type ABAP_TYPEKIND value 'u' ##NO_TEXT.
  constants TYPEKIND_STRUCT2 type ABAP_TYPEKIND value 'v' ##NO_TEXT.
  constants TYPEKIND_TABLE type ABAP_TYPEKIND value 'h' ##NO_TEXT.
  constants TYPEKIND_TIME type ABAP_TYPEKIND value 'T' ##NO_TEXT.
  constants TYPEKIND_W type ABAP_TYPEKIND value 'w' ##NO_TEXT.
  constants TYPEKIND_XSEQUENCE type ABAP_TYPEKIND value '!' ##NO_TEXT.
  constants TYPEKIND_XSTRING type ABAP_TYPEKIND value 'y' ##NO_TEXT.
  constants TYPEKIND_BREF type ABAP_TYPEKIND value 'j' ##NO_TEXT.
  constants TYPEKIND_ENUM type ABAP_TYPEKIND value 'k' ##NO_TEXT.
  constants TYPEPROPKIND_DBMAXLEN type ABAP_TYPEPROPKIND value 'D' ##NO_TEXT.
  constants TYPEPROPKIND_HASCLIENT type ABAP_TYPEPROPKIND value 'C' ##NO_TEXT.
  constants UNDEFINED type ABAP_BOOL value ABAP_UNDEFINED ##NO_TEXT.

  class-methods DESCRIBE_BY_DATA
    importing
      !P_DATA type ANY
    returning
      value(P_DESCR_REF) type ref to CL_ABAP_TYPEDESCR .
  class-methods DESCRIBE_BY_NAME
    importing
      !P_NAME type ANY
    returning
      value(P_DESCR_REF) type ref to CL_ABAP_TYPEDESCR
    exceptions
      TYPE_NOT_FOUND .
  class-methods DESCRIBE_BY_OBJECT_REF
    importing
      !P_OBJECT_REF type ref to OBJECT
    returning
      value(P_DESCR_REF) type ref to CL_ABAP_TYPEDESCR
    exceptions
      REFERENCE_IS_INITIAL .
  class-methods DESCRIBE_BY_DATA_REF
    importing
      !P_DATA_REF type ref to DATA
    returning
      value(P_DESCR_REF) type ref to CL_ABAP_TYPEDESCR
    exceptions
      REFERENCE_IS_INITIAL .
  methods GET_PROPERTY
    importing
      !P_PROPERTY_KIND type ABAP_TYPEPROPKIND
    returning
      value(P_VALUE) type ref to DATA .
  methods GET_RELATIVE_NAME
    returning
      value(P_RELATIVE_NAME) type STRING .
  methods IS_DDIC_TYPE
    returning
      value(P_ABAP_BOOL) type ABAP_BOOL .
  methods GET_DDIC_HEADER
    returning
      value(P_HEADER) type X030L
    exceptions
      NOT_FOUND
      NO_DDIC_TYPE .
  methods GET_DDIC_OBJECT
    returning
      value(P_OBJECT) type DD_X031L_TABLE
    exceptions
      NOT_FOUND
      NO_DDIC_TYPE .
  methods HAS_PROPERTY
    importing
      !P_PROPERTY_KIND type ABAP_TYPEPROPKIND
    returning
      value(P_ABAP_BOOL) type ABAP_BOOL .
  class-methods CLASS_CONSTRUCTOR .
  methods IS_INSTANTIATABLE
  abstract
    returning
      value(P_RESULT) type ABAP_BOOL .
protected section.

  types:
    BEGIN OF XTYPE_TYPE,
      I1 TYPE I,
      I2 TYPE I,
    END   OF XTYPE_TYPE .

  constants KIND_ENUM type ABAP_TYPECATEGORY value 'e' ##NO_TEXT.
  class-data:
    BEGIN OF ADMIN_TAB_LINE,
      XTYPE   TYPE XTYPE_TYPE,
      KIND(1) TYPE C,
      REF   TYPE REF TO CL_ABAP_SOFT_REFERENCE,
    END OF ADMIN_TAB_LINE .
  class-data:
    ADMIN_TAB LIKE HASHED TABLE OF ADMIN_TAB_LINE
                       WITH UNIQUE KEY XTYPE KIND .
  data ME_XTYPE type XTYPE_TYPE .
  class-data RETURNING_REF type ref to CL_ABAP_TYPEDESCR .

  class-events CREATE_ELEMDESCR
    exporting
      value(XTYPE) type XTYPE_TYPE .
  class-events CREATE_STRUCTDESCR
    exporting
      value(XTYPE) type XTYPE_TYPE .
  class-events CREATE_CLASSDESCR
    exporting
      value(XTYPE) type XTYPE_TYPE .
  class-events CREATE_INTFDESCR
    exporting
      value(XTYPE) type XTYPE_TYPE .
  class-events CREATE_TABLEDESCR
    exporting
      value(XTYPE) type XTYPE_TYPE .
  class-events CREATE_REFDESCR
    exporting
      value(XTYPE) type XTYPE_TYPE .
  class-events CREATE_ENUMDESCR
    exporting
      value(XTYPE) type XTYPE_TYPE .

  class-methods GET_BY_XTYPE
    importing
      !P_XTYPE type XTYPE_TYPE
      !P_KIND like KIND
    returning
      value(P_RESULT) type ref to CL_ABAP_TYPEDESCR
    raising
      CX_SY_UNKNOWN_TYPE .
ENDCLASS.
CLASS cl_abap_typedescr IMPLEMENTATION.
  METHOD describe_by_name.
  ENDMETHOD.
  METHOD class_constructor.
  ENDMETHOD.
  METHOD describe_by_data.
  ENDMETHOD.
  METHOD describe_by_object_ref.
  ENDMETHOD.
  METHOD describe_by_data_ref.
  ENDMETHOD.
  METHOD get_property.
  ENDMETHOD.
  METHOD get_ddic_header.
  ENDMETHOD.
  METHOD get_ddic_object.
  ENDMETHOD.
  METHOD get_relative_name.
  ENDMETHOD.
  METHOD is_ddic_type.
  ENDMETHOD.
  METHOD has_property.
  ENDMETHOD.
  METHOD get_by_xtype.
  ENDMETHOD.
ENDCLASS.