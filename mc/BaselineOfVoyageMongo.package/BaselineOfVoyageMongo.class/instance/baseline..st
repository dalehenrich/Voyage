accessing
baseline: spec
  <baseline>
  spec
    for: #'common'
    do: [ 
      spec
        package: 'Voyage-Shared-Data';
        yourself ].
  spec
    for: #'squeakCommon'
    do: [ 
      self magritte3: spec.
      self mongoTalk: spec.
      spec
        package: 'Voyage-Model-Core';
        package: 'Voyage-Memory-Core'
          with: [ spec requires: 'Voyage-Model-Core' ];
        package: 'Voyage-Seaside-Container'
          with: [ spec requires: 'Voyage-Model-Core' ];
        package: 'Voyage-Mongo-Core'
          with: [ spec requires: #('MongoTalk' 'Voyage-Model-Core') ];
        package: 'Voyage-Mongo-Magritte'
          with: [ spec requires: #('Magritte3' 'Voyage-Mongo-Core') ];
        package: 'Voyage-Mongo-Tests'
          with: [ spec includes: #('Voyage-Mongo-Tests2') ];
        package: 'Voyage-Shared-Data'
          with: [ spec requires: #('Voyage-Mongo-Tests') ];
        package: 'Voyage-Mongo-Tests2'
          with: [ spec requires: #('Voyage-Shared-Data') ];
        package: 'Voyage-Mongo-Utils'
          with: [ spec requires: #('Voyage-Mongo-Core') ].
      spec
        group: 'default' with: #('core' 'memory' 'mongo' 'tests');
        group: 'core' with: #('Voyage-Model-Core');
        group: 'memory' with: #('Voyage-Memory-Core');
        group: 'mongo'
          with:
            #('Voyage-Mongo-Core' 'Voyage-Mongo-Magritte' 'Voyage-Mongo-Utils');
        group: 'tests' with: #('Voyage-Mongo-Tests') ].
  spec
    for: #'pharo5.x'
    do: [ 
      self tugrik: spec.
      spec
        package: 'Voyage-GemStone-Core'
          with: [ spec requires: #('Tugrik' 'Voyage-Model-Core') ];
        package: 'Voyage-GemStone-Magritte'
          with: [ spec requires: #('Voyage-GemStone-Core' 'Voyage-Mongo-Magritte') ];
        package: 'Voyage-GemStone-Help'
          with: [ spec requires: #('Voyage-GemStone-Core') ];
        package: 'Voyage-GemStone-Tests'
          with: [ spec requires: #('Voyage-GemStone-Core' 'Voyage-Mongo-Tests') ];
        group: 'gemstone'
          with:
            #('core' 'mongo' 'Voyage-GemStone-Core' 'Voyage-GemStone-Magritte' 'Voyage-GemStone-Help');
        group: 'gemstone tests' with: #('Voyage-GemStone-Tests' 'tests');
        yourself ].
  spec
    for: #(#'gs3.2.x' #'gs3.3.x' #'gs3.4.x')
    do: [ 
      self tugrik: spec.
      spec
        package: 'Voyage-GemStone-Server-Core'
          with: [ 
              spec
                requires: #('Tugrik');
                includes: #('Voyage-Shared-Data');
                yourself ];
        package: 'Voyage-Shared-Data'
          with: [ spec requires: #('Voyage-GemStone-Server-Core') ];
        yourself.
      spec
        group: 'gemstone' with: #('Voyage-GemStone-Server-Core');
        group: 'gemstone tests' with: #('gemstone');
        yourself ]