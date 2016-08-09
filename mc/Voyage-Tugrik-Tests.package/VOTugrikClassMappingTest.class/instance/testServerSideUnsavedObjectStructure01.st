tests
testServerSideUnsavedObjectStructure01
	"pass an unsaved object along the pike"

	| pilot ar pet |
	pilot := VOTestPilot new
		name: 'Dale';
		pet: (pet := VOTestDog new name: 'Elsa') yourself.
	ar := [ | serverPet |
	serverPet := pilot pet.
	{serverPet.
	(serverPet class = VOTestDog).
	(serverPet name = 'Elsa').
	(serverPet == pet)} ] voyageDoOnServer: self repository.
	self assert: (ar at: 1) == pilot.
	2 to: ar size do: [ :index | self assert: (ar at: index) ]