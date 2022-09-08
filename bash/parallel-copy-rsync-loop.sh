#!/bin/bash
currentdate=$( date +"%Y%m%d" )

for MYUSER in $(cat /root/beegfs-gpfs-migration/beegfs-home-ls.txt)
do
     
    echo $MYUSER
    rsync -axvH --progress --stats /beegfs/home/$MYUSER/ /gpfs/mariana/beegfs-moved/$MYUSER > /root/beegfs-gpfs-migration/output/${MYUSER}${currentdate}.txt &
#command will run rsync in parallel and send output to txt file per user
    echo
done
