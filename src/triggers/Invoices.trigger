trigger Invoices on Invoice__c (after delete, after insert, after update, before delete, before insert, before update){
   SObjectDomain.triggerHandler(Invoices.class);
}