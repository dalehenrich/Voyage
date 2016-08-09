tests
testCount
  | pilot pilot2 pilot3 answer |
  pilot := VOTestPilot new
    name: 'Pilot1';
    yourself.
  pilot2 := VOTestPilot new
    name: 'Pilot2';
    yourself.
  pilot3 := VOTestPilot new
    name: 'Pilot3';
    yourself.
  self repository
    save: pilot;
    save: pilot2;
    save: pilot3.
  answer := self repository count: VOTestPilot.
  self assert: answer = 3