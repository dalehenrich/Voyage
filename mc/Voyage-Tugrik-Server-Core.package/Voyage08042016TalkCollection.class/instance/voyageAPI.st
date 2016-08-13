examples
voyageAPI
  ^ '"Repository Creation"
"Instance mode - any number of connected repositories"

repository := VOTugrikRepository database: ''gemtalk example''.

repository := VOTugrikRepository 
	sessionDescription: aSessionDescription 
	database: ''gemtalk example''.

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


An Example session description:

	TDSessionDescription {
		#name : ''Tugrik'',
		#stoneHost : ''foos'',
		#stoneName : ''Tugrik'',
		#gemHost : ''foos'',
		#netLDI : ''Tugrik_ldi'',
		#netLDIPort : ''43821'',
		#gemTask : ''gemnetobject'',
		#userId : ''DataCurator'',
		#password : ''swordfish'',
		#osUserId : nil,
		#osPassword : nil,
		#gemstoneVersion : ''3.3.0'' }
"
'