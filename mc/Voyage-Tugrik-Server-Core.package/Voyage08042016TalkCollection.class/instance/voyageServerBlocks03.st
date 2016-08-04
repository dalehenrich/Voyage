examples
voyageServerBlocks03
  ^ '"...but the objects on the server instances of TugrikObject not VOTestPilot or VOTestCat"

| query databaseName |

query := {''name'' -> ''Bond''} asDictionary.
databaseName := VORepository current databaseName.

[ | queryResult |
	queryResult := ((Smalltalk at: #TugrikDbServer) databaseNamed: databaseName)
		selectCollectionNamed: ''pet''
		queryDict: query.
	queryResult halt. ] voyageDoOnServer
'