tests
testServerSideObjectStructure05
	"save the objects on client before the call"

	"pass an array of root objects to the server"

	| pilot ar pet clientRootArray |
	pilot := VOTestPilot new
		name: 'Dale';
		pet: (pet := VOTestDog new name: 'Elsa') yourself.
	self repository save: pet.
	self repository save: pilot.
	clientRootArray := {pilot.
	pet}.
	ar := [ | clientPilot clientPet serverPet |
	clientPilot := clientRootArray at: 1.
	clientPet := clientRootArray at: 2.
	serverPet := clientPilot pet.
	{clientPilot.
	clientPet.
	serverPet.
	{serverPet}.
	(serverPet class = VOTestDog).
	(serverPet name = 'Elsa').
	(serverPet == pet)} ] voyageDoOnServer: self repository.
	self assert: (ar at: 1) == pilot.
	self assert: (ar at: 2) == pet.
	self assert: (ar at: 3) == pet.
	5 to: ar size do: [ :index | self assert: (ar at: index) ].
	self assert: ((ar at: 4) at: 1) == pet