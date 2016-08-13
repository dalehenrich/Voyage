running
tearDown
	super tearDown.
	repository2
		ifNotNil: [ repository2 flush.
			repository2 := nil ].
	repository ifNil: [ ^ self ].
	repository flush.
	(VOTestObject allSubclasses collect: [ :each | each persistentClass ] as: Set) do: [ :each | repository removeAll: each ].
	repository flush.
	repository := nil