Voyage [![Build Status](https://travis-ci.org/pharo-nosql/voyage.png)](http://travis-ci.org/pharo-nosql/voyage)
======

Voyage is an object persistence abstraction layer for Pharo.

Voyage is a common layer for different backends but currently it supports just two: an in-memory layer and a backend for the MongoDB database (http://mongodb.org). 
There is a third backend for [GemStone/S 64](https://gemtalksystems.com/products/gs64/) that is in the **proof of concept** stage.

## Documentation

### Pharo for the enterprise book
Voyage is part of the upcoming "Pharo for the Enterprise 2" book, and Johan Fabry (along with Damien Cassou) has written a nice chapter on it: [HTML](https://ci.inria.fr/pharo-contribution/job/EnterprisePharoBook/ws/book-result/Voyage/Voyage.html) / [PDF](https://ci.inria.fr/pharo-contribution/job/EnterprisePharoBook/ws/book-result/Voyage/Voyage.pdf)

### Others
- http://smallworks.eu/web/blog/2013-06-14-voyage-the-adventure
- http://smallworks.eu/web/blog/2013-07-18-Voyage-advanced-queries
- [Voyage by example, talk at ESUG 2014](http://smallworks.eu/web/blog/2014-08-21-VoyageByExample)

## MongoDB
###Install

Just install it from you Pharo catalog. 

You can also install it executing this script:

```Smalltalk
Metacello new 
	repository: 'github://pharo-nosql/voyage/mc';
	baseline: 'VoyageMongo';
	load.
```

## GemStone/S 64
The GemStone/S 64 backend for Voyage is based upon [Tugrik](https://github.com/dalehenrich/Tugrik) a persistence layer for Pharo5.0 that is compatible with the [MongoTalk](https://github.com/pharo-nosql/mongotalk) Smalltalk API.

### Proof of Concept
At this stage, Tugrik is [passing all of the Mongo tests](https://travis-ci.org/dalehenrich/Tugrik#L1891) and VoyageGemStone is [passing all of the VoyageMongo tests](https://travis-ci.org/dalehenrich/voyage/jobs/136800410#L1989). 
In total there are a little over 100 tests, so the work is far from complete, but it is encouraging to be at this stage.

#### Install GsDevKit_home

The following are based on the [GsDevKit_home installation instructions][6]:

```
# Install GsDevKit_home
git clone https://github.com/GsDevKit/GsDevKit_home.git
cd GsDevKit_home
. bin/defHOME_PATH.env # define $GS_HOME in your shell ... needed when running GsDevKit_home shell commands
installServerClient

# Create tODE client
createClient tode
```

#### Create Tugrik stone and Voyage client

```
# Create Voyage stone
createStone -u http://gsdevkit.github.io/GsDevKit_home/VoyageMongo.ston -i Voyage -l voyage Voyage 3.3.1

# Create Voyage Pharo5.0 client
createClient -t pharo voyage -l -v Pharo5.0 -z $GS_HOME/shared/repos/voyage/.smalltalk_gemstone.ston

# Start interactive Voyage client
startClient voyage -s Voyage
```

[6]: https://github.com/GsDevKit/GsDevKit_home#installation

