examples
voyageQuerying01
  ^ '"Queries using blocks or MongoQueries:"

pilot := VOTestPilot new
	name: ''Dale'';
	pet: (VOTestCat new
		name: ''Bond'';
		yourself);
	yourself.
pilot save.

pilot := VOTestPilot new
	name: ''Janet'';
	pet: (pet := VOTestDog new
		name: ''Atreyu'';
		yourself);
	yourself.
pilot save.

VORepository current selectOne: VOTestPilot where: [ :each | each name = ''Janet'' ].

'