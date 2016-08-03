*Voyage-GemStone-Tests
testCrossImageEmbeddedUpdates
	| rep1 rep2 pilot1 pilot2 petOwner pet |
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
	rep1 save: pilot1.
	pilot2 := rep2 selectOne: VOTestPilot where: [ :each | each name = 'Janet' ].
	pilot1 pet owner aux == pilot2 pet owner aux
		ifFalse: [ self error: 'oops' ].
	true
		ifTrue: [ pilot1 aux: '2' ].
	true
		ifTrue: [ rep1 save: pilot1 ].
	rep1 save: pilot1.
	pilot1 pet owner aux: 2.
	rep1 save: pilot1 pet owner.
	pilot2 := rep2 selectOne: VOTestPilot where: [ :each | each name = 'Janet' ].
	self assert: pilot1 aux = pilot2 aux.	
	self deny: pilot1 pet owner aux = pilot2 pet owner aux.	"This is unexpected behavior ... have to explicily update a child object?"
	rep2 selectAll: VOTestPilot.
	self assert: pilot1 pet owner aux = pilot2 pet owner aux.	"Update all VOTestPilots ought to refresh owner"
	