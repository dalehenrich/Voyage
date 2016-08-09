*Voyage-Tugrik-Tests
testEmbeddedRootObjectRefs03
	| pilot1 pilot2 ar aux |
	pilot1 := VOTestPilot new
		name: 'Pilot1';
		yourself.
	self repository save: pilot1.
	ar := {1.
	1.1.
	'sss'.
	true.
	nil.
	pilot1}.
	pilot2 := VOTestPilot new
		name: 'Pilot2';
		aux: ar;
		yourself.
	self repository save: pilot2.
	true
		ifTrue: [ self repository cache flush ].
	pilot1 := self repository selectOne: VOTestPilot where: [ :each | each name = 'Pilot1' ].
	pilot2 := self repository selectOne: VOTestPilot where: [ :each | each name = 'Pilot2' ].
	Transcript cr; show: '[1]'.
	aux := pilot2 aux asArray.
	Transcript cr; show: '[2]'.
	self assert: (aux at: 6) yourself== pilot1.
	self assert: (aux at: 6) == pilot1.
	self assert: (aux at: 6) = pilot1.
	Transcript cr; show: '[3]'.
	self halt.
	self assert: aux = ar