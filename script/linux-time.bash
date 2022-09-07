in=20141225093000000
rfc_form="${in:0:4}-${in:4:2}-${in:6:2} ${in:8:2}:${in:10:2}:${in:12:2}"
milli_sec="${in:14:3}"
epoch_time=$(date -d "$rfc_form" +%s)
echo $epoch_time
added_one=$(expr $epoch_time + 1)
echo $added_one
str_form=$(date -d@"$added_one" +"%Y-%m-%d %H:%M:%S")
final_output=$str_form.$milli_sec



  in=$1
  #rfc_form="${in:0:4}-${in:4:2}-${in:6:2} ${in:8:2}:${in:10:2}:${in:12:2}"
  #milli_sec="${in:14:3}"
  #epoch_time=$(date -d "$rfc_form" +%s)
  #echo ${epoch_time}
  #added_one=$(expr $epoch_time + 1)
  #echo ${added_one}
  #str_form=$(date -d@"$added_one" +"%Y-%m-%d %H:%M:%S")
  #final_output=${str_form}.${milli_sec}
  #echo ${final_output}
  echo "2022-03-01 10:00:00.000"