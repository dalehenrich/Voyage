*Voyage-Tugrik-Tests
testNonRootEmbeddedObjectSharing
	| pilot pilot1 pilot2 sharedArray |
	sharedArray := {'Blue'}.
	pilot1 := VOTestPilot new
		name: 'Pilot1';
		currency: sharedArray;
		yourself.
	self repository save: pilot1.
	pilot2 := VOTestPilot new
		name: 'Pilot2';
		currency: sharedArray;
		yourself.
	self repository save: pilot2.
	pilot := self repository
		selectOne: VOTestPilot
		where: {('name' -> 'Pilot1')} asDictionary.
	self assert: (pilot currency includes: 'Blue').
	pilot := self repository
		selectOne: VOTestPilot
		where: {('name' -> 'Pilot2')} asDictionary.
	self assert: (pilot currency includes: 'Blue').
	pilot1 := pilot2 := nil.
	self repository cache flush.
	sharedArray := {'Red'}.
	pilot := self repository
		selectOne: VOTestPilot
		where: {('name' -> 'Pilot1')} asDictionary.
	pilot currency: sharedArray.
	self repository save: pilot.	"saved sharedArray is Red"
	sharedArray at: 1 put: 'Green'.
	pilot := self repository
		selectOne: VOTestPilot
		where: {('name' -> 'Pilot1')} asDictionary.
	self assert: (pilot currency includes: 'Green').	"local sharedArray is Green"
	pilot := self repository
		selectOne: VOTestPilot
		where: {('name' -> 'Pilot2')} asDictionary.
	pilot currency: sharedArray.
	self repository save: pilot.	"saved sharedArray is Red"
	pilot := nil.
	self repository cache flush.
	pilot := self repository
		selectOne: VOTestPilot
		where: {('name' -> 'Pilot1')} asDictionary.
	self assert: (pilot currency includes: 'Red').	"persisted sharedArray is Red"
	pilot := self repository
		selectOne: VOTestPilot
		where: {('name' -> 'Pilot2')} asDictionary.
	self assert: (pilot currency includes: 'Green')	"persisted sharedArray is Green"