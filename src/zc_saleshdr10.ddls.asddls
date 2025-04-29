@EndUserText.label: 'Header Projection view'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZC_SalesHdr10
 as projection on ZI_SalesHdr10 as SalesHdr
{
 key Salesorderuuid,
 @Search.defaultSearchElement: true
 Salesorder,
 Salesordertype,
 Description,
  @Search.defaultSearchElement: true
 Salesorganization,
 @Search.defaultSearchElement: true
 Soldtoparty,
 status,
 Distributionchannel,
 Documentreason,
 @Semantics.amount.currencyCode: 'Transactioncurrency'
 Totalnetamount,
 Transactioncurrency,
 Createdbyuser,
 Creationat,
 Lastchangedbyuser,
 Lastchangedat,
 Locallastchangedat,
 /* Associations */
 _SalesItem : redirected to composition child ZC_SalesItm10
}
