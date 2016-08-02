examples
voyageServerBlocks04
  ^ '"With class mapping, you can leverage server-side behavior. In this case we are sending the message #compareEqual: on the server in a server block."

| pilot databaseName ans |
10 timesRepeat: [ | id |
	id := 100 atRandom asString.
	pilot := VOTestPilot new
		name: ''Dale_'', id;
		pet: (VOTestDog new name: ''Hadji_'', id ).
	pilot save ].

databaseName := VORepository current databaseName.

ans := [
	| collection |
	collection := (((Smalltalk at: #TugrikDbServer) databaseNamed: databaseName) collections at: ''TestPilot'')
    collection.
	{collection 
		detect: [:aPilot | aPilot compareEqual: pilot ]
		ifNone: [ ''sorry charlie'' ] }] voyageDoOnServer.
{pilot. ans. pilot compareEqual: ans first}
'