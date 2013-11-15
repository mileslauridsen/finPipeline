#!/bin/bash

### Check OS and set paths accordingly based on that info ###

UNAME=`uname`

### Shared Server and multiple use items. Change this based on FIN location
## Make a linux version here

if [ "$UNAME" == "Darwin" ]; then
    ### mobile servers
    if [[ -d "/Users/mileslauridsen/Dropbox/PRODUCTION/" ]];
    then
            # Stupid whitespace in Google Drive Path so using * to pass the "Google\ Drive" portion of the path
            export LOCAL_SERVER="/Users/mileslauridsen/Dropbox/PRODUCTION"
            export LOCAL_SYSTEMS_SERVER="$LOCAL_SERVER/SYSTEMS"
            export LOCAL_JOB_SERVER="$LOCAL_SERVER/PROJECTS"
            export LOCAL_PYTHON_SERVER="$LOCAL_SYSTEMS_SERVER/python"
    fi
    
    ### home job servers
    if [[ -d "/Volumes/PRODUCTION_01" ]];
        then
            export PROD_SERVER="/Volumes/PRODUCTION_01"
            export PROD_JOB_SERVER="$PROD_SERVER/PROJECTS"
            export PROD_SYSTEMS_SERVER="$PROD_SERVER/SYSTEMS"
            export PROD_PYTHON_SERVER="$PROD_SYSTEMS_SERVER/python"
    fi
    
    ### set server to use
    if [[ $LOCAL_SERVER ]];
        then
            ### Taking this out for now for dev
            ###export SERVER="$HOME_SERVER";export SERVER
            export SERVER="$LOCAL_SERVER"
        else
            export SERVER="$PROD_SERVER"
    fi
            
    ### set default servers
    export LOCAL_SYSTEMS_SERVER="$LOCAL_SERVER/SYSTEMS"
    export PROD_SYSTEMS_SERVER="$PROD_SERVER/SYSTEMS"
    export SYSTEMS_SERVER="$SERVER/SYSTEMS"
    
    export LOCAL_JOB_SERVER="$LOCAL_SERVER/PROJECTS"
    export PROD_JOB_SERVER="$PROD_SERVER/PROJECTS"
    export JOB_SERVER="$SERVER/PROJECTS"
    
    export LOCAL_DB_SERVER="$LOCAL_SYSTEMS_SERVER/database"
    export PROD_DB_SERVER="$PROD_SYSTEMS_SERVER/database"
    export DB_SERVER="$SYSTEMS_SERVER/database"
    
    export CONFIG_DIR_NAME="config"
    export CONFIG_FILE_NAME="config.sh"
    export PROD_DIR="production"
    
    export LOCAL_TUTORIALS="$LOCAL_SERVER/ASSETS/tutorials"
    export PROD_TUTORIALS="$PROD_SERVER/ASSETS/tutorials"
    
    export RSYNC_EXCLUDE="$SYSTEMS_SERVER/database/txt/exclude_list.txt"

    ### misc stuff
    export LOCAL_APP_LIBRARY="$LOCAL_SERVER/APPS"
    export PROD_APP_LIBRARY="$PROD_SERVER/APPS"
    export APP_LIBRARY="$SERVER/APPS"
    
    export LOCAL_CHARTS="$LOCAL_SERVER/ASSETS/charts"
    export PROD_CHARTS="$PROD_SERVER/ASSETS/charts"
    export CHARTS="$SERVER/ASSETS/charts"
    
    ### RSYNC Setups
    #alias
    export RSYNC_TIMES_DRY="--recursive --times --verbose --ignore-existing --exclude-from=$SYSTEMS_SERVER/database/txt/exclude_list.txt --dry-run"
    export RSYNC_TIMES="--recursive --times --verbose --ignore-existing --progress --exclude-from=$SYSTEMS_SERVER/database/txt/exclude_list.txt"
    alias rsynctimesdry='rsync $RSYNC_TIMES_DRY'
    alias rsynctimes='rsync $RSYNC_TIMES --log-file=$SYSTEMS_SERVER/database/logs/rsync/rsync-log-"$(date +%Y-%m-%d_%H%M%S)".log'

    ## Unix
    PATH="$SYSTEMS_SERVER/bin/frametools:$MAYA_LOCATION/bin:$PATH"
    makedate='mkdir $(date +%Y-%m-%d)'
    #export BOOST_ROOT="/usr/local/Cellar/boost/1.49.0"
    
    ### Apps
    alias truecrypt='/Applications/TrueCrypt.app/Contents/MacOS/TrueCrypt'
    alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'

    ## OCIO Default setup
    #xport OCIO="$SYSTEMS_SERVER/ocio/spi-vfx/config.ocio"

    ### Application alias and ENV vars ###

    ## Firefox
    alias firefox='/Applications/Firefox.app/Contents/MacOS/firefox'

    ## Setup Amazon EC2 Command-Line Tools
    export EC2_HOME=~/.ec2
    export PATH=$PATH:$EC2_HOME/bin
    export EC2_PRIVATE_KEY=`ls $EC2_HOME/pk-*.pem`
    export EC2_CERT=`ls $EC2_HOME/cert-*.pem`
    export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/

    ## Djview Alias
    alias djview='/Applications/djv-0.9.0.app/Contents/MacOS/djv-0.9.0'
    alias djview-0.9.0='/Applications/djv-0.9.0.app/Contents/MacOS/djv-0.9.0'
    alias djview-0.8.3='/Applications/djv-0.8.3-pre2.app/Contents/MacOS/djv-0.8.3-pre2'
    export DJV_PATH='/Applications/djv-0.9.0.app/Contents/MacOS/djv-0.9.0'
    
