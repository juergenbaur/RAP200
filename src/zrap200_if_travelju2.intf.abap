INTERFACE zrap200_if_travelJU2
  PUBLIC .
  CONSTANTS:
    BEGIN OF travel_status,       "/dmo/travel_status
      new       TYPE c LENGTH 1 VALUE 'N', "New / 0
      booked    TYPE c LENGTH 1 VALUE 'B', "Booked / 1
      planned   TYPE c LENGTH 1 VALUE 'P', "Planned / 2
      cancelled TYPE c LENGTH 1 VALUE 'X', "Cancelled / 3
    END OF travel_status,

    BEGIN OF review_status,
      new       TYPE int1 VALUE 0, "(N) New
      cancelled TYPE int1 VALUE 1, "(C) cancelled
      planned   TYPE int1 VALUE 2, "(P) planned
      booked    TYPE int1 VALUE 3, "(B) booked
    END OF review_status,

    BEGIN OF review_notification,
      new       TYPE string VALUE ' ', "N/New, neutral
      cancelled TYPE string VALUE 'Review WF cancellation for', "(X)cancelled / 3:red
      planned   TYPE string VALUE 'Sent to review WF...', "(P) planned / 2:yellow
      booked    TYPE string VALUE 'Review WF successfully processed', "(B) booked / 1:green
    END OF review_notification.

ENDINTERFACE.
