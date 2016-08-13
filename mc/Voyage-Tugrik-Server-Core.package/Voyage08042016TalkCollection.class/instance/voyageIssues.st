examples
voyageIssues
  ^ '"The only real drawback is the Voyage framework is not robust in the area of replication and synchronization --- of course we know how hard that problem is:)

- not suited for working with large complicated object graphs as graph needs to
  be reconstituted for each ''session''.
- replication/synchronization is not automatic
- root objects (isVoyageRoot) are the only objects that are not copied

Multiple in-image independent sessions is a good thing - separate threads in image can be safely modify different parts of object graph asynchronously 

Server blocks can make up for the replication deficiencies, but it''s not clear whether a pure server block approach is sufficient. 

I think that additional replication work is needed so that developers can start with a query to gather `root objects of interest` and than safely navigate the object graph on the client - at a performance cost. Then server blocks can be used to improve performance ...
"
VORepository current withSession: [:session | | pilots | "flush voyage object caches, acquire session, abort"
	"do something simple with a small set of objects on client"
	pilots := VORepository current selectMany: VOTestPilot where: [ :each | (each aux > 10) ].
	pilots do: [ :each | each aux: each aux + 10 ].
	pilots do: [ :each | each save ].
	session commit. "or abort to revert changes"
].

VORepository current withSession: [:session | | pilot | "flush voyage object caches, acquire session, abort"
	"do something simple locally"
	pilot := VORepository current selectOne: VOTestPilot where: [ :each | (each name: ''Dale'') ].
	pilot aux: 100.
	pilot save.
	"the something complicated on server"
	session onServerDo: [ 
		pilot doComplicatedAndExpensiveThing.
		System commit ].
].
'