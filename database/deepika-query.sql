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


select '3G' as rat,
    dpiprotocol as data_service,
    'ALL' as customer_group,
    case roamingflag when 0 then 'Local' when 1 then 'Roaming' when 2 then 'Roaming' else 'Unknown' end as roamingflag,
    count(distinct userid) as NoOfSubscribers,
    (sum(downbytes * 8) / if(sum(duration) = 0, 1, sum(duration)) /1000) as down_binbandwidth,
    (sum(upbytes * 8) / if(sum(duration) = 0, 1, sum(duration)) /1000) as up_binbandwidth ,
    case when ctdatetime >= from_unixtime(unix_timestamp(to_timestamp('2022-08-03 00:00:00'))) and ctdatetime < from_unixtime(unix_timestamp(to_timestamp('2022-08-03 00:00:00')) + 3*3600) then 'bin1' end as bin
from tb where ctdatetime >= '2022-08-03 00:00:00' and ctdatetime < '2022-08-04 00:00:00' and rat in (1000,1003) and lower(dpiprotocol) in ('facebook','flash','gmail','google') group by ctdatetime,dpiprotocol, roamingflag")



select inner_table.time_period as Time_period,
    inner_table.rat as Technology,
    inner_table.data_service as Data_Service,
    inner_table.customer_group as Customer_Group,
    inner_table.ip_type as IP_Type,
    max(case when inner_table.bin = 'bin1' then (inner_table.down_binbandwidth) / NoOfSubscribers else 0 end) as time_down_1
from (select '2022-08-03 00:00:00' as time_period,
        rat as rat,
        dpiprotocol as data_service,
        'ALL' as customer_group,
        case roamingflag when 0 then 'Local' when 1 then 'Roaming' when 2 then 'Roaming' else 'Unknown' end as ip_type,
        count(distinct userid) as NoOfSubscribers,
        (sum(downbytes * 8) / if(sum(duration) = 0, 1, sum(duration)) /1000) as down_binbandwidth,
        (sum(upbytes * 8) / if(sum(duration) = 0, 1, sum(duration)) /1000) as up_binbandwidth,
        case when ctdatetime >= from_unixtime(unix_timestamp(to_timestamp('2022-08-03 00:00:00'))) and ctdatetime < from_unixtime(unix_timestamp(to_timestamp('2022-08-03 00:00:00')) + 3*3600) then 'bin1' else
    from output_7s
    where ctdatetime >= '2022-08-03 00:00:00' and ctdatetime < '2022-08-04 00:00:00' and lower(dpiprotocol) in ('facebook','flash','gmail','google')
    group by rat, dpiprotocol, roamingflag, ctdatetime)
    group by time_period, rat, Data_Service, Customer_Group, IP_Type
