trigger Members on FieloPLT__Member__c (after delete, after insert, after update, before delete, before insert, before update){
   SObjectDomain.triggerHandler(Members.class);
}
