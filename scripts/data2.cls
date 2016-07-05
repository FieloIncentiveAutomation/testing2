Savepoint sp = Database.setSavepoint();
try{
	//Hago un query a los record types al principio y los asigno
	Id catItemId;
	for(RecordType rt : [SELECT Id, DeveloperName, NamespacePrefix FROM RecordType WHERE DeveloperName IN ('CategoryItem')]){
		if(rt.NamespacePrefix == 'FieloAlpha' && rt.DeveloperName == 'CategoryItem'){
			catItemId = rt.Id;
			continue;
		}
	}



	//Creo categorías
	List<FieloAlpha__Category__c> categories = new List<FieloAlpha__Category__c>();
	FieloAlpha__Category__c autoCategory = new FieloAlpha__Category__c(Name = 'Auto', FieloAlpha__AttachmentId__c = 'https://www.icbcclub.com.ar/images/Categorias/ROJOS/auto.png');
	categories.add(autoCategory);
	FieloAlpha__Category__c bazarCategory = new FieloAlpha__Category__c(Name = 'Bazar', FieloAlpha__AttachmentId__c = 'https://www.icbcclub.com.ar/images/Categorias/ROJOS/regalo.png');
	categories.add(bazarCategory);
	FieloAlpha__Category__c discountCategory = new FieloAlpha__Category__c(Name = 'Descuentos', FieloAlpha__AttachmentId__c = 'https://www.icbcclub.com.ar/admin/images/categorias/ROJOS/logo%20oportunidades.jpg');
	categories.add(discountCategory);

	insert categories;

	//Creo Rewards
	//Auto
	List<FieloAlpha__Reward__c> rewards = new List<FieloAlpha__Reward__c>();
	FieloAlpha__Reward__c gps = new FieloAlpha__Reward__c(Name = 'GPS gauss Modelo XL5TV', FieloAlpha__Category__c = autoCategory.Id, FieloAlpha__Description__c = 'GPS Gauss modelo XL5TV, con pantalla de 5 pulgadas, señal de Tv digital, Bluetooth, Touch & Wide screen, reproducción de audio y video (películas, música, videos musicales, etc.), posibilidad de cargar fotos y libros electrónicos, juegos de entretenimiento y 4Gb de memoria.', FieloAlpha__AttachmentId__c = 'https://www.icbcclub.com.ar/images/Productos/Grandes/2_117217@-7217b.jpg', FieloAlpha__PointsCant__c = 91815, FieloAlpha__Stock__c = 1000, FieloAlpha__VoucherCreationMode__c = 'Controlled By Quantity');
	rewards.add(gps);
	FieloAlpha__Reward__c securityKit = new FieloAlpha__Reward__c(Name = 'Kit de Seguridad Premium', FieloAlpha__Category__c = autoCategory.Id, FieloAlpha__Description__c = 'Kit de seguridad para auto. Incluye todo lo necesario para viajes en ruta: matafuego de 1 kg., linga para remolque, baliza homologada con patas, botiquín de primeros auxilios, chaleco refractario, guantes con antideslizante y set de fusibles.', FieloAlpha__AttachmentId__c = 'https://www.icbcclub.com.ar/images/Productos/Grandes/2_112042@-2042b.jpg', FieloAlpha__PointsCant__c = 39755, FieloAlpha__Stock__c = 1000, FieloAlpha__VoucherCreationMode__c = 'Controlled By Quantity');
	rewards.add(securityKit);
	FieloAlpha__Reward__c criqueCarrito = new FieloAlpha__Reward__c(Name = 'Crique carrito', FieloAlpha__Category__c = autoCategory.Id, FieloAlpha__Description__c = 'Crique carrito con cuerpo metálico y 2 rueditas para su fácil trasporte. Apto hasta 2 toneladas.', FieloAlpha__AttachmentId__c = 'https://www.icbcclub.com.ar/images/Productos/Grandes/2_114500@-4500b.jpg', FieloAlpha__PointsCant__c = 37380, FieloAlpha__Stock__c = 1000, FieloAlpha__VoucherCreationMode__c = 'Controlled By Quantity');
	rewards.add(criqueCarrito);
	FieloAlpha__Reward__c portaMascotas = new FieloAlpha__Reward__c(Name = 'Porta mascotas', FieloAlpha__Category__c = autoCategory.Id, FieloAlpha__Description__c = 'Funda que protege el tapizado del auto del pelaje, suciedad, uñas, olores y fluidos de la mascota. Para todo tipo de autos, de muy fácil y práctica instalación, es desmontable para facilitar el uso y la limpieza en el vehículo. Incluye instrucciones de uso.', FieloAlpha__AttachmentId__c = 'https://www.icbcclub.com.ar/images/Productos/Grandes/2_113769@-3769b.jpg', FieloAlpha__PointsCant__c = 31695, FieloAlpha__Stock__c = 1000, FieloAlpha__VoucherCreationMode__c = 'Controlled By Quantity');
	rewards.add(portaMascotas);
	FieloAlpha__Reward__c cubreCocheTricapa = new FieloAlpha__Reward__c(Name = 'Cubre coche tricapa', FieloAlpha__Category__c = autoCategory.Id, FieloAlpha__Description__c = 'Cubre coche de alta resistencia y durabilidad. Elastizado. Liviano y de fácil colocación. Protege el auto de la acción de agentes externos como polvo, suciedad, rocío, etc. las medidas son 4,82 mts de largo, 1,40 mts de alto, 1,50 mts de ancho.', FieloAlpha__AttachmentId__c = 'https://www.icbcclub.com.ar/images/Productos/Grandes/2_112039@-2039b.jpg', FieloAlpha__PointsCant__c = 28740, FieloAlpha__Stock__c = 1000, FieloAlpha__VoucherCreationMode__c = 'Controlled By Quantity');
	rewards.add(cubreCocheTricapa);

	//Bazar
	FieloAlpha__Reward__c vajillaTramontina = new FieloAlpha__Reward__c(Name = 'Juego de vajilla de mesa Tramontina', FieloAlpha__Category__c = bazarCategory.Id, FieloAlpha__Description__c = 'Juego de vajilla para mesa elegante Linea Rotonda de 13 piezas en acero inoxidable de Tramontina. Incluye: 1 Cucharon de salsa, 1 Sopera, 1 Fuente oval profunda de 35 cms., 1 Fuente oval profunda de 40 cms., 1 Fuente oval plana de 40 cms., 1 Fuente oval plana 35 cms., 1 Fuente para pescado, 1 Fuente para vegetales con tapa, 1 Plato redondo profundo, 1 Plato redondo plano 30 cms., 1 Plato redondo plano 35 cms., 1 Salsera y 1 Sopera.', FieloAlpha__AttachmentId__c = 'https://www.icbcclub.com.ar/images/Productos/Grandes/2_118709@-8709b.jpg', FieloAlpha__PointsCant__c = 382410, FieloAlpha__Stock__c = 1000, FieloAlpha__VoucherCreationMode__c = 'Controlled By Quantity');
	rewards.add(vajillaTramontina);
	FieloAlpha__Reward__c setVajilla = new FieloAlpha__Reward__c(Name = 'Set de vajilla 30 piezas baúl Oxford', FieloAlpha__Category__c = bazarCategory.Id, FieloAlpha__Description__c = 'Set de vajilla de 30 piezas cuadrados blancos de porcelana Oxford. Incluye: 6 platos playos, 6 platos hondos, 6 platos postre, 6 tazas de té. Presentación en baúl de madera.', FieloAlpha__AttachmentId__c = 'https://www.icbcclub.com.ar/images/Productos/Grandes/2_117709@-7709b.jpg', FieloAlpha__PointsCant__c = 142865, FieloAlpha__Stock__c = 1000, FieloAlpha__VoucherCreationMode__c = 'Controlled By Quantity');
	rewards.add(setVajilla);
	FieloAlpha__Reward__c molinillo = new FieloAlpha__Reward__c(Name = 'Molinillo eléctrico Peugeot', FieloAlpha__Category__c = bazarCategory.Id, FieloAlpha__Description__c = 'Molinillo eléctrico Peugeot Zeli 14 cm con revestimiento tipo metal cepillado, se caracteriza por su gran ergonomía. Tiene un botón situado en la parte superior para un movimiento natural de la mano. Cuenta también con una pequeña lámpara que se enciende durante su uso. Funciona con 6 pilas AAA (no incluidas).', FieloAlpha__AttachmentId__c = 'https://www.icbcclub.com.ar/images/Productos/Grandes/2_117699@-7699b.jpg', FieloAlpha__PointsCant__c = 99065, FieloAlpha__Stock__c = 1000, FieloAlpha__VoucherCreationMode__c = 'Controlled By Quantity');
	rewards.add(molinillo);
	FieloAlpha__Reward__c cubiertos = new FieloAlpha__Reward__c(Name = 'Juego de cubiertos Nicols', FieloAlpha__Category__c = bazarCategory.Id, FieloAlpha__Description__c = 'Juego de cubiertos de 24 piezas Nicols de acero inoxidable de delicado diseño realizado en acero pulido brillante.', FieloAlpha__AttachmentId__c = 'https://www.icbcclub.com.ar/images/Productos/Grandes/2_111735@-1735b.jpg', FieloAlpha__PointsCant__c = 84005, FieloAlpha__Stock__c = 1000, FieloAlpha__VoucherCreationMode__c = 'Controlled By Quantity');
	rewards.add(cubiertos);
	FieloAlpha__Reward__c maqRavioles = new FieloAlpha__Reward__c(Name = 'Máquina de ravioles', FieloAlpha__Category__c = bazarCategory.Id, FieloAlpha__Description__c = 'Máquina para hacer ravioles frescos con rellenos a elección, realizada en acero inoxidable y laminador estriado.', FieloAlpha__AttachmentId__c = 'https://www.icbcclub.com.ar/images/Productos/Grandes/2_112367@-2367b.jpg', FieloAlpha__PointsCant__c = 41775, FieloAlpha__Stock__c = 1000, FieloAlpha__VoucherCreationMode__c = 'Controlled By Quantity');
	rewards.add(maqRavioles);

	//Descuentos
	FieloAlpha__Reward__c discount5 = new FieloAlpha__Reward__c(Name = '5% discount', FieloAlpha__Category__c = discountCategory.Id, FieloAlpha__Description__c = '5% de descuento sobre el total de la próxima compra de nuestros productos.', FieloAlpha__AttachmentId__c = 'http://www.discountspout.com/images/coupons/coupon_3581.gif', FieloAlpha__PointsCant__c = 100000, FieloAlpha__VoucherCreationMode__c = 'Unlimited', FieloAlpha__isInstantReward__c = true);
	rewards.add(discount5);

	insert rewards;

}catch(Exception e){
	System.debug(e);
	Database.rollback(sp);
}
