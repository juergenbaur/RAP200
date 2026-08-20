@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@EndUserText.label: 'Draft query view for ZBOOKING_DJU2'
define root view entity ZR_BOOKING_QUERYju2
  as select from zbooking_dju2
{
  key uuid as UUID,
  parentuuid as ParentUUID,
  bookingid as BookingID,
  bookingdate as BookingDate,
  customerid as CustomerID,
  carrierid as CarrierID,
  connectionid as ConnectionID,
  flightdate as FlightDate,
  flightprice as FlightPrice,
  currencycode as CurrencyCode,
  draftentitycreationdatetime as draftentitycreationdatetime,
  draftentitylastchangedatetime as draftentitylastchangedatetime,
  draftadministrativedatauuid as draftadministrativedatauuid,
  draftentityoperationcode as draftentityoperationcode,
  hasactiveentity as hasactiveentity,
  draftfieldchanges as draftfieldchanges
}
