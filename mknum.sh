#!/bin/bash

IFS="`printf '\n\t'`"       #help w/filenames having spaces & odd stuff 
set -e  #exit upon any failed line of thi bash script
#set -x #print each command executed
#THESE THREE LINES SHOULD BE IN ALL YOUR SCRIPTS

# Move and rename files (using their size) in a new directory.
# Will Not overwite a same named file in the new directory.

# mknum.sh=> move and renumbered files

# In the parent directory of files to be mv & num'd
# enter mknum.sh source destination extention
# eg mknum.sh pic numpics jpg



# Moves idicated files (source dirctory) to new (destination) directory.
# File names are changed to "their file size".ext.
# A file will remain in srcD rather than overwrite a desD file having 
# the same potential "file size".ext name.
# This is a simple way to shorten the file names and do a crude check for 
# duplicate files.
# Note: not all files with a given size will be the same file!.







if  [ "$#" -lt "3" ] #checking for arguments. 3 are needed.
then
        echo "Missing arguments"
        echo "Enter bash mknum.sh
             'source' 'destination' 'extention'"

                exit
            else 
                    scrD=$1     #source Directory
                    desD=$2     #destination Directory
                    fext=$3     #file extention

fi


if [ -d "$scrD" ]   #does source Directory exist?
then
        echo "Directory" $scrD "exist"
            else
                echo "Unable to locate source directory"
                echo "Please try again with a valid source directory name"
                    exit    #script ends, you'll need to try it again


fi




if [ -d "$desD" ]   #does destination Directory esist?
then
        echo "Destination" $desD "exist"
            else
                mkdir $desD     #create the directory if non-exsitant

                   echo "Now destination directory exist"
                                                            
fi


echo
echo "Files of extention type" $fext "will be moved and renamed"
echo "to" $desD "directory"
echo
echo "UNLESS a renamed file of that file size already exist in"
echo "the destination directory."
echo "Therein NOT renaming and moving that file. ie file remains"
echo "in" $scrD "directory"

for i in $scrD/*.$fext;     #for every applicable file in the scrD
        do

           mv $i $desD/$(stat -c%s $i).$fext; done 
#move choosen file to desD with size in bytes as name & still using same file ext.

              exit
