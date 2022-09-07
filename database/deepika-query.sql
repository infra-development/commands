select inner_table1.tac as tac,
       inner_table1.ip_type as ip_type,
       count(distinct inner_table1.userid) as unique_devices,
       sum(inner_table1.avg_dl_throughput) / count(*) as avg_dl_throughput,
       sum(inner_table1.avg_ul_throughput) / count(*) as avg_ul_throughput
from(SELECT table1.tac as tac,
            table1.ip_type as ip_type,
            userid,
            sum(table1.avg_dl_throughput)/count(*) as avg_dl_throughput,
            sum(table1.avg_ul_throughput)/count(*) as avg_ul_throughput
     FROM(select device_tac as tac,
                 case roamingflag when 0 then "Local" when 1 then "Roaming" when 2 then "Roaming" else "Unknown" end as ip_type,
                 userid,
                 (sum(downbytes * 8) / (if(sum(duration) = 0, 1, sum(duration))) / 1000) as avg_dl_throughput,
                 (sum(upbytes * 8) / (if(sum(duration) = 0, 1, sum(duration))) /1000) as avg_ul_throughput,
                 ctdatetime,
                 if (sum(duration)= 0,1, sum(duration)) as duration
          from siq_daily
          where ctdatetime >= "2022-08-03 00:00:00" and ctdatetime < "2022-08-04 00:00:00"
            and device_tac = "86340803"
          group by ctdatetime, device_tac, roamingflag, userid) as table1
     group by tac, ip_type, userid) as inner_table1
group by tac, ip_type


spark.sql("""select inner_table1.tac as tac,
       inner_table1.ip_type as ip_type,
       count(distinct inner_table1.userid) as unique_devices,
       sum(inner_table1.avg_dl_throughput) / count(*) as avg_dl_throughput,
       sum(inner_table1.avg_ul_throughput) / count(*) as avg_ul_throughput
from(SELECT table1.tac as tac,
            table1.ip_type as ip_type,
            userid,
            sum(table1.avg_dl_throughput)/count(*) as avg_dl_throughput,
            sum(table1.avg_ul_throughput)/count(*) as avg_ul_throughput
     FROM(select device_tac as tac,
                 case roamingflag when 0 then "Local" when 1 then "Roaming" when 2 then "Roaming" else "Unknown" end as ip_type,
                 userid,
                 (sum(downbytes * 8) / (if(sum(duration) = 0, 1, sum(duration))) / 1000) as avg_dl_throughput,
                 (sum(upbytes * 8) / (if(sum(duration) = 0, 1, sum(duration))) /1000) as avg_ul_throughput,
                 ctdatetime,
                 if (sum(duration)= 0,1, sum(duration)) as duration
          from siq_daily
          where ctdatetime >= "2022-08-03 00:00:00" and ctdatetime < "2022-08-04 00:00:00"
            and device_tac = "86340803"
          group by ctdatetime, device_tac, roamingflag, userid) as table1
     group by tac, ip_type, userid) as inner_table1
group by tac, ip_type""").show
