examples
voyageServerBlockScopingExample01
  ^ '"You should be able to place the voyageDoOnServer block just about anywhere in this doit"
[  
	| pilot |

	10 timesRepeat: [ | id |
		id := 100 atRandom asString.
		pilot := VOTestPilot new
			name: ''Dale_'', id;
			pet: (VOTestDog new name: ''Hadji_'', id ).
		pilot save ].

	VORepository current commit. "Commit needed to save preserve changes"

	Transcript cr; show: ''last pilot '', pilot printString.

	 VORepository current selectOne: VOTestPilot where: [ :each | each name = pilot name ] 
	
] voyageDoOnServer.
'