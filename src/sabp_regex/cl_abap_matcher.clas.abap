class CL_ABAP_MATCHER definition
  public
  create public

  global friends CL_ABAP_REGEX .

public section.

  data REGEX type ref to CL_ABAP_REGEX read-only .
  data TABLE type STRING_TABLE read-only .
  data TEXT type STRING read-only .

  type-pools ABAP .
  class-methods CONTAINS
    importing
      !PATTERN type CLIKE
      !TEXT type CLIKE optional
      !TABLE type STANDARD TABLE optional
      value(IGNORE_CASE) type ABAP_BOOL default ABAP_FALSE
      value(SIMPLE_REGEX) type ABAP_BOOL default ABAP_FALSE
      value(NO_SUBMATCHES) type ABAP_BOOL default ABAP_FALSE
    returning
      value(SUCCESS) type ABAP_BOOL
    raising
      CX_SY_MATCHER
      CX_SY_REGEX .
  class-methods CREATE
    importing
      !PATTERN type CLIKE
      !TEXT type CLIKE optional
      !TABLE type STANDARD TABLE optional
      !IGNORE_CASE type ABAP_BOOL default ABAP_FALSE
      !SIMPLE_REGEX type ABAP_BOOL default ABAP_FALSE
      !NO_SUBMATCHES type ABAP_BOOL default ABAP_FALSE
    returning
      value(MATCHER) type ref to CL_ABAP_MATCHER
    raising
      CX_SY_REGEX
      CX_SY_MATCHER .
  class-methods GET_OBJECT
    returning
      value(MATCHER) type ref to CL_ABAP_MATCHER .
  class-methods MATCHES
    importing
      !PATTERN type CLIKE
      !TEXT type CLIKE
      value(IGNORE_CASE) type ABAP_BOOL default ABAP_FALSE
      value(SIMPLE_REGEX) type ABAP_BOOL default ABAP_FALSE
      value(NO_SUBMATCHES) type ABAP_BOOL default ABAP_FALSE
    returning
      value(SUCCESS) type ABAP_BOOL
    raising
      CX_SY_REGEX .
  methods CONSTRUCTOR
    importing
      !REGEX type ref to CL_ABAP_REGEX
      !TEXT type CLIKE optional
      !TABLE type STANDARD TABLE optional
    raising
      CX_SY_MATCHER .
  methods DESTRUCTOR
    not at end of mode .
  methods FIND_ALL
    returning
      value(MATCHES) type MATCH_RESULT_TAB .
  methods FIND_NEXT
    returning
      value(SUCCESS) type ABAP_BOOL .
  methods GET_LENGTH
    importing
      value(INDEX) type I default 0
    returning
      value(LENGTH) type I
    raising
      CX_SY_MATCHER .
  methods GET_LINE
    returning
      value(LINE) type I
    raising
      CX_SY_MATCHER .
  methods GET_MATCH
    returning
      value(MATCH) type MATCH_RESULT
    raising
      CX_SY_MATCHER .
  methods GET_OFFSET
    importing
      value(INDEX) type I default 0
    returning
      value(OFFSET) type I
    raising
      CX_SY_MATCHER .
  methods GET_SUBMATCH
    importing
      value(INDEX) type I
    returning
      value(SUBMATCH) type STRING
    raising
      CX_SY_MATCHER .
  methods MATCH
    returning
      value(SUCCESS) type ABAP_BOOL
    raising
      CX_SY_MATCHER .
  methods REPLACE_ALL
    importing
      !NEWTEXT type CLIKE
    returning
      value(COUNT) type INT4
    raising
      CX_SY_MATCHER .
  methods REPLACE_FOUND
    importing
      !NEWTEXT type CLIKE
    returning
      value(SUCCESS) type ABAP_BOOL
    raising
      CX_SY_MATCHER .
  methods REPLACE_NEXT
    importing
      !NEWTEXT type CLIKE
    returning
      value(SUCCESS) type ABAP_BOOL
    raising
      CX_SY_MATCHER .
protected section.
ENDCLASS.
CLASS cl_abap_matcher IMPLEMENTATION.
  METHOD constructor.
  ENDMETHOD.
  METHOD get_match.
  ENDMETHOD.
  METHOD match.
  ENDMETHOD.
  METHOD get_submatch.
  ENDMETHOD.
  METHOD get_offset.
  ENDMETHOD.
  METHOD get_line.
  ENDMETHOD.
  METHOD create.
  ENDMETHOD.
  METHOD find_all.
  ENDMETHOD.
  METHOD find_next.
  ENDMETHOD.
  METHOD replace_all.
  ENDMETHOD.
  METHOD replace_found.
  ENDMETHOD.
  METHOD get_length.
  ENDMETHOD.
  METHOD replace_next.
  ENDMETHOD.
  METHOD contains.
  ENDMETHOD.
  METHOD get_object.
  ENDMETHOD.
  METHOD destructor.
  ENDMETHOD.
  METHOD matches.
  ENDMETHOD.
ENDCLASS.