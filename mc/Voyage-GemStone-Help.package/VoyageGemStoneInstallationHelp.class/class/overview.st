pages
overview
	^ HelpTopic 
		title: 'Overview'
		contents: 
'Voyage GemStone is variant of Voyage[1] that uses a GemStone/S 64 database for persistence.

GsDevKit_home[1] is used to create and manage a collection of GemStone/S databases or "stones". GsDevKit_home can also be used to create a manage a collection of Pharo images. GsDevKit_home may be installed on Ubunutu 14.04, CentOS, OSX and Windows (client only).

The following bash script installs GsDevKit_home and then clones the GitHub repositories used by this project, creates a Voyage stone, a voyage client, and a tODE client:

	#--------
	# Setup
	#--------
	# Install GsDevKit_home
	git clone https://github.com/GsDevKit/GsDevKit_home.git
	# define the $GS_HOME env variable (required) and add $GS_HOME/bin to your path
	cd GsDevKit_home
	. bin/defHOME_PATH.env  
	installServerClient
	
	#--------
	# Create Voyage server
	#--------
	createStone -u http://gsdevkit.github.io/GsDevKit_home/VoyageMongo.ston -i VoyageMongo -l VoyageMongo Voyage 3.3.1

	#--------
	# Create Clients
	#--------
	# Create voyage client
	createClient -t pharo voyage -l -v Pharo5.0 -z $GS_HOME/shared/repos/voyage/.smalltalk_gemstone.ston

	# Create tODE client
	createClient tode
	
	#--------
	# Setup for Automatic updates
	#--------
	# For automatic updates of shared project repositories
	cp $GS_HOME/shared/repos/Tugrik/gsdevkit/cloneUpdate $GS_HOME/sys/local/gsdevkit_bin

	#--------
	# Update shared project repositories, refresh clients and server
	#--------
	# Update shared project repositories and refresh clients
	updateGsDevKit -gsc
	
	# refresh Voyage stone
	todeIt Voyage project load VoyageMongo

**IMPORTANT NOTE** 
Before running any of the bash scripts in this help document, you must have the $GS_HOME env var defined and $GS_HOME/bin should be in your path. The easiest way to do that is to include the following in your .bashrc file:

	. <path-to-GsDevKit_home>/bin/defHOME_PATH.env

[1] https://github.com/GsDevKit/GsDevKit_home
'