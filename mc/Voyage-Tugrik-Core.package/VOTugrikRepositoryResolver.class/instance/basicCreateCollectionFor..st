private persistence
basicCreateCollectionFor: aClass
	^ self pool withDatabase: [ :db | self collectionAt: aClass inDatabase: db ]