# Need to add Linux directory to djview

    ## RV
    alias rv='/Applications/RV64.app/Contents/MacOS/RV64'
    alias rvpkg='/Applications/RV64.app/Contents/MacOS/rvpkg'

    ## Nuke
    alias nukex='/Applications/Nuke7.0v8/NukeX7.0v8.app/NukeX7.0v8'
    alias nuke='/Applications/Nuke7.0v8/Nuke7.0v8.app/Nuke7.0v8'
    alias nuke70v8='/Applications/Nuke7.0v8/Nuke7.0v8.app/Nuke7.0v8'

    export NUKE_PATH="$SYSTEMS_SERVER/nuke/STARTUP";
    export NUKE_STARTUP="$SYSTEMS_SERVER/nuke/STARTUP";

    ## Adobe Photoshop
    alias photoshop='/Applications/Adobe\ Photoshop\ CC/Adobe\ Photoshop\ CC.app/Contents/MacOS/Adobe\ Photoshop\ CC'
    
    ## Adobe After Effects
    alias ae='/Applications/Adobe\ After\ Effects\ CC/Adobe\ After\ Effects\ CC.app/Contents/MacOS/After\ Effects'

    ## Adobe Reader
    alias reader='/Applications/Adobe\ Reader.app/Contents/MacOS/AdobeReader'
    
    ## Maya
    alias maya='/Applications/Autodesk/maya2014/Maya.app/Contents/bin/maya'
    alias maya2014='/Applications/Autodesk/maya2014/Maya.app/Contents/bin/maya'
    export MAYA_LOCATION="/Applications/Autodesk/maya2014/Maya.app/Contents"
    export MAYA_SHARED_DIR="$SYSTEMS_SERVER/maya"

    # Change this based on facility license settings
    #MAYA_LICENSE=unlimited; export MAYA_LICENSE
    #MAYA_LICENSE_METHOD=Network; export MAYA_LICENSE_METHOD
    #MAYA_ALT_EN=/var/flexlm/maya.lic; export MAYA_ALT_EN
    
    export MAYA_SCRIPT_PATH="$MAYA_SHARED_DIR/SCRIPTS/mel";export MAYA_SCRIPT_PATH
    export MAYA_PLUG_IN_PATH="$MAYA_SHARED_DIR/PLUGINS";export MAYA_PLUG_IN_PATH
    export XBMLANGPATH="$MAYA_SHARED_DIR/SCRIPTS/icons";export XBMLANGPATH
    export MAYA_ICON_PATH="$MAYA_SHARED_DIR/SCRIPTS/icons";export MAYA_ICON_PATH
    export MAYA_PYTHON_PATH="$MAYA_SHARED_DIR/SCRIPTS/python";export MAYA_PYTHON_PATH

    ## Komodo
    alias komodo='/Applications/Komodo\ Edit\ 8.app/Contents/MacOS/komodo'

    ## Python
    # Setting PATH for Python 2.7
    PATH="/usr/local/bin/:${PATH}"

    PYTHONPATH="$PYTHON_SERVER:/usr/local/lib/python2.7/site-packages"
    ## Took the following line out for now
    # $MAYA_SHARED_DIR/SCRIPTS/python:$MAYA_SHARED_DIR/SCRIPTS/python/pymel-1.0.3:
fi

### jobStart tool function
jobStart () {
    if [ -n $3 ]; then
        eval "$($SYSTEMS_SERVER/bash/jobStart.sh $1 $2 $3)"
    elif [ -n $2 ]; then
        eval "$($SYSTEMS_SERVER/bash/jobStart.sh $1 $2)"
    elif [ -n $1 ]; then
        eval "$($SYSTEMS_SERVER/bash/jobStart.sh $1)"
    else
        echo "Please enter a job name"
    fi
}