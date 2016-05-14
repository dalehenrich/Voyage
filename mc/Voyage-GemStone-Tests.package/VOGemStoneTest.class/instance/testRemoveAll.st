tests
testRemoveAll
	| owner |
	owner := VOTestOwner new
		name: 'test owner';
		addPet:
			(VOTestDog new
				name: 'Rocky';
				yourself);
		addPet:
			(VOTestCat new
				name: 'Miau';
				yourself);
		yourself.
	self repository save: owner.
	self repository
		removeAll: VOTestPet;
		removeAll: VOTestOwner;
		yourself.
	self assert: (self repository selectAll: VOTestOwner) size equals: 0.
	self assert: (self repository selectAll: VOTestPet) size equals: 0