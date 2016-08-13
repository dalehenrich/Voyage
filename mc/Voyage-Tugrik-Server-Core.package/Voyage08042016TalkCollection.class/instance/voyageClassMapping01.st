examples
voyageClassMapping01
  ^ '"You can, howver, arrange to map server-side instances to concrete classes. In order to use this option you must arrange to load the relevant application classes into the server as well as client."

| pet pilot query databaseName |

(VOTugrikRepository 
	dbServerClassName: ''VoyageClassMappingDbServer'' 
	database: ''gemtalk example'') enableSingleton.

[(Smalltalk at: #TugrikDbServer) resetRoot. 
	true] voyageDoOnServer.

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