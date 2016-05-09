accessing
baseline: spec
	<baseline>
	
	spec for: #common do: [
		self magritte3: spec.
		self mongoTalk: spec.
		
		spec
			package: 'Voyage-Model-Core';
			package: 'Voyage-Memory-Core' with: [ spec requires: 'Voyage-Model-Core' ];
			package: 'Voyage-Seaside-Container' with: [ spec requires: 'Voyage-Model-Core' ];
			package: 'Voyage-Mongo-Core' with: [ spec requires: #('MongoTalk' 'Voyage-Model-Core') ];
			package: 'Voyage-Mongo-Magritte' with: [ spec requires: #('Magritte3' 'Voyage-Mongo-Core') ];

			package: 'Voyage-Mongo-Tests';
			package: 'Voyage-Mongo-Utils' with: [ spec requires: #('Voyage-Mongo-Core') ].
			
		spec
			group: 'default' with: #('core' 'memory' 'mongo' 'tests');
			group: 'core' with: #('Voyage-Model-Core');
			group: 'memory' with: #('Voyage-Memory-Core');
			group: 'mongo' with: #('Voyage-Mongo-Core' 'Voyage-Mongo-Magritte' 'Voyage-Mongo-Utils');
			group: 'tests' with: #('Voyage-Mongo-Tests') ].

	spec for: #'pharo5.x' do: [
		self tugrikTalk: spec.
		
		spec
			package: 'Voyage-GemStone-Core' with: [ spec requires: #('TugrikTalk' 'Voyage-Model-Core') ];
			package: 'Voyage-GemStone-Magritte' with: [ spec requires: #('Voyage-GemStone-Core' 'Voyage-Mongo-Magritte') ];

			package: 'Voyage-GemStone-Tests' with: [ spec requires: #('Voyage-GemStone-Core' 'Voyage-Mongo-Tests') ];

			group: 'gemstone' with: #('core' 'mongo' 'Voyage-GemStone-Core' 'Voyage-GemStone-Magritte');
			group: 'gemstone tests' with: #('Voyage-GemStone-Tests' 'tests');
         yourself ].

	spec for: #'gs3.3.x' do: [

		spec
			baseline: 'TugrikTalk'
			with: [ spec
				loads: #('CI');
				repository: 'github://dalehenrich/Tugrik:master/repository' ].

		spec
			group: 'gemstone' with: #('gemstone tests');
			group: 'gemstone tests' with: #('Tugrik');
         yourself ]

