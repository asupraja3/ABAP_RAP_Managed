@EndUserText.label: 'Item Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_SalesItm10
 as projection on ZI_SalesItm10 as SalesItem
{
 key Salesitemuuid,
 Salesorderuuid,
 Salesorderitem,
 Salesorderitemcategory,
 Salesorderitemtext,
 Material,
 Plant,
 @Semantics.quantity.unitOfMeasure: 'Orderquantityunit'
 Orderquantity,
 Orderquantityunit,
 @Semantics.amount.currencyCode: 'Transactioncurrency'
 Netamount,
 Transactioncurrency,
 Createdbyuser,
 Creationat,
 Lastchangedbyuser,
 Lastchangedat,
 Locallastchangedat,
 /* Associations */
 _SalesHdr : redirected to parent ZC_SalesHdr10
}
