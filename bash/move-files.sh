#!/bin/bash

for MYUSER in $(cat /root/beegfs-gpfs-migration/beegfs-home-ls.txt)
do
	if [ ${MYUSER} == "jurgen.tuvikene" ]; then 

		 mv /gpfs/mariana/beegfs-moved/${MYUSER}/${MYUSER} /gpfs/mariana/beegfs-moved/${MYUSER}1
 		 rmdir /gpfs/mariana/beegfs-moved/${MYUSER}
 		 mv /gpfs/mariana/beegfs-moved/${MYUSER}1 /gpfs/mariana/beegfs-moved/${MYUSER}
	fi
    echo $MYUSER
#If is used to target a single user
#command will mmove a sub directory with the same name as the main one then remove main dir and then change the name to match the main one
done
