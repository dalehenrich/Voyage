tests
testServerSidePrimitiveType
	| clientAr serverAr |
	clientAr := {1.
	1.1.
	'sss'.
	true.
	nil.
	{1 . 1.1 . 'sss' . true . nil}}.
	serverAr := [ {1.
	1.1.
	'sss'.
	true.
	nil.
	{1 . 1.1 . 'sss' . true . nil}} ] voyageDoOnServer: self repository.
	self assert: clientAr = serverAr