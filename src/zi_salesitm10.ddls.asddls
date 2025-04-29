@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales item interface view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_SalesItm10
  as select from zsalesitem10
  association to parent ZI_SalesHdr10 as _SalesHdr on $projection.Salesorderuuid = _SalesHdr.Salesorderuuid
{
  key salesitemuuid          as Salesitemuuid,
      salesorderuuid         as Salesorderuuid,
      salesorderitem         as Salesorderitem,
      salesorderitemcategory as Salesorderitemcategory,
      salesorderitemtext     as Salesorderitemtext,
      material               as Material,
      plant                  as Plant,
      @Semantics.quantity.unitOfMeasure:
      'Orderquantityunit'
      orderquantity          as Orderquantity,
      orderquantityunit      as Orderquantityunit,
      @Semantics.amount.currencyCode:
      'Transactioncurrency'
      netamount              as Netamount,
      transactioncurrency    as Transactioncurrency,
      @Semantics.user.createdBy: true
      createdbyuser          as Createdbyuser,
      @Semantics.systemDateTime.createdAt: true
      creationat             as Creationat,
      @Semantics.user.lastChangedBy: true
      lastchangedbyuser      as Lastchangedbyuser,
      @Semantics.systemDateTime.lastChangedAt: true
      lastchangedat          as Lastchangedat,

      @Semantics.systemDateTime.localInstanceLastChangedAt:
      true
      locallastchangedat     as Locallastchangedat,
      _SalesHdr
}
