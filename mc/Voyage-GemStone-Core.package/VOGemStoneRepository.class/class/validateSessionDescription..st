testing
validateSessionDescription: sessionDescription
	| tugrik |
	tugrik := Tugrik sessionDescription: sessionDescription.
	^ [ tugrik todeClient logout true ]
		on: Error
		do: [ :e | false ]