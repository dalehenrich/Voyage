queries
createExampleCollection
  {(Dictionary new
    at: #'name' put: 'What is Voyage/Tugrik?';
    at: #'order' put: 2;
    at: #'contents' put: self whatIsTugrik;
    yourself).
  (Dictionary new
    at: #'name' put: 'Why Voyage/Tugrik?';
    at: #'order' put: 1;
    at: #'contents' put: self whyVoyage;
    yourself).
  (Dictionary new
    at: #'name' put: 'Voyage API';
    at: #'order' put: 5;
    at: #'contents' put: self voyageAPI;
    yourself).
  (Dictionary new
    at: #'name' put: 'Object Storage';
    at: #'order' put: 10;
    at: #'contents' put: self voyageObjectStorage;
    yourself).
  (Dictionary new
    at: #'name' put: 'Embedding Objects';
    at: #'order' put: 15;
    at: #'contents' put: self voyageEmbeddingObjects;
    yourself).
  (Dictionary new
    at: #'name' put: 'Referencing other roots';
    at: #'order' put: 20;
    at: #'contents' put: self voyageReferencingRoots;
    yourself).
  (Dictionary new
    at: #'name' put: 'Queries';
    at: #'order' put: 25;
    at: #'contents' put: self voyageQuerying01;
    yourself).
  (Dictionary new
    at: #'name' put: 'Server Blocks I';
    at: #'order' put: 30;
    at: #'contents' put: self voyageServerBlocks01;
    yourself).
  (Dictionary new
    at: #'name' put: 'Server Blocks II';
    at: #'order' put: 35;
    at: #'contents' put: self voyageServerBlocks02;
    yourself).
  (Dictionary new
    at: #'name' put: 'Server Blocks III';
    at: #'order' put: 40;
    at: #'contents' put: self voyageServerBlocks03;
    yourself).
  (Dictionary new
    at: #'name' put: 'Class Mapping';
    at: #'order' put: 45;
    at: #'contents' put: self voyageClassMapping01;
    yourself).
  (Dictionary new
    at: #'name' put: 'Server Blocks IV';
    at: #'order' put: 50;
    at: #'contents' put: self voyageServerBlocks04;
    yourself).
  (Dictionary new
    at: #'name' put: 'Evenutually...';
    at: #'order' put: 55;
    at: #'contents' put: self voyageServerBlocks05;
    yourself)} do: [ :dict | self doInsert: dict ]