examples
voyageServerBlockScopingExample
  ^ '
	| retrieved pilot |
	"(VOGemStoneRepository database: ''my example'') enableSingleton"
	"(VOGemStoneRepository dbServerClassName: ''VoyageClassMappingDbServer'' database: ''my example'') enableSingleton"

	10 timesRepeat: [ | id |
		id := 100 atRandom asString.
		pilot := VOTestPilot new
			name: ''Dale_'', id;
			pet: (VOTestDog new name: ''Hadji_'', id ).
		pilot save ].

	[
	| collection |
	collection := (((Smalltalk at: #TugrikDbServer) databaseNamed: ''my example'') collections at: ''TestPilot'')
    collection.
	{collection 
		detect: [:aPilot | aPilot name = pilot name ]
		ifNone: [ ''sorry charlie'' ].
	pilot }] voyageDoOnServer
'