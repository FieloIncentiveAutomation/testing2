Savepoint sp = Database.setSavepoint();
try{
	//Hago un query a los record types al principio y los asigno
	Id publicId;
	Id privateId;
	for(RecordType rt : [SELECT Id, DeveloperName, NamespacePrefix FROM RecordType WHERE DeveloperName IN ('Private', 'Public')]){
		if(rt.NamespacePrefix == 'FieloAlpha' && rt.DeveloperName == 'Public'){
			publicId = rt.Id;
			continue;
		}else if(rt.NamespacePrefix == 'FieloAlpha' && rt.DeveloperName == 'Private'){
			privateId = rt.Id;
			continue;
		}
	}



	//Creo segmentos público y privado
	Id defProgramId = FieloAlpha.ProgramUtil.getDefaultProgram().Id;
	List<FieloAlpha__RedemptionRule__c> segments = new List<FieloAlpha__RedemptionRule__c>();
	segments.add(new FieloAlpha__RedemptionRule__c(Name = 'Guest', RecordTypeId = publicId, FieloAlpha__Program__c = defProgramId));
	segments.add(new FieloAlpha__RedemptionRule__c(Name = 'Registered', RecordTypeId = privateId, FieloAlpha__Program__c = defProgramId));
	insert segments;

	//Creo el badge 
	insert new FieloAlpha__Badge__c(Name = 'Big Buyer', FieloAlpha__Program__c = defProgramId, FieloAlpha__AttachmentId__c = 'http://www.romeomaestri.it/images/Logo%20Big%20Buyer~2TMB.jpg');


	List<FieloAlpha__Banner__c> banners = new List<FieloAlpha__Banner__c>();
	banners.add(new FieloAlpha__Banner__c(Name = 'Banner 1', FieloAlpha__AttachmentId__c = 'https://s32.postimg.org/6tasc7m0l/banner.jpg', FieloAlpha__isActive__c = true));
	banners.add(new FieloAlpha__Banner__c(Name = 'Banner 2', FieloAlpha__AttachmentId__c = 'https://s32.postimg.org/bdwyr55px/banner2.jpg', FieloAlpha__isActive__c = true));
	banners.add(new FieloAlpha__Banner__c(Name = 'Banner 3', FieloAlpha__AttachmentId__c = 'https://s32.postimg.org/4yxxugz05/banner3.jpg', FieloAlpha__isActive__c = true));
	banners.add(new FieloAlpha__Banner__c(Name = 'Banner 4', FieloAlpha__AttachmentId__c = 'https://s32.postimg.org/723roe9f9/banner4.jpg', FieloAlpha__isActive__c = true));
	banners.add(new FieloAlpha__Banner__c(Name = 'Banner 5', FieloAlpha__AttachmentId__c = 'https://s32.postimg.org/tpj0ujoz9/banner5.jpg', FieloAlpha__isActive__c = true));

	insert banners;
	
	List<Product2> productsToInsert = new List<Product2>();
	Product2 wallControl = new Product2(Name = 'Switch: White 4-Function Wall Control', Family = 'Switch');
	productsToInsert.add(wallControl);
	Product2 AFCWire = new Product2(Name = 'Wire: Gray Cable', Family = 'Wire');
	productsToInsert.add(AFCWire);
	
	insert productsToInsert;

}catch(Exception e){
	System.debug(e);
	Database.rollback(sp);
}
