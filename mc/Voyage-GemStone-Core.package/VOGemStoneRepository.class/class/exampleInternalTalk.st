examples
exampleInternalTalk
	"self exampleInternalTalk"

	| tugrik db collection sorted group pg |
	tugrik := Tugrik default.
	[ tugrik open.
	db := tugrik databaseNamed: 'voyage examples'.
	collection := db getCollection: 'Internal Talk'.
	sorted := SortedCollection sortBlock: [ :a :b | (a at: #order) <= (b at: #order) ].
	collection do: [ :each | sorted add: each ].
	group := GroupWindowMorph new.
	sorted
		do: [ :each | 
			pg := GTPlayground openContents: (each at: #contents) label: (each at: #name).
			pg title: (each at: #name).
			group addWindow: pg window ].
	(group openInWindowLabeled: 'GemTalk Internal Talk')
		extent: 840 @ 720;
		yourself ]
		ensure: [ tugrik close ]