
zcat Umbrella_UK_DataServices_DS_TECH_D_2022-08-09-08-52-00.csv.gz | awk -F"\t" '{print $1, $2, $3, $4, $5, $6, $7 $8}' | grep 3G | grep 86551403