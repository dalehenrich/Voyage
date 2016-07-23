running
tearDown
	super tearDown.
	repository ifNil: [ ^self ].
	repository flush.
	(VOTestObject allSubclasses collect: [ :each | each persistentClass ] as: Set)
		do: [ :each | repository removeAll: each ].
	repository flush.
	repository := nil