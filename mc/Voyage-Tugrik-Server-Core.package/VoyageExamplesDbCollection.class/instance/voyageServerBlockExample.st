examples
voyageServerBlockExample
  ^ '	"(VOTugrikRepository database: ''my example'') enableSingleton".
	"VORepository current"
	"VORepository current dropDatabase"

	[3 + 4] voyageDoOnServer.

	[3 + 4] voyageDoOnServer: VORepository current.

	[3 foo] voyageDoOnServer.

	[[3 foo] voyageDoOnServer] on: Error do: [:ex | self halt ].

'