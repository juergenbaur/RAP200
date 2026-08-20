@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@EndUserText.label: 'Draft query view for ZTRAVEL_DJU2'
define root view entity ZR_TRAVEL_QUERYju2
  as select from ZTRAVEL_DJU2
{
  key uuid as UUID,
  travelid as TravelID,
  agencyid as AgencyID,
  customerid as CustomerID,
  begindate as BeginDate,
  enddate as EndDate,
  bookingfee as BookingFee,
  totalprice as TotalPrice,
  currencycode as CurrencyCode,
  description as Description,
  status as Status,
  reviewstatus as ReviewStatus,
  notification as Notification,
  localcreatedby as LocalCreatedBy,
  localcreatedat as LocalCreatedAt,
  locallastchangedby as LocalLastChangedBy,
  locallastchangedat as LocalLastChangedAt,
  lastchangedat as LastChangedAt,
  draftentitycreationdatetime as draftentitycreationdatetime,
  draftentitylastchangedatetime as draftentitylastchangedatetime,
  draftadministrativedatauuid as draftadministrativedatauuid,
  draftentityoperationcode as draftentityoperationcode,
  hasactiveentity as hasactiveentity,
  draftfieldchanges as draftfieldchanges
}
