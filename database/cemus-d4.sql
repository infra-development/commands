sqlContext.sql("").collect.foreach(println)

-- verify total downbytes, total upbytes
select count(distinct userid),
    device_tac,
    roamingflag,
    sum(downbytes),
    sum(upbytes)
from (select sum(downbytes) as downbytes,
             sum(upbytes) as upbytes,
            userid,
            device_tac,
            roamingflag
     from siq_daily
     where device_tac='86862003'
     group by userid,device_tac,roamingflag)
group by device_tac,roamingflag

-- verify avg dl_throughput, ul_throughput
select tb1.device_tac,
       tb1.roamingflag,
       count(distinct tb1.userid),
       sum(tb1.dl_throughput)/count(*) as avg_dl_th,
       sum(tb1.ul_throughput)/count(*) as avg_ul_th
from (select device_tac,
       roamingflag,
       userid,
       sum(avg_dl_throughput) / count(distinct userid) as dl_throughput,
       sum(avg_ul_throughput) / count(distinct userid) as ul_throughput
    from (select (sum(downbytes * 8) / sum(if(duration = 0, 1, duration))) / 1000 as avg_dl_throughput,
              (sum(upbytes * 8) / sum(if(duration = 0, 1, duration))) / 1000 as avg_ul_throughput,
                userid,
                device_tac,
                roamingflag,
                ctdatetime
          from siq_daily
          where ctdatetime >= '2022-08-18 00:00:00' and ctdatetime < '2022-08-19 00:00:00'
          group by userid, device_tac, roamingflag, ctdatetime)
    group by device_tac,roamingflag, userid) as tb1
group by 1, 2


spark.sql("""select tb1.device_tac,tb1.roamingflag,count(distinct tb1.userid),sum(tb1.dl_throughput)/count(*) as avg_dl_th,sum(tb1.ul_throughput)/count(*) as avg_ul_th from (select device_tac, roamingflag, userid, sum(avg_dl_throughput) / count(distinct userid) as dl_throughput, sum(avg_ul_throughput) / count(distinct userid) as ul_throughput from (select (sum(downbytes * 8) / sum(if(duration = 0, 1, duration))) / 1000 as avg_dl_throughput, (sum(upbytes * 8) / sum(if(duration = 0, 1, duration))) / 1000 as avg_ul_throughput, userid, device_tac, roamingflag, ctdatetime from siq_daily where ctdatetime >= '2022-08-18 00:00:00' and ctdatetime < '2022-08-19 00:00:00' group by userid, device_tac, roamingflag, ctdatetime) group by device_tac,roamingflag, userid) as tb1 group by 1, 2""").show














select inner_table1.time_period as time_period,
       inner_table1.tac as tac,
       inner_table1.ip_type as ip_type,
       count(distinct inner_table1.userid) as unique_devices,
       sum(inner_table1.avg_dl_throughput) / count(*) as avg_dl_throughput,
       sum(inner_table1.avg_ul_throughput) / count(*) as avg_ul_throughput
from(SELECT table1.time_period as time_period,
            table1.tac as tac,
            table1.ip_type as ip_type,
            userid,
            sum(table1.avg_dl_throughput)/count(*) as avg_dl_throughput,
            sum(table1.avg_ul_throughput)/count(*) as avg_ul_throughput
     FROM(select "2022-08-18 00:00:00" as time_period,
                 device_tac as tac,
                 case roamingflag when 0 then "Local" when 1 then "Roaming" when 2 then "Roaming" else "Unknown" end as ip_type,
                 userid,
                 (sum(downbytes * 8) / if(sum(duration) = 0, 1, sum(duration)) / 1000) as avg_dl_throughput,
                 (sum(upbytes * 8) / if(sum(duration) = 0, 1, sum(duration)) /1000) as avg_ul_throughput,
                 ctdatetime,
                 if (sum(duration)= 0,1, sum(duration)) as duration
          from siq_daily
          where ctdatetime >= "2022-08-18 00:00:00" and ctdatetime < "2022-08-19 00:00:00"
          and device_tac = "86862003"
          group by ctdatetime, device_tac, roamingflag, userid) as table1
     group by time_period, tac, ip_type, userid)inner_table1
group by time_period, tac, ip_type



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
                      where ctdatetime >= "2022-08-18 00:00:00" and ctdatetime < "2022-08-19 00:00:00"
                        and device_tac = "86862003"
                      group by ctdatetime, device_tac, roamingflag, userid) as table1
                 group by tac, ip_type, userid) as inner_table1
            group by tac, ip_type""").show



spark.sql("""select "2022-08-18 00:00:00" as time_period,device_tac as tac,case roamingflag when 0 then "Local" when 1 then "Roaming" when 2 then "Roaming" else "Unknown" end as ip_type,userid,(sum(downbytes * 8) / if(sum(duration) = 0, 1, sum(duration)) / 1000) as avg_dl_throughput,(sum(upbytes * 8) / if(sum(duration) = 0, 1, sum(duration)) /1000) as avg_ul_throughput,ctdatetime,if (sum(duration)= 0,1, sum(duration)) as duration from siq_daily where ctdatetime >= "2022-08-18 00:00:00" and ctdatetime < "2022-08-19 00:00:00" and device_tac = "86862003" group by ctdatetime, device_tac, roamingflag, userid""").show

spark.sql("""select inner_table1.time_period as time_period,inner_table1.tac as tac,inner_table1.ip_type as ip_type,count(distinct inner_table1.userid) as unique_devices,sum(inner_table1.avg_dl_throughput) / count(*) as avg_dl_throughput,sum(inner_table1.avg_ul_throughput) / count(*) as avg_ul_throughput from(SELECT table1.time_period as time_period, table1.tac as tac, table1.ip_type as ip_type, userid, sum(table1.avg_dl_throughput)/count(*) as avg_dl_throughput, sum(table1.avg_ul_throughput)/count(*) as avg_ul_throughput FROM(select "2022-08-18 00:00:00" as time_period, device_tac as tac, case roamingflag when 0 then "Local" when 1 then "Roaming" when 2 then "Roaming" else "Unknown" end as ip_type, userid, (sum(downbytes * 8) / if(sum(duration) = 0, 1, sum(duration)) / 1000) as avg_dl_throughput, (sum(upbytes * 8) / if(sum(duration) = 0, 1, sum(duration)) /1000) as avg_ul_throughput, ctdatetime, if (sum(duration)= 0,1, sum(duration)) as duration from siq_daily where ctdatetime >= "2022-08-18 00:00:00" and ctdatetime < "2022-08-19 00:00:00" group by ctdatetime, device_tac, roamingflag, userid) as table1 group by time_period, tac, ip_type, userid)inner_table1 group by time_period, tac, ip_type""").show