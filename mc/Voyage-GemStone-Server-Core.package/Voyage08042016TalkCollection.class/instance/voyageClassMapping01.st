examples
voyageClassMapping01
  ^ '"You can arrange to map server-side instances to concrete classes:"

| pet pilot query databaseName |

(VOGemStoneRepository 
	dbServerClassName: ''VoyageClassMappingDbServer'' 
	database: ''gemtalk example'') enableSingleton.

[(Smalltalk at: #TugrikDbServer) resetRoot. nil] voyageDoOnServer.

pet := VOTestCat new
	name: ''Bond'';
	yourself.
pilot := VOTestPilot new
	name: ''Dale'';
	pet: pet;
	yourself.
pilot save.
query := {''name'' -> ''Bond''} asDictionary.
databaseName := VORepository current databaseName.

[ | queryResult |
	queryResult := ((Smalltalk at: #TugrikDbServer) databaseNamed: databaseName)
		selectCollectionNamed: ''pet''
		queryDict: query.
	queryResult halt. ] voyageDoOnServer
'