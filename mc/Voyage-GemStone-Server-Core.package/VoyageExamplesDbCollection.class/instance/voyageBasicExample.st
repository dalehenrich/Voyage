private
voyageBasicExample
  ^ '	repository := VORepository current.
	pilot := VOTestPilot new
		name: ''Janet'';
		pet: (VOTestDog new name: ''Atreyu'').
	pilot save.
		pilot := VOTestPilot new
		name: ''Dale'';
		pet: (VOTestDog new name: ''Elsa'').
	pilot save
'