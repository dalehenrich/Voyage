examples
voyageServerBlocks02
  ^ '"You can perform queries on the server using server blocks: "

| pilot query pet databaseName ans |
VORepository current 
	removeAll: VOTestCat; 
	removeAll: VOTestPilot;
	yourself.
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

"The result of block is the appropriate client-side instance"
ans := [ ((Smalltalk at: #TugrikDbServer) databaseNamed: databaseName)
	selectCollectionNamed: ''pet''
	queryDict: query ] voyageDoOnServer.
pet == ans first
'