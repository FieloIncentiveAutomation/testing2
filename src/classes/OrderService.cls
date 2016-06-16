global class OrderService{
	webservice static String revertRecord(Id recordId){


		Map<Id, String> results = new FieloAlpha.SObjectService().revertRecords(new Set<Id>{recordId});
		
		if(results != null){
			return results.get(recordId);
		}

		return 'The reversion was succesful.';
	}
}