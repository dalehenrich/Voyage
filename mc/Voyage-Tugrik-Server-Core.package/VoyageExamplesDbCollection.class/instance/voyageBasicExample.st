examples
voyageBasicExample
  ^ '	"(VOTugrikRepository database: ''my example'') enableSingleton"
	"VORepository current"
	"VORepository current dropDatabase"

	pilot := VOTestPilot new
		name: ''Janet'';
		pet: (VOTestDog new name: ''Atreyu'').
	pilot keywords add: ''Smalltalk''.
	pilot keywords add: ''Argentina''.
	pilot save.

	pilot := VOTestPilot new
		name: ''Dale'';
		pet: (VOTestDog new name: ''Elsa'').
	pilot keywords add: ''Smalltalk''.
	pilot save.
	
	mongoQuery :=  Dictionary new
		at: ''keywords'' put: (Dictionary new 
			at: ''$all'' put: #(''Smalltalk'' ''Argentina'');
			yourself );
		yourself.
		
	VORepository current selectMany: VOTestPilot where: mongoQuery.
'