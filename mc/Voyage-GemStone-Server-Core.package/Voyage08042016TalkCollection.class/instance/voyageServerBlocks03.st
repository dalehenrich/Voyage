examples
voyageServerBlocks03
  ^ '"...but the server is an instance of TugrikObject not VOTestCase:"

| query databaseName |

query := {''name'' -> ''Bond''} asDictionary.
databaseName := VORepository current databaseName.

[ | queryResult |
	queryResult := ((Smalltalk at: #TugrikDbServer) databaseNamed: databaseName)
		selectCollectionNamed: ''pet''
		queryDict: query.
	queryResult halt. ] voyageDoOnServer
'