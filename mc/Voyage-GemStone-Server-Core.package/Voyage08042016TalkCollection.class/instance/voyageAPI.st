examples
voyageAPI
  ^ '"Repository Creation"
"Instance mode - any number of connected repositories"

repository := VOGemStoneRepository database: ''gemtalk example''.

"Singleton mode - single, image-wide repository instance"

repository enableSingleton.

"
SINGLETON MODE:
---------------
save			stores an object into repository (insert or update)
remove			removes an object from repository
removeAll		removes all objects of class from repository
selectAll		retrieves all objects of some kind
selectOne:		retrieves first object that matches the argument
selectMany:	retrieves all objects that matches the argument
"

"
INSTANCE MODE:
---------------
save:				stores an object into repository (insert or update)
remove:				removes an object from repository
removeAll:			removes all objects of class from repository
selectAll:			retrieves all objects of some kind
selectOne:where:	retrieves first object that matches the where clause
selectMany:where:	retrieves all objects that matches the where clause
"
'