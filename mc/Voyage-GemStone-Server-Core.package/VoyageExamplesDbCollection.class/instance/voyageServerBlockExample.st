private
voyageServerBlockExample
  ^ '	"(VOGemStoneRepository database: ''my example'') enableSingleton".
	"VORepository current"

	[3+4] doOnServer.

	[self halt] doOnServer.

	[self halt] doOnServer: VORepository current.
'