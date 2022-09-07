#Removing data from /data/collector/edr
ls -lrt | grep "Jul 11" | awk '{print $NF}' | xargs -I {} sudo rm -rf {}

#Running data generation script
sudo sh runscript_5.sh 100 1643673600 10 10 10 SPGWPH5 24000 216000 /data/collector/edr

#bzip2 compression
bzip2 file_name

#bzip2 decompression
bzip2 -d file_name.bz2

#Integrity check
bzip2 -t input.txt.bz2

date -d '05/02/2022 00:00:00' +"%s"

Jagdishd@81609
4b37423260a64c88a721d27394