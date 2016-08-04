examples
voyageQuerying02
  ^ '"Queries using blocks or MongoQueries:"

"BROKEN or not possible"

pilot := VOTestPilot new
	name: ''Dale'';
	pet: (VOTestNonRootCat new
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

VORepository current selectOne: VOTestPilot where: [ :each | each at: ''pet.name'' = ''Bond'' ].

VORepository current selectOne: VOTestPilot where: [ :each | each at: ''pet.__id'' = pet voyageId ].

VORepository current selectOne: VOTestPilot where: ''[:each | (each dynamicInstVarAt: #name) = ''''Janet'''']''
'