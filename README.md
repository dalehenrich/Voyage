Voyage [![Build Status](https://travis-ci.org/pharo-nosql/voyage.png)](http://travis-ci.org/pharo-nosql/voyage)
======


Voyage is an object persistence abstraction layer for Pharo.

Install
-------

Just install it from you Pharo catalog. 

You can also install it executing this script:

```Smalltalk
Metacello new 
	repository: 'github://pharo-nosql/voyage/mc';
	baseline: 'VoyageMongo';
	load.
```

Documentation
-------------
### Pharo for the enterprise book
Voyage is part of the upcoming "Pharo for the Enterprise 2" book, and Johan Fabry (along with Damien Cassou) has written a nice chapter on it: [HTML](https://ci.inria.fr/pharo-contribution/job/EnterprisePharoBook/ws/book-result/Voyage/Voyage.html) / [PDF](https://ci.inria.fr/pharo-contribution/job/EnterprisePharoBook/ws/book-result/Voyage/Voyage.pdf)

Voyage GemStone installation
---

### Install GsDevKit_home

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

### Create Tugrik stone and Voyage client

```
# Clone MongoTalk
cd $GS_HOME/shared/repos
git clone https://github.com/pharo-nosql/mongotalk.git

# Clone Voyage
cd $GS_HOME/shared/repos
git clone https://github.com/dalehenrich/voyage.git

# Create Tugrik stone
createStone -u http://gsdevkit.github.io/GsDevKit_home/Tugrik.ston -i Tugrik -l Tugrik Voyage 3.3.0

# Create Voyage Pharo5.0 client
createClient -t pharo voyage_50 -l -v Pharo5.0 -z $GS_HOME/shared/repos/voyage/.smalltalk_gemstone.ston

# Start interactive Voyage client
startClient voyage_50 -s Voyage
```


### Others
- http://smallworks.eu/web/blog/2013-06-14-voyage-the-adventure
- http://smallworks.eu/web/blog/2013-07-18-Voyage-advanced-queries
- [Voyage by example, talk at ESUG 2014](http://smallworks.eu/web/blog/2014-08-21-VoyageByExample)

[6]: https://github.com/GsDevKit/GsDevKit_home#installation

