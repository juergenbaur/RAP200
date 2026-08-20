CLASS zrap200_generate_demo_data_JU2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zrap200_generate_demo_data_ju2 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA travel_data  TYPE TABLE OF ztravelju2.
    DATA booking_data TYPE TABLE OF zbookingju2.

    " delete existing entries in the active database tables
    DELETE FROM ztravelju2.
    DELETE FROM zbookingju2.

    " delete existing entries in the draft database tables
    DELETE FROM ztravel_dju2.
    DELETE FROM zbooking_dju2.

    COMMIT WORK.

    SELECT * FROM /dmo/travel
      INTO CORRESPONDING FIELDS OF TABLE @travel_data
      UP TO 100 ROWS.

    LOOP AT travel_data ASSIGNING FIELD-SYMBOL(<ls_travel>).
      <ls_travel>-uuid = xco_cp=>uuid( )->value.
      CASE <ls_travel>-status.
        WHEN 'P'.
          <ls_travel>-status = 'N'.
        WHEN 'B'.
          <ls_travel>-review_status = zrap200_if_travelju2=>review_status-booked.
          <ls_travel>-notification  = 'Travel manually successfully booked'.
        WHEN 'X'.
          <ls_travel>-review_status = zrap200_if_travelju2=>review_status-cancelled.
          <ls_travel>-notification  = 'Travel manually cancelled'.
      ENDCASE.

    ENDLOOP.

    " insert travel demo data
    MODIFY ztravelju2 FROM TABLE @travel_data.
    COMMIT WORK.

    SELECT * FROM /dmo/booking AS booking
             JOIN ztravelju2 AS z ON booking~travel_id = z~travel_id
             INTO CORRESPONDING FIELDS OF TABLE @booking_data.

    LOOP AT booking_data ASSIGNING FIELD-SYMBOL(<ls_booking>).
      <ls_booking>-uuid = xco_cp=>uuid( )->value.
    ENDLOOP.

    MODIFY zbookingju2 FROM TABLE @booking_data.
    COMMIT WORK.

    out->write(
        | ✅ [RAP200 (t:{ cl_abap_context_info=>get_system_time( ) })] Travel and booking demo data successfully inserted.| ).
  ENDMETHOD.

ENDCLASS.
