pages
voyageServer
	^ HelpTopic 
		title: 'Voyage Server'
		contents: 
'The following bash script creates a stone named "Voyage" with the Voyage server code installed using GemStone 3.3.0[1]:

	createStone -u http://gsdevkit.github.io/GsDevKit_home/VoyageMongo.ston -i VoyageMongo -l VoyageMongo Voyage 3.3.0

The ''-u http://gsdevkit.github.io/GsDevKit_home/VoyageMongo.ston'' option references a tODE project entry that describes how the VoyageMongo project should be installed in the server:

	^ TDProjectSpecEntryDefinition new
    baseline: ''VoyageMongo''
      repository: ''filetree://$GS_HOME/shared/repos/voyage/mc''
      loads: #(''gemstone'');
    installScript:
        ''
      project clone --https --local --etc --gitRoot=$GS_HOME/shared/repos --checkout=tugrik --github=dalehenrich/mongotalk
      project install --local --url=http://gsdevkit.github.io/GsDevKit_home/Tugrik.ston
      project clone --https --local VoyageMongo'';
    postLoadScript:
        ''mount @/sys/stone/dirs/VoyageMongo/gsdevkit/tode /home voyage'';
    status: #(#''inactive'');
    locked: true;
    yourself

The ''-i'' option on the createStone command indicates that the install script in the project entry should be run:

	project clone --https --local VoyageMongo

`project clone` is a tODE command that arranges to clone the github repository for VoyageMongo (https://github.com/dalehenrich/voyage) into the GsDevKit_home environment as $GS_HOME/shared/repos/voyage.

The ''-l'' option indicates that the VoyageMongo project should be loaded into the stone.

After the createStone command completes, the directory $GS_HOME/server/stone/Voyage contains all of the stone-related files. 

The createStone command starts the stone[3] and netldi[4] processes. The stone and netldi are managed independently by GsDevKit_home shell scripts. The netldi process must be running in order for a client process to connect to the stone.

The following bash shell scripts are used for managing your Voyage stone:

	stones                # list information about the installed and running stones 

	stopStone Voyage      # stop the Voyage stone
	stopNetldi Voyage     # stop the Voyage netldi
	stopStone -b Voyage   # stop the Voyage stone and netldi

	startStone Voyage     # start the Voyage stone
	startNetldi           # start the Voyage netldi
	startStone -b Voyage  # start the Voyage stone and netldi

	deleteStone Voyage    # stop the Voyage stone and netldi, then delete the Voyage stone from disk

[1] https://gemtalksystems.com/products/gs64/versions33x/
[2] https://downloads.gemtalksystems.com/docs/GemStone64/3.3.x/GS64-SysAdminGuide-3.3/3-Distributed.htm#pgfId-84507
[3] https://downloads.gemtalksystems.com/docs/GemStone64/3.3.x/GS64-SysAdminGuide-3.3/GS64-SysAdminGuide-3.3.htm
[4] https://downloads.gemtalksystems.com/docs/GemStone64/3.3.x/GS64-SysAdminGuide-3.3/GS64-SysAdminGuide-3.3.htm'