examples
voyageServerBlockExample
  ^ '	"(VOGemStoneRepository database: ''my example'') enableSingleton".
	"VORepository current"
	"VORepository current dropDatabase"

	[3+4] voyageDoOnServer.

	[self halt] voyageDoOnServer.

	[self halt] voyageDoOnServer: VORepository current.
'