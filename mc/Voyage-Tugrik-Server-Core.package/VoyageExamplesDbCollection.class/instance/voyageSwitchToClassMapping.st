examples
voyageSwitchToClassMapping
  ^ '[
	System abort.
	VoyageClassMappingDbServer resetRoot. 
	VoyageClassMappingDbServer root.
	System commit ] voyageDoOnServer.

(VOTugrikRepository 
	dbServerClassName: ''VoyageClassMappingDbServer'' 
	database: ''gemtalk example'') enableSingleton.
'