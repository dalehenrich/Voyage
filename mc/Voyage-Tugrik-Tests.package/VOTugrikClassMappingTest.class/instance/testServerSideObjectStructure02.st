tests
testServerSideObjectStructure02
	| pilot clientAr serverAr |
	clientAr := {1 . 1.1 . 'sss' . true . nil}.
	pilot := VOTestPilot new
		aux: clientAr;
		yourself.
	self repository save: pilot.
	serverAr := [ VORepository current abort.	"abort needed to make sure that block sees latest view"
	pilot aux ] voyageDoOnServer: self repository.
	self assert: serverAr = clientAr