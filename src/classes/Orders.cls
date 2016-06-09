public class Orders extends SObjectDomain {
	
	public Orders(List<Order__c> records){
		super(records);	
	}

	public override void onAfterInsert() {
        FieloAlpha.SObjectService.processRecords((List<Order__c>) Records, null);        
    }

    public override void onAfterUpdate(Map<Id,SObject> existingRecords) {
        FieloAlpha.SObjectService.processRecords((List<Order__c>) Records, existingRecords);
    }

	public class Constructor implements SObjectDomain.IConstructable{
		
		public SObjectDomain construct(List<SObject> sObjectList){
			return new Orders(sObjectList);
		}
	}	
}