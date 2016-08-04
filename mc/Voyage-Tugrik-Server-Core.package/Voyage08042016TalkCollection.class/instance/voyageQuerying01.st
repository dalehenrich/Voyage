examples
voyageQuerying01
  ^ '"Queries using blocks or MongoQueries:"

VORepository current 
	removeAll: VOTestCat; 
	removeAll: VOTestPilot;
	yourself.

pilot := VOTestPilot new
	name: ''Dale'';
	aux: 15;
	pet: (VOTestCat new
		name: ''Bond'';
		yourself);
	yourself.
pilot save.

pilot := VOTestPilot new
	name: ''Janet'';
	aux: 20;
	pet: (pet := VOTestDog new
		name: ''Atreyu'';
		yourself);
	yourself.
pilot save.

VORepository current selectOne: VOTestPilot where: [ :each | each name = ''Janet'' ].
VORepository current selectOne: VOTestPilot where: {''name'' -> ''Janet''} asDictionary.

VORepository current selectMany: VOTestPilot where: [ :each | (each aux > 10) ].
VORepository current 
	selectMany: VOTestPilot 
	where: 
		{''aux'' -> { ''$gt'' -> 10 } asDictionary } asDictionary.

VORepository current selectOne: VOTestPilot where: [ :each | (each name = ''Janet'') & (each aux > 10) ].
VORepository current 
	selectOne: VOTestPilot 
	where: 
		{''name'' -> ''Janet''.
		 ''aux'' -> { ''$gt'' -> 10 } asDictionary } asDictionary.
'