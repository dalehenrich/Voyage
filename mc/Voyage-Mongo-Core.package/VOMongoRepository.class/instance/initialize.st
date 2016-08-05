initialization
initialize 
	super initialize.
	self forceEager: false.
	self versionGenerator: self defaultVersionGenerator.
	self initializeCache.
	self initializeResolver.
