@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@ObjectModel.semanticKey: [ 'BookingID' ]
define view entity ZR_BOOKINGJU2
  as select from ZBOOKINGJU2 as Booking
  association to parent ZR_TRAVELJU2 as _Travel on $projection.ParentUuid = _Travel.Uuid
{
  key uuid as UUID,
  parent_uuid as ParentUUID,
  booking_id as BookingID,
  booking_date as BookingDate,
  customer_id as CustomerID,
  carrier_id as CarrierID,
  connection_id as ConnectionID,
  flight_date as FlightDate,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  flight_price as FlightPrice,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_CurrencyStdVH', 
    entity.element: 'Currency', 
    useForValidation: true
  } ]
  currency_code as CurrencyCode,
  _Travel
}
