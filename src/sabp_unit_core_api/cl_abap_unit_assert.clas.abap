"! ABAP Unit: Assertions
class cl_Abap_Unit_Assert definition  public  abstract  final  create public
  global friends _If_Aunit_Friend_To_Assert.

  public section.

    "! Default Tolerance for comparison type F
    constants rtol_Default type f value '1.E-14' ##no_Text.

    class-methods:
      "! Abort test execution due to missing context
      "!
      "! @parameter msg    | Description
      "! @parameter detail | Further description
      "! @parameter quit   | Alter control flow/ quit test (METHOD, +++CLASS+++)
      abort
        importing   !msg                    type csequence optional
                    !detail                 type csequence optional
                    !quit                   type aunit_Flowctrl default if_Aunit_Constants=>class
        preferred parameter msg,

      "! Ensure the validity of the reference
      "!
      "! @parameter act              | Reference variable to be checked
      "! @parameter msg              | Description
      "! @parameter level            | Severity (TOLERABLE, CRITICAL, FATAL)
      "! @parameter quit             | Alter control flow/ quit test (NO, +METHOD+, CLASS)
      "! @parameter assertion_Failed | Condition was not met (and QUIT = NO)
      assert_Bound
        importing   !act                    type any
                    !msg                    type csequence optional
                    !level                  type aunit_Level default if_Aunit_Constants=>critical
                    !quit                   type aunit_Flowctrl default if_Aunit_Constants=>method
        returning   value(assertion_Failed) type abap_Bool,

      "! Ensure that character string fits to simple pattern
      "!
      "! @parameter act              | Actual Object
      "! @parameter exp              | Expected Template
      "! @parameter msg              | Message in Case of Error
      "! @parameter level            | Severity (TOLERABLE, CRITICAL, FATAL)
      "! @parameter quit             | Alter control flow/ quit test (NO, +METHOD+, CLASS)
      "! @parameter assertion_Failed | Condition was not met (and QUIT = NO)
      assert_Char_Cp
        importing   !act                    type csequence
                    !exp                    type csequence
                    !msg                    type csequence optional
                    !level                  type aunit_Level default if_Aunit_Constants=>critical
                    !quit                   type aunit_Flowctrl default if_Aunit_Constants=>method
        returning   value(assertion_Failed) type abap_Bool,

      "! Ensure that character string does not fit to simple pattern
      "!
      "! @parameter act              | Actual text which shall not adhere to EXP pattern
      "! @parameter exp              | Simple text pattern
      "! @parameter msg              | Description
      "! @parameter level            | Severity (TOLERABLE, CRITICAL, FATAL)
      "! @parameter quit             | Alter control flow/ quit test (NO, +METHOD+, CLASS)
      "! @parameter assertion_Failed | Condition was not met (and QUIT = NO)
      assert_Char_Np
        importing   !act                    type csequence
                    !exp                    type csequence
                    !msg                    type csequence optional
                    !level                  type aunit_Level default if_Aunit_Constants=>critical
                    !quit                   type aunit_Flowctrl default if_Aunit_Constants=>method
        returning   value(assertion_Failed) type abap_Bool,

      "! Ensure difference between 2 elementary data objects
      "!
      "! @parameter act              | Data object with current value
      "! @parameter exp              | Compare object with unexpected value
      "! @parameter tol              | Tolerance range for floating point comparison
      "! @parameter msg              | Message in case of error
      "! @parameter level            | Severity (TOLERABLE, CRITICAL, FATAL)
      "! @parameter quit             | Alter control flow/ quit test (NO, +METHOD+, CLASS)
      "! @parameter assertion_Failed | Condition was not met (and QUIT = NO)
      assert_Differs
        importing   !act                    type simple
                    !exp                    type simple
                    !tol                    type f optional
                    !msg                    type csequence optional
                    !level                  type aunit_Level default if_Aunit_Constants=>critical
                    !quit                   type aunit_Flowctrl default if_Aunit_Constants=>method
        returning   value(assertion_Failed) type abap_Bool,

      "! Ensure equality of two data objects
      "!
      "! @parameter act                  | Data object with current value
      "! @parameter exp                  | Data object with expected type
      "! @parameter ignore_Hash_Sequence | Ignore sequence in hash tables
      "! @parameter tol                  | Tolerance Range (for directly passed floating numbers)
      "! @parameter msg                  | Description
      "! @parameter level                | Severity (TOLERABLE, CRITICAL, FATAL)
      "! @parameter quit                 | Alter control flow/ quit test (NO, +METHOD+, CLASS)
      "! @parameter assertion_Failed     | Condition was not met (and QUIT = NO)
      assert_Equals
        importing   !act                    type any
                    !exp                    type any
                    !ignore_Hash_Sequence   type abap_Bool default abap_False
                    !tol                    type f optional
                    !msg                    type csequence optional
                    !level                  type aunit_Level default if_Aunit_Constants=>critical
                    !quit                   type aunit_Flowctrl default if_Aunit_Constants=>method
        returning   value(assertion_Failed) type abap_Bool,


      "! Ensure approximate consistency of 2 floating point numbers
      "!
      "! @parameter act              | Data object with current value
      "! @parameter exp              | Data object with expected value
      "! @parameter rtol             | Relative tolerance
      "! @parameter msg              | Description
      "! @parameter level            | Severity (TOLERABLE, CRITICAL, FATAL)
      "! @parameter quit             | Alter control flow/ quit test (NO, +METHOD+, CLASS)
      "! @parameter assertion_Failed | Condition was not met (and QUIT = NO)
      assert_Equals_Float
        importing   !act                    type numeric
                    !exp                    type numeric
                    !rtol                   type numeric default cl_Abap_Unit_Assert=>rtol_Default
                    !msg                    type csequence optional
                    !level                  type aunit_Level default if_Aunit_Constants=>critical
                    !quit                   type aunit_Flowctrl default if_Aunit_Constants=>method
        returning   value(assertion_Failed) type abap_Bool,

      "! Ensure that boolean equals ABAP_FALSE
      "!
      "! @parameter act              | Actual data object
      "! @parameter msg              | Description
      "! @parameter level            | Severity (TOLERABLE, +CRITICAL+, FATAL)
      "! @parameter quit             | Alter control flow/ quit test (NO, +METHOD+, CLASS)
      "! @parameter assertion_Failed | Condition was not met (and QUIT = NO)
      assert_False
        importing   !act                    type abap_Bool
                    !msg                    type csequence optional
                    !level                  type aunit_Level default if_Aunit_Constants=>critical
                    !quit                   type aunit_Flowctrl default if_Aunit_Constants=>method
        returning   value(assertion_Failed) type abap_Bool,

      "! Ensure that data object value is initial
      "!
      "! @parameter act              | Actual data object
      "! @parameter msg              | Description
      "! @parameter level            | Severity (TOLERABLE, +CRITICAL+, FATAL)
      "! @parameter quit             | Alter control flow/ quit test (NO, +METHOD+, CLASS)
      "! @parameter assertion_Failed | Condition was not met (and QUIT = NO)
      assert_Initial
        importing   !act                    type any default sy-subrc
                    !msg                    type csequence optional
                    !level                  type aunit_Level default if_Aunit_Constants=>critical
                    !quit                   type aunit_Flowctrl default if_Aunit_Constants=>method
        preferred parameter act
        returning
                    value(assertion_Failed) type abap_Bool,

      "! Ensure invalidity of the reference of a reference variable
      "!
      "! @parameter act              | Reference variable to be checked
      "! @parameter msg              | Description
      "! @parameter level            | Severity (TOLERABLE, +CRITICAL+, FATAL)
      "! @parameter quit             | Alter control flow/ quit test (NO, +METHOD+, CLASS)
      "! @parameter assertion_Failed | Condition was not met (and QUIT = NO)
      assert_Not_Bound
        importing   !act                    type any
                    !msg                    type csequence optional
                    !level                  type aunit_Level default if_Aunit_Constants=>critical
                    !quit                   type aunit_Flowctrl default if_Aunit_Constants=>method
        returning   value(assertion_Failed) type abap_Bool,

      "! Ensure that value of data object is not initial
      "!
      "! @parameter act              | Actual Data Object
      "! @parameter msg              | Message in Case of Error
      "! @parameter level            | Severity (TOLERABLE, +CRITICAL+, FATAL)
      "! @parameter quit             | Alter control flow/ quit test (NO, +METHOD+, CLASS)
      "! @parameter assertion_Failed | Condition was not met (and QUIT = NO)
      assert_Not_Initial
        importing   !act                    type any
                    !msg                    type csequence optional
                    !level                  type aunit_Level default if_Aunit_Constants=>critical
                    !quit                   type aunit_Flowctrl default if_Aunit_Constants=>method
        returning
                    value(assertion_Failed) type abap_Bool,

      "! Ensure that number is in given range
      "!
      "! @parameter lower            | Upper boundary
      "! @parameter upper            | Lower boundary
      "! @parameter number           | Number expected to be within the boundaries
      "! @parameter msg              | Description
      "! @parameter level            | Alter control flow/ quit test (NO, +METHOD+, CLASS)
      "! @parameter quit             | Control flow in case of failed assertion
      "! @parameter assertion_Failed | Condition was not met (and QUIT = NO)
      assert_Number_Between
        importing   !lower                  type numeric
                    !upper                  type numeric
                    !number                 type numeric
                    !msg                    type csequence optional
                    !level                  type aunit_Level default if_Aunit_Constants=>critical
                    !quit                   type aunit_Flowctrl default if_Aunit_Constants=>method
        returning   value(assertion_Failed) type abap_Bool,

      "! Ensure specific value of return code
      "!
      "! @parameter exp              | Expected return code, optional, if not zero
      "! @parameter act              | Return code of ABAP statements
      "! @parameter msg              | Description
      "! @parameter level            | Severity (TOLERABLE, +CRITICAL+, FATAL)
      "! @parameter quit             | Alter control flow/ quit test (NO, +METHOD+, CLASS)
      "! @parameter symsg            | System message
      "! @parameter assertion_Failed | Condition was not met (and QUIT = NO)
      assert_Subrc
        importing   value(exp)              type sysubrc default 0
                    value(act)              type sysubrc default sy-subrc
                    !msg                    type csequence optional
                    !level                  type aunit_Level default if_Aunit_Constants=>critical
                    !quit                   type aunit_Flowctrl default if_Aunit_Constants=>method
                    !symsg                  type symsg optional
        preferred parameter act
        returning   value(assertion_Failed) type abap_Bool,

      "! Ensure that data is contained as line within internal table
      "!
      "! @parameter line             | Data Object that is typed like line of TABLE
      "! @parameter table            | Internal Table that shall contain LINE
      "! @parameter msg              | Description
      "! @parameter level            | Severity (TOLERABLE, +CRITICAL+, FATAL)
      "! @parameter quit             | Alter control flow/ quit test (NO, +METHOD+, CLASS)
      "! @parameter assertion_Failed | Condition was not met (and QUIT = NO)
      assert_Table_Contains
        importing   !line                   type any
                    !table                  type any table
                    !msg                    type csequence optional
                    !level                  type aunit_Level default if_Aunit_Constants=>critical
                    !quit                   type aunit_Flowctrl default if_Aunit_Constants=>method
        returning   value(assertion_Failed) type abap_Bool,

      "! Ensure that data is not contained as line in internal table
      "!
      "! @parameter line             | Data Object that is typed like line of TABLE
      "! @parameter table            | Internal Table that must not contain LINE
      "! @parameter msg              | Description
      "! @parameter level            | Severity (TOLERABLE, +CRITICAL+, FATAL)
      "! @parameter quit             | Alter control flow/ quit test (NO, +METHOD+, CLASS)
      "! @parameter assertion_Failed | Condition was not met (and QUIT = NO)
      assert_Table_Not_Contains
        importing   !line                   type any
                    !table                  type any table
                    !msg                    type csequence optional
                    !level                  type aunit_Level default if_Aunit_Constants=>critical
                    !quit                   type aunit_Flowctrl default if_Aunit_Constants=>method
        returning   value(assertion_Failed) type abap_Bool,

      "! Ensure that text matches regular expression
      "!
      "! @parameter pattern          | Regular Expression - see also TA ABAPHELP
      "! @parameter text             | Text that is assumed to met the regular expression
      "! @parameter msg              | Description
      "! @parameter level            | Severity (TOLERABLE, +CRITICAL+, FATAL)
      "! @parameter quit             | Alter control flow/ quit test (NO, +METHOD+, CLASS)
      "! @parameter assertion_Failed | Condition was not met (and QUIT = NO)
      assert_Text_Matches
        importing   !pattern                type csequence
                    !text                   type csequence
                    !msg                    type csequence optional
                    !level                  type aunit_Level default if_Aunit_Constants=>critical
                    !quit                   type aunit_Flowctrl default if_Aunit_Constants=>method
        returning   value(assertion_Failed) type abap_Bool,

      "! Ensure that a constraint is met by data object
      "!
      "! @parameter act              | Data object which should adhere to constraint EXP
      "! @parameter exp              | Constraint to which ACT needs to adhere
      "! @parameter msg              | Description
      "! @parameter level            | Severity (TOLERABLE, +CRITICAL+, FATAL)
      "! @parameter quit             | Alter control flow/ quit test (NO, +METHOD+, CLASS)
      "! @parameter assertion_Failed | Condition was not met (and QUIT = NO)
      assert_That
        importing   !act                    type data
                    !exp                    type ref to if_Constraint
                    !msg                    type csequence optional
                    !level                  type aunit_Level default if_Aunit_Constants=>critical
                    !quit                   type aunit_Flowctrl default if_Aunit_Constants=>method
        returning   value(assertion_Failed) type abap_Bool,

      "! Ensure that boolean equals ABAP_TRUE
      "!
      "! @parameter act              | Actual value
      "! @parameter msg              | Description
      "! @parameter level            | Severity (TOLERABLE, +CRITICAL+, FATAL)
      "! @parameter quit             | Alter control flow/ quit test (NO, +METHOD+, CLASS)
      "! @parameter assertion_Failed | Condition was not met (and QUIT = NO)
      assert_True
        importing   !act                    type abap_Bool
                    !msg                    type csequence optional
                    !level                  type aunit_Level default if_Aunit_Constants=>critical
                    !quit                   type aunit_Flowctrl default if_Aunit_Constants=>method
        returning   value(assertion_Failed) type abap_Bool,

      "! Report unconditional assertion
      "!
      "! @parameter msg    | Description
      "! @parameter level  | Severity (TOLERABLE, +CRITICAL+, FATAL)
      "! @parameter quit   | Alter control flow/ quit test (NO, +METHOD+, CLASS)
      "! @parameter detail | Further Description
      fail
        importing   !msg                type csequence optional
                    !level              type aunit_Level default if_Aunit_Constants=>critical
                    !quit               type aunit_Flowctrl default if_Aunit_Constants=>method
                    !detail             type csequence optional
        preferred parameter msg.

      types:        n1                  type n length 1.

ENDCLASS.
CLASS cl_abap_unit_assert IMPLEMENTATION.
  METHOD abort.
  ENDMETHOD.
  METHOD assert_bound.
  ENDMETHOD.
  METHOD assert_char_cp.
  ENDMETHOD.
  METHOD assert_char_np.
  ENDMETHOD.
  METHOD assert_differs.
  ENDMETHOD.
  METHOD assert_equals.
  ENDMETHOD.
  METHOD assert_equals_float.
  ENDMETHOD.
  METHOD assert_initial.
  ENDMETHOD.
  METHOD assert_not_bound.
  ENDMETHOD.
  METHOD assert_not_initial.
  ENDMETHOD.
  METHOD assert_number_between.
  ENDMETHOD.
  METHOD assert_subrc.
  ENDMETHOD.
  METHOD assert_table_contains.
  ENDMETHOD.
  METHOD assert_text_matches.
  ENDMETHOD.
  METHOD assert_that.
  ENDMETHOD.
  METHOD fail.
  ENDMETHOD.
  METHOD assert_false.
  ENDMETHOD.
  METHOD assert_table_not_contains.
  ENDMETHOD.
  METHOD assert_true.
  ENDMETHOD.
ENDCLASS.