*Voyage-GemStone-Tests
testCrossImageEmbeddedUpdates
	| rep1 rep2 pilot1 pilot2 petOwner pet |
	Transcript
		cr;
		show: 'testCrossImageEmbeddedUpdates [0]'.
	rep1 := self repository.
	rep2 := self repository2.
	rep1
		removeAll: VOTestPilot;
		removeAll: VOTestPet.
	petOwner := VOTestPilot new
		name: 'Bond_Owner';
		aux: 1;
		yourself.
	pet := VOTestCat new
		name: 'Bond';
		owner: petOwner;
		yourself.
	pilot1 := VOTestPilot new
		name: 'Janet';
		aux: '1';
		pet: pet;
		yourself.
	Transcript
		cr;
		show: 'testCrossImageEmbeddedUpdates [1]'.
	rep1 save: pilot1.
	self concurrencyDelay.	"we're querying Mongo before the save has finished?"
	pilot2 := rep2 selectOne: VOTestPilot where: [ :each | each name = 'Janet' ].
	Transcript
		cr;
		show: 'testCrossImageEmbeddedUpdates [2]'.
	pilot1 pet owner aux == pilot2 pet owner aux
		ifFalse: [ self error: 'oops' ].
	Transcript
		cr;
		show: 'testCrossImageEmbeddedUpdates [3]'.
	true
		ifTrue: [ pilot1 aux: '2' ].
	true
		ifTrue: [ rep1 save: pilot1 ].
	rep1 save: pilot1.
	Transcript
		cr;
		show: 'testCrossImageEmbeddedUpdates [4]'.
	pilot1 pet owner aux: 2.
	Transcript
		cr;
		show: 'testCrossImageEmbeddedUpdates [5]'.
	rep1 save: pilot1 pet owner.
	Transcript
		cr;
		show: 'testCrossImageEmbeddedUpdates [6]'.
	pilot2 := rep2 selectOne: VOTestPilot where: [ :each | each name = 'Janet' ].
	self assert: pilot1 aux = pilot2 aux description: 'pilot aux not equal after initial select for pilot2'.
	Transcript
		cr;
		show: 'testCrossImageEmbeddedUpdates [7]'.
	self
		deny: pilot1 pet owner aux = pilot2 pet owner aux
		description: 'pilot pet owner aux equal after initial select for pilot2'.
	Transcript
		cr;
		show: 'testCrossImageEmbeddedUpdates [8]'.	"This is unexpected behavior ... have to explicily update a child object?"
	rep2 selectAll: VOTestPilot.
	Transcript
		cr;
		show: 'testCrossImageEmbeddedUpdates [9]'.
	self
		assert: pilot1 pet owner aux = pilot2 pet owner aux
		description: 'pilot pet owner aux equal after selectAll for VOTestPilot'.	"Update all VOTestPilots ought to refresh owner"
	Transcript
		cr;
		show: 'testCrossImageEmbeddedUpdates [10]'