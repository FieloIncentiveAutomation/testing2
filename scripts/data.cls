Savepoint sp = Database.setSavepoint();
try{
	//Hago un query a los record types al principio y los asigno
	Id publicId;
	Id privateId;
	Id catItemId;
	for(RecordType rt : [SELECT Id, DeveloperName, NamespacePrefix FROM RecordType WHERE DeveloperName IN ('CategoryItem', 'Private', 'Public')]){
		if(rt.NamespacePrefix == 'FieloAlpha' && rt.DeveloperName == 'CategoryItem'){
			catItemId = rt.Id;
			continue;
		}else if(rt.NamespacePrefix == 'FieloAlpha' && rt.DeveloperName == 'Public'){
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


	//Creo categorías
	List<FieloAlpha__Category__c> categories = new List<FieloAlpha__Category__c>();
	FieloAlpha__Category__c autoCategory = new FieloAlpha__Category__c(Name = 'Auto', FieloAlpha__AttachmentId__c = 'https://www.icbcclub.com.ar/images/Categorias/ROJOS/auto.png');
	categories.add(autoCategory);
	FieloAlpha__Category__c bazarCategory = new FieloAlpha__Category__c(Name = 'Bazar', FieloAlpha__AttachmentId__c = 'https://www.icbcclub.com.ar/images/Categorias/ROJOS/regalo.png');
	categories.add(bazarCategory);
	FieloAlpha__Category__c cuidadoPersonalCategory = new FieloAlpha__Category__c(Name = 'Cuidado Personal', FieloAlpha__AttachmentId__c = 'https://www.icbcclub.com.ar/images/Categorias/ROJOS/cuidado_personal.png');
	categories.add(cuidadoPersonalCategory);
	FieloAlpha__Category__c deporteCategory = new FieloAlpha__Category__c(Name = 'Deporte', FieloAlpha__AttachmentId__c = 'https://www.icbcclub.com.ar/images/Categorias/ROJOS/deportes.png');
	categories.add(deporteCategory);
	FieloAlpha__Category__c electroCategory = new FieloAlpha__Category__c(Name = 'Electrodomésticos', FieloAlpha__AttachmentId__c = 'https://www.icbcclub.com.ar/images/Categorias/ROJOS/electro_02.png');
	categories.add(electroCategory);
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
	FieloAlpha__Reward__c cubreCocheTricapa = new FieloAlpha__Reward__c(Name = 'Juego de vajilla de mesa Tramontina', FieloAlpha__Category__c = bazarCategory.Id, FieloAlpha__Description__c = 'Juego de vajilla para mesa elegante Linea Rotonda de 13 piezas en acero inoxidable de Tramontina. Incluye: 1 Cucharon de salsa, 1 Sopera, 1 Fuente oval profunda de 35 cms., 1 Fuente oval profunda de 40 cms., 1 Fuente oval plana de 40 cms., 1 Fuente oval plana 35 cms., 1 Fuente para pescado, 1 Fuente para vegetales con tapa, 1 Plato redondo profundo, 1 Plato redondo plano 30 cms., 1 Plato redondo plano 35 cms., 1 Salsera y 1 Sopera.', FieloAlpha__AttachmentId__c = 'https://www.icbcclub.com.ar/images/Productos/Grandes/2_118709@-8709b.jpg', FieloAlpha__PointsCant__c = 382410, FieloAlpha__Stock__c = 1000, FieloAlpha__VoucherCreationMode__c = 'Controlled By Quantity');
	rewards.add(cubreCocheTricapa);
	FieloAlpha__Reward__c setVajilla = new FieloAlpha__Reward__c(Name = 'Set de vajilla 30 piezas baúl Oxford', FieloAlpha__Category__c = bazarCategory.Id, FieloAlpha__Description__c = 'Set de vajilla de 30 piezas cuadrados blancos de porcelana Oxford. Incluye: 6 platos playos, 6 platos hondos, 6 platos postre, 6 tazas de té. Presentación en baúl de madera.', FieloAlpha__AttachmentId__c = 'https://www.icbcclub.com.ar/images/Productos/Grandes/2_117709@-7709b.jpg', FieloAlpha__PointsCant__c = 142865, FieloAlpha__Stock__c = 1000, FieloAlpha__VoucherCreationMode__c = 'Controlled By Quantity');
	rewards.add(setVajilla);
	FieloAlpha__Reward__c molinillo = new FieloAlpha__Reward__c(Name = 'Molinillo eléctrico Peugeot', FieloAlpha__Category__c = bazarCategory.Id, FieloAlpha__Description__c = 'Molinillo eléctrico Peugeot Zeli 14 cm con revestimiento tipo metal cepillado, se caracteriza por su gran ergonomía. Tiene un botón situado en la parte superior para un movimiento natural de la mano. Cuenta también con una pequeña lámpara que se enciende durante su uso. Funciona con 6 pilas AAA (no incluidas).', FieloAlpha__AttachmentId__c = 'https://www.icbcclub.com.ar/images/Productos/Grandes/2_117699@-7699b.jpg', FieloAlpha__PointsCant__c = 99065, FieloAlpha__Stock__c = 1000, FieloAlpha__VoucherCreationMode__c = 'Controlled By Quantity');
	rewards.add(molinillo);
	FieloAlpha__Reward__c cubiertos = new FieloAlpha__Reward__c(Name = 'Juego de cubiertos Nicols', FieloAlpha__Category__c = bazarCategory.Id, FieloAlpha__Description__c = 'Juego de cubiertos de 24 piezas Nicols de acero inoxidable de delicado diseño realizado en acero pulido brillante.', FieloAlpha__AttachmentId__c = 'https://www.icbcclub.com.ar/images/Productos/Grandes/2_111735@-1735b.jpg', FieloAlpha__PointsCant__c = 84005, FieloAlpha__Stock__c = 1000, FieloAlpha__VoucherCreationMode__c = 'Controlled By Quantity');
	rewards.add(cubiertos);
	FieloAlpha__Reward__c maqRavioles = new FieloAlpha__Reward__c(Name = 'Máquina de ravioles', FieloAlpha__Category__c = bazarCategory.Id, FieloAlpha__Description__c = 'Máquina para hacer ravioles frescos con rellenos a elección, realizada en acero inoxidable y laminador estriado.', FieloAlpha__AttachmentId__c = 'https://www.icbcclub.com.ar/images/Productos/Grandes/2_112367@-2367b.jpg', FieloAlpha__PointsCant__c = 41775, FieloAlpha__Stock__c = 1000, FieloAlpha__VoucherCreationMode__c = 'Controlled By Quantity');
	rewards.add(maqRavioles);

	//Cuidado personal
	FieloAlpha__Reward__c lumeaEssential = new FieloAlpha__Reward__c(Name = 'Lumea Essential', FieloAlpha__Category__c = cuidadoPersonalCategory.Id, FieloAlpha__Description__c = 'Sistema de depilación con tecnología IPL. Lámpara de 100.000 pulsos que no necesita reemplazo. Adaptada para un uso seguro y eficaz en tu propio hogar.', FieloAlpha__AttachmentId__c = 'https://www.icbcclub.com.ar/images/Productos/Grandes/2_117708@-7708b.jpg', FieloAlpha__PointsCant__c = 382410, FieloAlpha__Stock__c = 1000, FieloAlpha__VoucherCreationMode__c = 'Controlled By Quantity');
	rewards.add(lumeaEssential);
	FieloAlpha__Reward__c perfume = new FieloAlpha__Reward__c(Name = 'Perfume Flower in the Air', FieloAlpha__Category__c = cuidadoPersonalCategory.Id, FieloAlpha__Description__c = 'Fragancia femenina Flower in the air eau de toilette de Kenzo. Delicado perfume floral, cítrico y ultrafesco. Presentación de 100 ml.', FieloAlpha__AttachmentId__c = 'https://www.icbcclub.com.ar/images/Productos/Grandes/2_117994@-7994b.jpg', FieloAlpha__PointsCant__c = 101330, FieloAlpha__Stock__c = 1000, FieloAlpha__VoucherCreationMode__c = 'Controlled By Quantity');
	rewards.add(perfume);
	FieloAlpha__Reward__c nebulizador = new FieloAlpha__Reward__c(Name = 'Nebulizador a pistón Silfab', FieloAlpha__Category__c = cuidadoPersonalCategory.Id, FieloAlpha__Description__c = 'Nebulizador a pistón NeoVento Silfab. Con compartimiento para guardar el kit de nebulización. Manos libres con el porta pipeta incluido. Práctico guardacable en su parte posterior. Incluye máscara para adultos, máscara para niños, manguera, pipeta.', FieloAlpha__AttachmentId__c = 'https://www.icbcclub.com.ar/images/Productos/Grandes/2_11848@-848b.jpg', FieloAlpha__PointsCant__c = 65460, FieloAlpha__Stock__c = 1000, FieloAlpha__VoucherCreationMode__c = 'Controlled By Quantity');
	rewards.add(nebulizador);
	FieloAlpha__Reward__c afeitadora = new FieloAlpha__Reward__c(Name = 'Afeitadora Philips HQ6949', FieloAlpha__Category__c = cuidadoPersonalCategory.Id, FieloAlpha__Description__c = 'Afeitadora con tecnología Close Cut. Posee tres cabezales con movimiento conjunto e individual y corta patillas. Voltaje universal automático (110-220 V). Origen: Argentina.', FieloAlpha__AttachmentId__c = 'https://www.icbcclub.com.ar/images/Productos/Grandes/2_117566@-7566b.jpg', FieloAlpha__PointsCant__c = 65460, FieloAlpha__Stock__c = 1000, FieloAlpha__VoucherCreationMode__c = 'Controlled By Quantity');
	rewards.add(afeitadora);
	FieloAlpha__Reward__c planchita = new FieloAlpha__Reward__c(Name = 'Planchita Ion Colors Ga.Ma.', FieloAlpha__Category__c = cuidadoPersonalCategory.Id, FieloAlpha__Description__c = 'Planchita Ion Colors Ga.Ma. Con patines de tecnología Ceramic Ion. Alta emisión de iones, de rápido calentamiento con cable rotativo con aro para colgarla. Temperatura 210 ºC/410ºF. Versiones: rosa, verde,violeta y celeste. Color según disponibilidad.', FieloAlpha__AttachmentId__c = 'https://www.icbcclub.com.ar/images/Productos/Grandes/2_117262@-7262b.jpg', FieloAlpha__PointsCant__c = 65460, FieloAlpha__Stock__c = 1000, FieloAlpha__VoucherCreationMode__c = 'Controlled By Quantity');
	rewards.add(planchita);

	//Deporte
	FieloAlpha__Reward__c bicicleta = new FieloAlpha__Reward__c(Name = 'Bicicleta Playera Fiorenza rodado 26', FieloAlpha__Category__c = deporteCategory.Id, FieloAlpha__Description__c = 'Bicicleta playera para adulto, rodado 26. Con freno trasero contrapedal. Cómodo asiento playero. Color según disponibilidad.', FieloAlpha__AttachmentId__c = 'https://www.icbcclub.com.ar/images/Productos/Grandes/2_117285@-7285b.jpg', FieloAlpha__PointsCant__c = 382410, FieloAlpha__Stock__c = 1000, FieloAlpha__VoucherCreationMode__c = 'Controlled By Quantity');
	rewards.add(bicicleta);
	FieloAlpha__Reward__c rollers = new FieloAlpha__Reward__c(Name = 'Rollers extensible Heitz DS1 talle M', FieloAlpha__Category__c = deporteCategory.Id, FieloAlpha__Description__c = 'Roller Skates de 4 ruedas. Talle extensible apto para talle 35 al 38. Cierre Dúo Lock. Ajuste triple. Confeccionados en tela microporosa. Freno en bota derecha. Rulemanes High Speed Carbon ABEC5. Ruedas de 70 mm. Color gris, rojo o azul según disponibilidad.', FieloAlpha__AttachmentId__c = 'https://www.icbcclub.com.ar/images/Productos/Grandes/2_118116@-8116b.jpg', FieloAlpha__PointsCant__c = 65340, FieloAlpha__Stock__c = 1000, FieloAlpha__VoucherCreationMode__c = 'Controlled By Quantity');
	rewards.add(rollers);
	FieloAlpha__Reward__c paloHockey = new FieloAlpha__Reward__c(Name = 'Palo de Hockey Cougar Black Arrow', FieloAlpha__Category__c = deporteCategory.Id, FieloAlpha__Description__c = 'Palo de Hockey de Fibra de Vidrio 80% y Carbono 20%. Posee un diseño aerodinámico que produce una mejor eficiencia energética. Longitud: 37, 37.5, 38 pulgadas. Altura jugador: entre 1.65 m a 1.80 m aproximados. Posee grip anatómico.', FieloAlpha__AttachmentId__c = 'https://www.icbcclub.com.ar/images/Productos/Grandes/2_117343@-7343b.jpg', FieloAlpha__PointsCant__c = 48265, FieloAlpha__Stock__c = 1000, FieloAlpha__VoucherCreationMode__c = 'Controlled By Quantity');
	rewards.add(paloHockey);																																																																										
	FieloAlpha__Reward__c pelotaBasket = new FieloAlpha__Reward__c(Name = 'Pelota Basket All Star', FieloAlpha__Category__c = deporteCategory.Id, FieloAlpha__Description__c = 'Pelota Básket AllStar, número 7 oficial NBA.', FieloAlpha__AttachmentId__c = 'https://www.icbcclub.com.ar/images/Productos/Grandes/2_118293@-8293b.jpg', FieloAlpha__PointsCant__c = 39445, FieloAlpha__Stock__c = 1000, FieloAlpha__VoucherCreationMode__c = 'Controlled By Quantity');
	rewards.add(pelotaBasket);
	FieloAlpha__Reward__c pelotasTenis = new FieloAlpha__Reward__c(Name = 'Tubo de pelotas de Tenis Open Us Wilson', FieloAlpha__Category__c = deporteCategory.Id, FieloAlpha__Description__c = 'Tubo de 3 pelotas de tenis Wilson.', FieloAlpha__AttachmentId__c = 'https://www.icbcclub.com.ar/images/Productos/Grandes/2_114553@-4553b.jpg', FieloAlpha__PointsCant__c = 22750, FieloAlpha__Stock__c = 1000, FieloAlpha__VoucherCreationMode__c = 'Controlled By Quantity');
	rewards.add(pelotasTenis);

	//Electrodomésticos
	FieloAlpha__Reward__c heladera = new FieloAlpha__Reward__c(Name = 'Heladera Eslabón de Lujo', FieloAlpha__Category__c = electroCategory.Id, FieloAlpha__Description__c = 'Heladera Eslabón de Lujo no frost de 277 litros. Color inoxidable.', FieloAlpha__AttachmentId__c = 'https://www.icbcclub.com.ar/images/Productos/Grandes/2_118526@-8526b.jpg', FieloAlpha__PointsCant__c = 728875, FieloAlpha__Stock__c = 1000, FieloAlpha__VoucherCreationMode__c = 'Controlled By Quantity');
	rewards.add(heladera);
	FieloAlpha__Reward__c aireAcondicionado = new FieloAlpha__Reward__c(Name = 'Aire acondicionado F/C LG', FieloAlpha__Category__c = electroCategory.Id, FieloAlpha__Description__c = 'Aire acondicionado Frío/ Calor, 2200 frigorías. Cuenta con el nuevo filtro 3M tecnología exclusiva de LF, que eliminan polvo microscópico, agentes alergénicos, olores, humo de tabaco e incluso ácaros. Eficiencia energética tipo A. Cuenta con sistema Power Cooling, programa de enfriado rápido y deshumidificación.', FieloAlpha__AttachmentId__c = 'https://www.icbcclub.com.ar/images/Productos/Grandes/2_117242@-7242b.jpg', FieloAlpha__PointsCant__c = 583875, FieloAlpha__Stock__c = 1000, FieloAlpha__VoucherCreationMode__c = 'Controlled By Quantity');
	rewards.add(aireAcondicionado);
	FieloAlpha__Reward__c lavarropas = new FieloAlpha__Reward__c(Name = 'Lavarropas LG', FieloAlpha__Category__c = electroCategory.Id, FieloAlpha__Description__c = 'Lavarropas LG con capacidad: 8 Kg, 700 RPM, Sistema de Lavado Turbo Drum, 8 Programas de Lavado, I-sensor, Selector de agua Frío/Caliente, Tapa vidrio templado / Panel de control digital.', FieloAlpha__AttachmentId__c = 'https://www.icbcclub.com.ar/images/Productos/Grandes/2_118517@-8517b.jpg', FieloAlpha__PointsCant__c = 549520, FieloAlpha__Stock__c = 1000, FieloAlpha__VoucherCreationMode__c = 'Controlled By Quantity');
	rewards.add(lavarropas);
	FieloAlpha__Reward__c hornoElectrico = new FieloAlpha__Reward__c(Name = 'Horno eléctrico 30 litros', FieloAlpha__Category__c = electroCategory.Id, FieloAlpha__Description__c = 'Horno eléctrico Alpaca con una capacidad de 30 litros. Material de acero inoxidable, incluye una bandeja esmaltada y función de spiedo y convención. Timer de 60 minutos con timbre, potencia de 1600 W y un rango de temperatura de 100° a 250° con selector de 4 etapas de calor.', FieloAlpha__AttachmentId__c = 'https://www.icbcclub.com.ar/images/Productos/Grandes/2_117925@-7925b.jpg', FieloAlpha__PointsCant__c = 146350, FieloAlpha__Stock__c = 1000, FieloAlpha__VoucherCreationMode__c = 'Controlled By Quantity');
	rewards.add(hornoElectrico);
	FieloAlpha__Reward__c ollaPresion = new FieloAlpha__Reward__c(Name = 'Olla a presión eléctrica Philips', FieloAlpha__Category__c = electroCategory.Id, FieloAlpha__Description__c = 'Recipiente interno antiadherente y duradero su cubierta exterior es de acero inoxidable para una limpieza fácil. Cuenta con período ajustable de 0 a 60 minutos para mantener la presión y temporizador fácil de programar con cuenta regresiva. Protección de control automático de la presión.', FieloAlpha__AttachmentId__c = 'https://www.icbcclub.com.ar/images/Productos/Grandes/2_118307@-8307b.jpg', FieloAlpha__PointsCant__c = 142070, FieloAlpha__Stock__c = 1000, FieloAlpha__VoucherCreationMode__c = 'Controlled By Quantity');
	rewards.add(ollaPresion);

	//Descuentos
	FieloAlpha__Reward__c discount5 = new FieloAlpha__Reward__c(Name = '5% descuento en nuestros productos', FieloAlpha__Category__c = discountCategory.Id, FieloAlpha__Description__c = '5% de descuento sobre el total de la próxima compra de nuestros productos.', FieloAlpha__AttachmentId__c = 'http://www.discountspout.com/images/coupons/coupon_3581.gif', FieloAlpha__PointsCant__c = 100000, FieloAlpha__VoucherCreationMode__c = 'Unlimited', FieloAlpha__isInstantReward__c = true);
	rewards.add(discount5);

	insert rewards;

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
