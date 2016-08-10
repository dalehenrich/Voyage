accessing
repository: aRepository
	repository ifNotNil: [ repository flush ].
	repository := aRepository