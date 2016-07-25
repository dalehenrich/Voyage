examples
voyageServerBlockQueryExample
  ^ '	| mongoQuery |
	mongoQuery := Dictionary new
		at: ''keywords''
			put:
			(Dictionary new
				at: ''$all'' put: #(''Smalltalk'' ''Argentina'');
				yourself);
		yourself.

	[ (((Smalltalk at: #TugrikDbServer) databaseNamed: ''my example'')
		selectCollectionNamed: ''TestPilot''
		queryDict: mongoQuery) halt ] doOnServer
'