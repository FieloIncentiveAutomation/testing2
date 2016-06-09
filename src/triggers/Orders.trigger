trigger Orders on Order__c (after delete, after insert, after update, before delete, before insert, before update){
   SObjectDomain.triggerHandler(Orders.class);
}