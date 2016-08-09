tests
testServerSideObjectStructure03
	| pilot clientAr serverAr |
	clientAr := {1.
	1.1.
	'sss'.
	true.
	nil.
	{1 . 1.1 . 'sss' . true . nil}}.
	pilot := VOTestPilot new
		aux: clientAr;
		yourself.
	self repository save: pilot.
	serverAr := [ pilot aux ] voyageDoOnServer: self repository.
	self assert: serverAr = clientAr