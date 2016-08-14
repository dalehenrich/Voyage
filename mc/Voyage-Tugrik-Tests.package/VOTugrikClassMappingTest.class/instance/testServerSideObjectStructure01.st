tests
testServerSideObjectStructure01
	"save the objects on client before the call"
	"root objects embedded in arrays (deeper than one level) come back as copies"

	| pilot ar pet |
	pilot := VOTestPilot new
		name: 'Dale';
		pet: (pet := VOTestDog new name: 'Elsa') yourself.
	self repository save: pet.
	self repository save: pilot.
	ar := [ | serverPet |
	serverPet := pilot pet.
	{serverPet.
	(serverPet class = VOTestDog).
	(serverPet name = 'Elsa').
	(serverPet == pet)} ] voyageDoOnServer: self repository.
	self assert: (ar at: 1) == pet.
	2 to: ar size do: [ :index | self assert: (ar at: index) ]