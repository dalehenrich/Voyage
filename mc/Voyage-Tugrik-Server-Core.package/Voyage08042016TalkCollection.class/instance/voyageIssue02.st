examples
voyageIssue02
  ^ '"Cross Image Issue
-----------------
Client instances not automatically refreshed on change ... however, if one queries for root objects BEFORE working with it, one can cause local copies to be updated."

"rep1 and rep2 each have their own object cache, so this simulates two separate images"

rep1 := VOTugrikRepository database: ''gemtalk example''.
rep2 := VOTugrikRepository database: ''gemtalk example''.
rep1 removeAll: VOTestPilot.

pilot1 := VOTestPilot new
	name: ''Pilot1'';
	aux: 1;
	yourself.
rep1 save: pilot1.

pilot1 aux: pilot1 aux + 1. "2"
rep1 save: pilot1.

pilot2 := (rep2 selectAll: VOTestPilot) first.
pilot2 aux: pilot2 aux + 10. "12"
rep2 save: pilot2.

pilot1 aux: pilot1 aux + 1. "3"
rep1 save: pilot1.

{ pilot1 aux. pilot2 aux }.

(rep1 selectAll: VOTestPilot) collect: [:each | each aux].
(rep2 selectAll: VOTestPilot) collect: [:each | each aux].

{ pilot1 aux. pilot2 aux }.

rep1 flush.
rep2 flush.
'