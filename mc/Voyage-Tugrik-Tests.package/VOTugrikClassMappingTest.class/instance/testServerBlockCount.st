tests
testServerBlockCount
	| pilot pilot2 pilot3 databaseName dbServerClassName answer |
	pilot := VOTestPilot new
		name: 'Pilot1';
		yourself.
	pilot2 := VOTestPilot new
		name: 'Pilot2';
		yourself.
	pilot3 := VOTestPilot new
		name: 'Pilot3';
		yourself.
	self repository
		save: pilot;
		save: pilot2;
		save: pilot3.
	databaseName := self repository databaseName.
	dbServerClassName := self repository dbServerClassName.
	answer := [ | serverRepository |
	VORepository current abort.	"abort needed to make sure that block sees latest view"
	serverRepository := VOTugrikRepository
		dbServerClassName: dbServerClassName
		database: databaseName.
	serverRepository count: VOTestPilot ] voyageDoOnServer: self repository.
	self assert: answer = 3