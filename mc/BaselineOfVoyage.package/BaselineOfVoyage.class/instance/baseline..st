accessing
baseline: spec
	<baseline>
	
	spec for: #pharo do: [
		self magritte3: spec.
		self mongoTalk: spec.
		self punqlite: spec.		
		spec
			"core"
			package: 'Voyage-Model-Core';
			package: 'Voyage-Model-Tests' with: [ spec requires: 'Voyage-Model-Core' ];
			package: 'Voyage-Memory-Core' with: [ spec requires: 'Voyage-Model-Core' ];
			package: 'Voyage-JSON' with: [ spec requires: #('Voyage-Model-Core' 'Magritte3') ];
			package: 'Voyage-JSON-Tests' with: [ spec requires: 'Voyage-JSON' ];
			"mongo"
			package: 'Voyage-Mongo-Core' with: [ spec requires: #('MongoTalk' 'Voyage-Model-Core') ];
			package: 'Voyage-Mongo-Tests';
			"unqlite"
			package: 'Voyage-UnQLite' with: [ spec requires: #('PunQLite' 'Voyage-Model-Core') ];
			package: 'Voyage-UnQLite-Tests';			
			"utils"
			package: 'Voyage-Seaside-Container' with: [ spec requires: 'Voyage-Model-Core' ];
			package: 'Voyage-Mongo-Utils' with: [ spec requires: #('Voyage-Mongo-Core') ].
			
		spec
			group: 'default' with: #('core' 'memory' 'mongo tests');
			group: 'core' with: #('Voyage-Model-Core');
			group: 'core tests' with: #('Voyage-Model-Tests' 'Voyage-JSON-Tests');
			group: 'memory' with: #('Voyage-Memory-Core');
			group: 'mongo' with: #('Voyage-JSON' 'Voyage-Mongo-Core' 'Voyage-Mongo-Utils');
			group: 'mongo tests' with: #('mongo' 'core tests' 'Voyage-Mongo-Tests');
			group: 'unqlite' with: #('Voyage-JSON' 'Voyage-UnQLite');
			group: 'unqlite tests' with: #('unqlite' 'core tests' 'Voyage-UnQLite-Tests') ].
	spec for: #'pharo5.x' do: [
		self tugrik: spec.
		spec
			package: 'Voyage-GemStone-Core' with: [ spec requires: #('Tugrik' 'Voyage-JSON' 'Voyage-Model-Core') ];
			package: 'Voyage-GemStone-Help' with: [ spec requires: #('Voyage-GemStone-Core') ];
			package: 'Voyage-GemStone-Tests' with: [ spec requires: #('Voyage-GemStone-Core' 'Voyage-Model-Tests') ];
			yourself.
		spec
			group: 'gemstone' with: #('core' 'Voyage-GemStone-Core' 'Voyage-GemStone-Help');
			group: 'gemstone tests' with: #('gemstone' 'Voyage-GemStone-Tests' 'core tests');
        yourself ].
	spec for: #(#'gs3.2.x' #'gs3.3.x' #'gs3.4.x') do: [ 
		self tugrik: spec.
		spec 
			baseline: 'Magritte3' with: [
				spec
					loads: #('Core');
					repository: 'github://GsDevKit/Magritte3:v3.?/repository' ].
		spec 
			package: 'Voyage-GemStone-Server-Core' with: [ spec requires: #('Tugrik')];
			yourself.
		spec
			group: 'gemstone' with: #('Voyage-GemStone-Server-Core');
			group: 'gemstone tests' with: #('gemstone');
			yourself ]