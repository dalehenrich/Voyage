*Voyage-Tugrik-Tests
testSaveCircularDictionaryWhere
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
	self assert: (self repository selectAll: VOTestOwner) size equals: 1.
	self assert: (self repository selectOne: VOTestOwner where: (Dictionary with: 'name' -> 'test owner')) equals: owner.
	self assert: (self repository selectAll: VOTestPet) size equals: 2