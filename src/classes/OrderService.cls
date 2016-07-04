global class OrderService{
	webservice static String revertRecord(Id recordId){


		Map<Id, String> results = new FieloAlpha.SObjectService().revertRecords(new Set<Id>{recordId});
		
		if(results != null){
			return results.get(recordId);
		}

		return 'The reversion was succesful.';
	}

	webservice static String reprocessRecord(Id recordId){

		String soql = 'SELECT ';
		for(String fieldName : Schema.getGlobalDescribe().get('Order__c').getDescribe().fields.getMap().keySet()) {
			soql += fieldName + ', ';
		}
		soql = soql.left(soql.lastIndexOf(','));
		soql += ' FROM ' + 'Order__c' + ' WHERE Id = \'' + recordId + '\'' + ' LIMIT 1';
		List<Order__c> sObjectList = (List<Order__c>) Database.query(soql);


		FieloAlpha.SObjectService.processRecords(sObjectList, new Map<Id, Order__c>(sObjectList));

		return 'The record was processed succesfully.';
	}
}