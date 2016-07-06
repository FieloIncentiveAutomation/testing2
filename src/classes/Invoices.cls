public class Invoices extends SObjectDomain {
    
    public Invoices(List<Invoice__c> records){
        super(records); 
    }

    public override void onAfterInsert() {
        FieloAlpha.SObjectService.processRecords((List<Invoice__c>) Records, null);        
    }

    public override void onAfterUpdate(Map<Id,SObject> existingRecords) {
        FieloAlpha.SObjectService.processRecords((List<Invoice__c>) Records, existingRecords);
    }

    public class Constructor implements SObjectDomain.IConstructable{
        
        public SObjectDomain construct(List<SObject> sObjectList){
            return new Orders(sObjectList);
        }
    }   
}