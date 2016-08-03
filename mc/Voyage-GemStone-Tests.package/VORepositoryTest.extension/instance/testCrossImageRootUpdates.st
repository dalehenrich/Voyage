*Voyage-GemStone-Tests
testCrossImageRootUpdates
	| rep1 rep2 pilot1 pilot2 |
	rep1 := self repository.
	rep2 := self repository2.
	rep1 removeAll: VOTestPilot.
	pilot1 := VOTestPilot new
		name: 'Pilot1';
		aux: 1;
		yourself.
	rep1 save: pilot1.
	pilot1 aux: pilot1 aux + 1.	"2"
	rep1 save: pilot1.
	pilot2 := (rep2 selectAll: VOTestPilot) first.
	pilot2 aux: pilot2 aux + 10.	"12"
	rep2 save: pilot2.
	pilot1 aux: pilot1 aux + 1.	"3"
	rep1 save: pilot1.
	self deny: pilot1 aux = pilot2 aux.	"this is not necessarily expected behavior"
	(rep1 selectAll: VOTestPilot) collect: [ :each | each aux ].
	(rep2 selectAll: VOTestPilot) collect: [ :each | each aux ].
	self assert: pilot1 aux = pilot2 aux	"after refreshing root object with a query we are in synch --- which is goos"