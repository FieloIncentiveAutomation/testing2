public class Invoices extends SObjectDomain {
    
    public Invoices(List<Invoice__c> records){
        super(records); 
    }

    public override void onBeforeInsert() {
        //tengo que poner como owner de la Invoice que se inserta el usuario relacionado a 
        //primero itero para buscar el member
       Set<Id> contractorsIds = new Set<Id>();
        for(Invoice__c record : (List<Invoice__c>) records){
            contractorsIds.add(record.Contractor__c);
        }

        Map<Id, FieloPLT__Member__c> contractorsMap = new Map<Id, FieloPLT__Member__c>([SELECT FieloPLT__User__c FROM FieloPLT__Member__c WHERE FieloPLT__User__c != null AND Id IN : contractorsIds]);

        for(Invoice__c record : (List<Invoice__c>) records){
            if(contractorsMap.containsKey(record.Contractor__c)){
                record.OwnerId = contractorsMap.get(record.Contractor__c).FieloPLT__User__c;
            }
        }        

    }

    public override void onAfterInsert() {
        FieloPLT.SObjectService.processRecords((List<Invoice__c>) Records, null);        
    }

    public override void onAfterUpdate(Map<Id,SObject> existingRecords) {
        FieloPLT.SObjectService.processRecords((List<Invoice__c>) Records, existingRecords);
    }

    public class Constructor implements SObjectDomain.IConstructable{
        
        public SObjectDomain construct(List<SObject> sObjectList){
            return new Invoices(sObjectList);
        }
    }   
}
