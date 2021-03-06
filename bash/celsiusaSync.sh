#!/bin/sh

# An example of using the jobSync command to sync a project with cron
# Root will need to be set up with finPipeline for this to work

shopt -s expand_aliases

if [ -f ~/.bashrc ];
then
    . ~/.bashrc
fi

echo $HOME

### The rsync script
if [ $1 ];
then
    if [ -d $LOCAL_JOB_SERVER/$1 ];
    then
        if [ -d $PROD_JOB_SERVER/$1 ];
        then
            echo "Beginning Job Sync"
            echo " "
            echo "Syncing Job: "$1;
            rsynctimes $LOCAL_JOB_SERVER/$1/ $PROD_JOB_SERVER/$1/;
        else
            echo "Production Job Server not found"
        fi
    else
        echo "Local Job Server not found"

    fi
else
    echo "Please enter a job to sync"
fi
