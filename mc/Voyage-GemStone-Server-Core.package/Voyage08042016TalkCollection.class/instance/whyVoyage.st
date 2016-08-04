examples
whyVoyage
  ^ '"I''m targetting Voyage, because it will be easier to introduce folks to GemStone/S. When new developers ask about persistence solutions for Pharo, they don''t necessarily want to hear that they ""should"" write their application in GemStone:) and once they have chosen one of the alternative persistence solutions (SandstoneDB[1], Reddit[2], GLORP[3], Voyage[4], etc.) they will have written their application in such a way that it would be difficult to port to GemStone. The alternative persistence methods are typically session-based:"

| pilot session |

"Voyage/SandstoneDB style"
pilot := VOTestPilot new name: ''Dale''.
pilot save: session.

pilot := session find: [''...''].
pilot name: ''Janet''.
pilot save: session.

"Glorp/Reddit style"
session begin.
pilot := VOTestPilot new name: ''Dale''.
session register: pilot.
session commit.

pilot := session find: [''...''].
pilot name: ''Janet''.
session commit.

"... and are written to expect multiple, concurrent session-based transactions to be applied to a subset of the objects in the image --- something that is just not possible when running _in_ GemStone. Consequently a developer can be faced with a virtual re-architecting of their applicaion to get it to run in GemStone.

By providing a GemStone backend for Voyage, it will be possible for developers to start using GemStone without needing to port their application first.

[1] http://onsmalltalk.com/sandstonedb-simple-activerecord-style-persistence-in-squeak
[2] https://medium.com/concerning-pharo/reddit-st-in-10-cool-pharo-classes-1b5327ca0740#.nzizkwlls
[3] https://ci.inria.fr/pharo-contribution/job/PharoBookWorkInProgress/lastSuccessfulBuild/artifact/book-result/Glorp/Glorp.pdf
[4] https://ci.inria.fr/pharo-contribution/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/EnterprisePharo.pdf
"
'