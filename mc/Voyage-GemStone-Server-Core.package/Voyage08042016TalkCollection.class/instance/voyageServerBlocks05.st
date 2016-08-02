examples
voyageServerBlocks05
  ^ '"Should be able to implement VORepository and save logic on server so that
code can be transparently executed on server or client ..."

[
	| repository pilot |
	repository := VOGemStoneRepository database: ''gemtalk example''.
	repository enableSingleton.
	pilot := VOTestPilot new
		name: ''Janet'';
		aux: 15;
		pet: (VOTestCat new
			name: ''Bond'';
			yourself);
		yourself.
	pilot save.

	VORepository current 
		selectOne: VOTestPilot 
		where: [ :each | (each name = ''Janet'') & (each aux > 10) ]
] voyageDoOnServer.
'