tests
testServerSideObjectStructure04
	"save the objects on client before the call"

	"root objects embedded in arrays (deeper than one level) come back as copies"

	| pilot ar pet embeddedPet |
	pilot := VOTestPilot new
		name: 'Dale';
		pet: (pet := VOTestDog new name: 'Elsa') yourself.
	self repository save: pet.
	self repository save: pilot.
	ar := [ | serverPet |
	serverPet := pilot pet.
	{serverPet.
	{serverPet}.
	(serverPet class = VOTestDog).
	(serverPet name = 'Elsa').
	(serverPet == pet)} ] voyageDoOnServer: self repository.
	self assert: (ar at: 1) == pet.
	3 to: ar size do: [ :index | self assert: (ar at: index) ].
	embeddedPet := (ar at: 2) at: 1.
	self assert: embeddedPet == pet