accessing
baseline: spec
	<baseline>
	
	spec for: #common do: [
		spec
			package: 'Voyage-Model-Core';
			package: 'Voyage-Model-Tests' with: [ spec requires: 'Voyage-Model-Core' ];
		 	package: 'Voyage-JSON-Core' with: [ spec requires: #('Voyage-Model-Core' 'Magritte3')];
			package: 'Voyage-JSON-Tests' with: [ spec requires: 'Voyage-JSON-Core' ];
			yourself.
		spec
			group: 'core' with: #('Voyage-Model-Core' 'Voyage-JSON-Core');
			group: 'core tests' with: #('Voyage-Model-Tests' 'Voyage-JSON-Tests');
			yourself
	].
	spec for: #pharo do: [
		self magritte3: spec.
		self mongoTalk: spec.
		self punqlite: spec.		
		spec
			"core"
			package: 'Voyage-Pharo-Model-Core';
			package: 'Voyage-Model-Core' with: [ spec includes: 'Voyage-Pharo-Model-Core' ];
			package: 'Voyage-Pharo-Model-Tests' with: [ spec requires: 'Voyage-Pharo-Model-Core' ];
			package: 'Voyage-Memory-Core' with: [ spec requires: 'Voyage-Model-Core' ];
			package: 'Voyage-Pharo-JSON';
			package: 'Voyage-JSON-Core' with: [ spec requires: #('Voyage-Pharo-JSON') ];
			"mongo"
			package: 'Voyage-Mongo-Core' with: [ spec requires: #('MongoTalk' 'Voyage-Model-Core' 'Voyage-Mongo-JSON') ];
			package: 'Voyage-Mongo-JSON' with: [ spec requires: #('Voyage-JSON-Core') ];
			package: 'Voyage-Mongo-Tests';
			"unqlite"
			package: 'Voyage-UnQLite' with: [ spec requires: #('PunQLite' 'Voyage-Model-Core' 'Voyage-JSON-Core') ];
			package: 'Voyage-UnQLite-Tests';			
			"utils"
			package: 'Voyage-Seaside-Container' with: [ spec requires: 'Voyage-Model-Core' ];
			package: 'Voyage-Mongo-Utils' with: [ spec requires: #('Voyage-Mongo-Core') ].
			
		spec
			group: 'default' with: #('core' 'memory' 'mongo tests');
			group: 'core tests' with: #('Voyage-Pharo-Model-Core');
			group: 'memory' with: #('Voyage-Memory-Core');
			group: 'mongo' with: #( 'Voyage-Mongo-Core' 'Voyage-Mongo-Utils');
			group: 'mongo tests' with: #('mongo' 'core tests' 'Voyage-Mongo-Tests');
			group: 'unqlite' with: #( 'Voyage-UnQLite');
			group: 'unqlite tests' with: #('unqlite' 'core tests' 'Voyage-UnQLite-Tests') ].
	spec for: #'pharo5.x' do: [
		self tugrik: spec.
		spec
			package: 'Voyage-Tugrik-Core' with: [ spec requires: #('Tugrik' 'Voyage-JSON-Core' 'Voyage-Mongo-Core') ];
			package: 'Voyage-Tugrik-Help' with: [ spec requires: #('Voyage-Tugrik-Core') ];
			package: 'Voyage-Tugrik-Tests' with: [ spec requires: #('Voyage-Tugrik-Core' 'Voyage-Model-Tests' 'Voyage-Mongo-Tests') ];
			yourself.
		spec
			group: 'tugrik' with: #('core' 'Voyage-Tugrik-Core' 'Voyage-Tugrik-Help' 'Voyage-Mongo-Utils');
			group: 'tugrik tests' with: #('tugrik' 'Voyage-Tugrik-Tests' 'core tests' 'mongo tests');
        yourself ].
	spec for: #(#'gs3.2.x' #'gs3.3.x' #'gs3.4.x') do: [ 
		self tugrik: spec.
		spec 
			baseline: 'Magritte3' with: [
				spec
					loads: #('Core');
					repository: 'github://GsDevKit/Magritte3:master/repository' ];
			baseline: 'MongoTalk' with: [ 
				spec 
					loads: #('Core' 'Tests');
					repository: 'github://dalehenrich/mongotalk:tugrik/mc';
					yourself ];
			yourself.
		spec 
			package: 'Voyage-GemStone-JSON';
			package: 'Voyage-JSON-Core' with: [ spec  requires: #('Voyage-GemStone-JSON')];
			package: 'Voyage-Mongo-JSON' with: [ spec requires: #('Voyage-JSON-Core') ];
			package: 'Voyage-Tugrik-Server-Core' with: [ spec requires: #('Tugrik' 'Voyage-Model-Core' 'Voyage-JSON-Core' 'Voyage-Mongo-JSON' 'MongoTalk')];
			package: 'Voyage-Tugrik-Server-Tests' with: [ spec requires: #('Voyage-Tugrik-Server-Core')];
			yourself.
		spec
			group: 'tugrik' with: #('core' 'Voyage-Tugrik-Server-Core');
			group: 'tugrik tests' with: #('core tests' 'tugrik' 'Voyage-Tugrik-Server-Tests');
			yourself ]