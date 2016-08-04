examples
voyageIssue01
  ^ '"non-root embedded objects are copied. The following code executed in GemStone would be consistent."

sharedArray := {''Blue''}.
pilot1 := VOTestPilot new
	name: ''Pilot1'';
	aux: sharedArray;
	yourself.
pilot1 save.

sharedArray at: 1 put: ''Red''.

pilot2 := VOTestPilot new
	name: ''Pilot2'';
	aux: sharedArray;
	yourself.
pilot2 save.

(VORepository current selectOne: VOTestPilot where: [ :each | each name = ''Pilot2'' ]) aux.
(VORepository current selectOne: VOTestPilot where: [ :each | each name = ''Pilot1'' ]) aux.

VORepository current flush. "Clear the object cache and force replication of object"
(VORepository current selectOne: VOTestPilot where: [ :each | each name = ''Pilot1'' ]) aux.

'