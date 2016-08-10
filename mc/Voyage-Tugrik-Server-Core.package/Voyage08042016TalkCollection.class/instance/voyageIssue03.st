examples
voyageIssue03
  ^ '"Cross Image Issue
-----------------
Embedded references are not updated automatically when a parent object _is_ refreshed. --- implication is that each object must be refreshed before updating. However, if a parent object is changed then the graph appears to be refreshed. "

rep1 := VOTugrikRepository database: ''gemtalk example''.
rep2 := VOTugrikRepository database: ''gemtalk example''.
rep1 removeAll: VOTestPilot; removeAll: VOTestPet.

petOwner := VOTestPilot new
	name: ''Bond_Owner'';
	aux: 1;
	yourself.

pet := VOTestCat new
	name: ''Bond'';
	owner: petOwner;
	yourself.

pilot1 := VOTestPilot new
	name: ''Janet'';
	aux: ''1'';
	pet: pet;
	yourself.
rep1 save: pilot1.

pilot2 := rep2 selectOne: VOTestPilot where: [ :each | each name = ''Janet'' ].

pilot1 pet owner aux == pilot2 pet owner aux ifFalse:[ self error: ''oops'' ].

pilot1 aux: ''2''.
false ifTrue: [ rep1 save: pilot1 ].
pilot1 pet owner aux: 2.
rep1 save: pilot1 pet owner.

pilot2 := rep2 selectOne: VOTestPilot where: [ :each | each name = ''Janet'' ].

{ pilot1 aux. pilot2 aux}.
{ pilot1 pet owner aux. pilot2 pet owner aux}.
 
rep1 flush.
rep2 flush.
'