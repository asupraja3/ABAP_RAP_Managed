CLASS lhc_salesitem DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS validatePlant FOR VALIDATE ON SAVE
      IMPORTING keys FOR SalesItem~validatePlant.

ENDCLASS.

CLASS lhc_salesitem IMPLEMENTATION.

  METHOD validatePlant.
    READ ENTITIES OF zi_SalesHdr10 IN LOCAL MODE
   ENTITY SalesItem
   FIELDS ( Plant ) WITH CORRESPONDING #( keys )
   RESULT DATA(SalesItems).
    .
    LOOP AT SalesItems INTO DATA(SalesItem).
      IF SalesItem-Plant <> '1001' AND SalesItem-Plant <> '1002'.
        APPEND VALUE #( %tky = salesitem-%tky ) TO
       failed-salesitem.
        APPEND VALUE #( %tky = salesitem-%tky
        %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
        text = 'Plant does not exist'
        ) )
       TO reported-salesitem.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.

CLASS lhc_SalesHdr DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR SalesHdr RESULT result.
    METHODS calcsalesorderid FOR DETERMINE ON SAVE
      IMPORTING keys FOR saleshdr~calcsalesorderid.
    METHODS setstatus FOR MODIFY
      IMPORTING keys FOR ACTION saleshdr~setstatus RESULT result.

ENDCLASS.

CLASS lhc_SalesHdr IMPLEMENTATION.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD calcSalesOrderId.

    READ ENTITIES OF ZI_SalesHdr10 IN LOCAL MODE
    ENTITY SalesHdr
    FIELDS ( Salesorder ) WITH CORRESPONDING #( keys )
    RESULT DATA(Sales).
    DELETE Sales WHERE Salesorder IS NOT INITIAL.
    IF Sales IS NOT INITIAL.
      SELECT SINGLE FROM zsaleshdr10
      FIELDS MAX( salesorder ) AS Salesorderid
      INTO @DATA(max_salesorderid).
      LOOP AT Sales INTO DATA(sale).
        MODIFY ENTITIES OF ZI_SalesHdr10 IN LOCAL MODE
        ENTITY SalesHdr
        UPDATE
        FIELDS ( Salesorder )
        WITH VALUE #( ( %tky = sale-%tky
                        salesorder = max_salesorderid + 1 ) ).
      ENDLOOP.
    ENDIF.

  ENDMETHOD.

  METHOD setStatus.
    MODIFY ENTITIES OF ZI_SalesHdr10 IN LOCAL MODE
    ENTITY SalesHdr
    UPDATE
    FIELDS ( Status )
    WITH VALUE #( FOR key IN keys ( %tky = key-%tky
                                    status = 'A' ) ).

    READ ENTITIES OF ZI_SalesHdr10 IN LOCAL MODE
    ENTITY SalesHdr
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(sales).

    result = VALUE #( FOR sale IN sales ( %tky   = sale-%tky
            %param = sale ) ).
  ENDMETHOD.

ENDCLASS.
