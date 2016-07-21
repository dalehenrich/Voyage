running
tearDown
	super tearDown.
	repository flush.
	(VOTestObject allSubclasses collect: [ :each | each persistentClass ] as: Set)
		do: [ :each | repository removeAll: each ].
	repository flush.
	repository := nil