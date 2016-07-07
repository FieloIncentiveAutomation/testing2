public class Members extends SObjectDomain {

	public Members(List<FieloAlpha__Member__c> records){
        super(records); 
    }
	
	public override void onAfterUpdate(Map<Id,SObject> existingRecords) {
		Map<Id, FieloAlpha__Member__c> recordsMap = new Map<Id, FieloAlpha__Member__c>();
		for(FieloAlpha__Member__c record : (List<FieloAlpha__Member__c>) records){
			recordsMap.put(record.Id, record);
			//si ahora el registro tiene User, cambio el Owner de las Invoices que lo tengan como Contractor
			Set<Id> contractorsIds = new Set<Id>();
			if(record.FieloAlpha__User__c != null && record.FieloAlpha__User__c != ((FieloAlpha__Member__c)existingRecords.get(record.Id)).FieloAlpha__User__c){
				contractorsIds.add(record.Id);
			}

			List<Invoice__c> invoicesToUpdateOwner = [SELECT Contractor__c FROM Invoice__c WHERE Contractor__c IN : contractorsIds];
			for(Invoice__c i : invoicesToUpdateOwner){
				i.OwnerId = recordsMap.get(i.Contractor__c).FieloAlpha__User__c;
			}
			update invoicesToUpdateOwner;
		}
	}

	public class Constructor implements SObjectDomain.IConstructable{
		
		public SObjectDomain construct(List<SObject> sObjectList){
			return new Members(sObjectList);
		}
	}	
}