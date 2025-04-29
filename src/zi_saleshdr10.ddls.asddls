@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales header interface view'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_SalesHdr10
  as select from zsaleshdr10
  composition [0..*] of ZI_SalesItm10 as _SalesItem
{
  key salesorderuuid      as Salesorderuuid,
      salesorder          as Salesorder,
      salesordertype      as Salesordertype,
      description         as Description,
      salesorganization   as Salesorganization,
      soldtoparty         as Soldtoparty,
      status              as status,
      distributionchannel as Distributionchannel,
      documentreason      as Documentreason,
      @Semantics.amount.currencyCode: 'transactioncurrency'
      totalnetamount      as Totalnetamount,
      transactioncurrency as Transactioncurrency,
      @Semantics.user.createdBy: true
      createdbyuser       as Createdbyuser,
      @Semantics.systemDateTime.createdAt: true
      creationat          as Creationat,
      @Semantics.user.lastChangedBy: true
      lastchangedbyuser   as Lastchangedbyuser,
      @Semantics.systemDateTime.lastChangedAt: true
      lastchangedat       as Lastchangedat,
      locallastchangedat  as Locallastchangedat,
       _SalesItem // Make association public
}
