queries
createExampleCollection
  {(Dictionary new
    at: #'name' put: 'Install and Update';
    at: #'order' put: 1;
    at: #'contents' put: self installGitFileTree;
    yourself).
  (Dictionary new
    at: #'name' put: 'Voyage Basic';
    at: #'order' put: 2;
    at: #'contents' put: self voyageBasicExample;
    yourself).
  (Dictionary new
    at: #'name' put: 'Voyage Server Block';
    at: #'order' put: 5;
    at: #'contents' put: self voyageServerBlockExample;
    yourself).
  (Dictionary new
    at: #'name' put: 'Voyage Server Block Query';
    at: #'order' put: 10;
    at: #'contents' put: self voyageServerBlockQueryExample;
    yourself).
  (Dictionary new
    at: #'name' put: 'Voyage Switch to Class Mapping';
    at: #'order' put: 15;
    at: #'contents' put: self voyageSwitchToClassMapping;
    yourself).
  (Dictionary new
    at: #'name' put: 'Voyage Server Block Scoping I';
    at: #'order' put: 20;
    at: #'contents' put: self voyageServerBlockScopingExample01;
    yourself).
  (Dictionary new
    at: #'name' put: 'Voyage Server Block Scoping II';
    at: #'order' put: 25;
    at: #'contents' put: self voyageServerBlockScopingExample02;
    yourself).
  (Dictionary new
    at: #'name' put: 'Transaction Conflicts';
    at: #'order' put: 30;
    at: #'contents' put: self voyageTransactionConflicts;
    yourself).
  (Dictionary new
    at: #'name' put: 'Voyage Server Block Set Breakpoint';
    at: #'order' put: 35;
    at: #'contents' put: self voyageSetBreakPointForServerBlock;
    yourself)} do: [ :dict | self doInsert: dict ]