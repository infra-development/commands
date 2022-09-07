
create table IF NOT EXISTS mrx.distinct_subscriber_id_till_now_monthly
    as select distinct subscriberid,0 as bintag from mrx.monthly_points_new1 where bintag < 1606780800

create table IF NOT EXISTS mrx.distinct_subscriber_id_till_now_monthly_temp
    as select distinct subscriberid,bintag as bintag from mrx.distinct_subscriber_id_till_now_monthly where bintag < 1606780800

drop table mrx.distinct_subscriber_id_till_now_monthly;

alter TABLE mrx.distinct_subscriber_id_till_now_monthly_temp RENAME TO mrx.distinct_subscriber_id_till_now_monthly


-- device activation file generation
select devicegroup,
    sum(individual_data_sum),
    count(*)
FROM (select devicegroup,
             subscriberid,
             sum(upbytes+downbytes) as individual_data_sum
      FROM mrx.monthly_points_new1
      where (bintag=1606780800) AND lower(devicegroup) NOT IN ('unknown','tac only','no tac')
      group by devicegroup, subscriberid) AS a

      LEFT OUTER JOIN

      (select distinct subscriberid as existing_subscriber_id
      from mrx.distinct_subscriber_id_till_now_monthly) AS b

    ON a.subscriberid = b.existing_subscriber_id
WHERE existing_subscriber_id IS NULL GROUP BY devicegroup;



-- device upgrade file generation
select devicegroup,
       sum(upbytes + downbytes),
       count(distinct a.subscriberid)
FROM (select devicegroup,
            upbytes,
            downbytes,
            subscriberid
    from mrx.monthly_points_new1
    where (bintag=1606780800) AND lower(devicegroup) NOT IN ('unknown','tac only','no tac')) a

    inner join

    (select subscriberid,
            count(distinct concat(devicemanufacturer,devicename)) as cnt
     from mrx.monthly_points_new1
     where (bintag=1606780800)
     group by subscriberid having cnt>1) b
    on a.subscriberid=b.subscriberid

    LEFT OUTER JOIN

    (select distinct subscriberid as existing_subscriber_id
     from  mrx.distinct_subscriber_id_till_now_monthly) AS c
    ON b.subscriberid = c.existing_subscriber_id
WHERE existing_subscriber_id IS NULL group by devicegroup;


-- ytm
drop table if exists mrx.ytmsubidupgrade_gen;
create table if not exists mrx.ytmsubidupgrade_gen
    as select distinct subscriberid
       from (select subscriberid,
                    count(distinct concat(devicemanufacturer,devicename)) as cnt
             from mrx.monthly_points_new1
             where bintag IN ( 1577836800,1580515200,1583020800,1585699200,1588291200,1590969600,1593561600,1596240000,1598918400,1601510400,1604188800,1606780800)
             group by subscriberid having cnt>1 ) b

            LEFT OUTER JOIN

           (select distinct subscriberid as existing_subscriber_id
            FROM mrx.monthly_points_new1 where bintag <  1577836800) AS c
            ON b.subscriberid = c.existing_subscriber_id
        WHERE existing_subscriber_id IS NULL;


-- ytm file generation for device
select devicegroup,
       sum(upbytes + downbytes),
       count(distinct a.subscriberid)
FROM (select devicegroup,
             upbytes,
             downbytes,
             subscriberid
      from mrx.monthly_points_new1
      where bintag IN ( 1577836800,1580515200,1583020800,1585699200,1588291200,1590969600,1593561600,1596240000,1598918400,1601510400,1604188800,1606780800)
            AND lower(devicegroup) NOT IN ('unknown','tac only','no tac')) a inner join mrx.ytmsubidupgrade_gen b
    on a.subscriberid=b.subscriberid group by devicegroup;


---------- From parser -------------------
drop table IF EXISTS mrx.ytmsubidupgrade;

--  device activation --
select count(*)
FROM (select distinct subscriberid
      FROM mrx.monthly_points_new1
      where cast(bintag as string) >='1638316800'
        AND cast(bintag as string) <='1638316800'
        AND lower(devicegroup) NOT IN ('unknown','tac only','no tac')
        and lower(devicegroup) in ('taconly','mobiletestplatform','portable(includepda)','iotdevice','wearable','dongle','modem')) AS a

    LEFT OUTER JOIN

    (select distinct subscriberid as existing_subscriber_id
    FROM mrx.monthly_points_new1
    where cast(bintag as string) < '1638316800') AS b
ON a.subscriberid = b.existing_subscriber_id
WHERE existing_subscriber_id IS NULL

-- device upgrade ---
select count(distinct a.subscriberid)
FROM (select devicegroup,
             upbytes,
             downbytes,
             subscriberid
      from mrx.monthly_points_new1
      where cast(bintag as string) >='1638316800'
        AND cast(bintag as string) <='1638316800' ) a

    inner join

    (select subscriberid,
            count(distinct concat(devicemanufacturer,devicename)) as cnt
     from mrx.monthly_points_new1
     where cast(bintag as string) >='1638316800'
       AND cast(bintag as string) <='1638316800'
     group by subscriberid having cnt>1) b

    on a.subscriberid=b.subscriberid
           and lower(devicegroup) in ('portable(includepda)','iotdevice','wearable','pccard','featurephone','dongle','smartphone')
           AND lower(devicegroup) NOT IN ('unknown','tac only','no tac')


--
create table IF NOT EXISTS mrx.ytmsubidupgrade as
select distinct subscriberid
from (select subscriberid,
             count(distinct concat(devicemanufacturer,devicename)) as cnt
      from mrx.monthly_points_new1
      where bintag >=1638316800 AND bintag  <=1638316800
      group by subscriberid having cnt>1) b

    LEFT OUTER JOIN

    (select distinct subscriberid as existing_subscriber_id FROM mrx.monthly_points_new1 where bintag < 1638316800) AS c
ON b.subscriberid = c.existing_subscriber_id WHERE existing_subscriber_id IS NULL


select count(distinct a.subscriberid)
FROM (select distinct subscriberid
      from mrx.monthly_points_new1
      where bintag >=1638316800
        AND bintag  <=1638316800
        AND lower(devicegroup) NOT IN ('unknown','tac only','no tac')
        and lower(devicegroup) in ('portable(includepda)','iotdevice','dongle','wearable','taconly','featurephone','pccard')) a

    inner join
    mrx.ytmsubidupgrade b on a.subscriberid=b.subscriberid