examples
voyageSwitchToClassMapping
  ^ '[
	VOTugrikRepository current abort.
	(Smalltalk at: #VoyageClassMappingDbServer) resetRoot. 
	VOTugrikRepository current createCollectionFor: VOTestPilot
	VOTugrikRepository current commit ] voyageDoOnServer.

(VOTugrikRepository 
	dbServerClassName: ''VoyageClassMappingDbServer'' 
	database: ''gemtalk example'') 
		enableSingleton
		.

VOTugrikRepository current flush
'