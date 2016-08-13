examples
voyageServerBlockScopingExample02
  ^ '
| pilotName |
pilotName := ''Janet_'', 100 atRandom asString.
[
	|  pilot |
	(Smalltalk at: #System) abort.
	pilot := VOTestPilot new
		name: pilotName;
		aux: 15;
		pet: (VOTestCat new
			name: ''Bond_'', 100 atRandom printString;
			yourself);
		yourself.
	pilot save.
	(Smalltalk at: #System) commit.

	VORepository current
		selectOne: VOTestPilot 
		where: [ :each | (each name = pilotName) & (each aux > 10) ]
] voyageDoOnServer.
	
VORepository current selectAll: VOTestPilot.
VORepository current selectAll: VOTestPet.
'