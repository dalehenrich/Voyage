queries
createCollection
  super createCollection.
  {(Dictionary new
    at: #'name' put: 'Voyage Basic';
    at: #'order' put: 1;
    at: #'contents' put: self voyageBasicExample;
    yourself)} do: [ :dict | self doInsert: dict ]