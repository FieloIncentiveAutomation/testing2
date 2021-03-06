global class InvoiceService{
    webservice static String revertRecord(Id recordId){


        Map<Id, String> results = FieloPLT.SObjectService.revertRecords(new Set<Id>{recordId});
        
        if(results != null){
            return results.get(recordId);
        }

        return 'The reversion was succesful.';
    }

    webservice static String reprocessRecord(Id recordId){

        String soql = 'SELECT ';
        for(String fieldName : Schema.getGlobalDescribe().get('Invoice__c').getDescribe().fields.getMap().keySet()) {
            soql += fieldName + ', ';
        }
        soql = soql.left(soql.lastIndexOf(','));
        soql += ' FROM ' + 'Invoice__c' + ' WHERE Id = \'' + recordId + '\'' + ' LIMIT 1';
        List<Invoice__c> sObjectList = (List<Invoice__c>) Database.query(soql);


        FieloPLT.SObjectService.processRecords(sObjectList, null);

        return 'The record was processed succesfully.';
    }
}
