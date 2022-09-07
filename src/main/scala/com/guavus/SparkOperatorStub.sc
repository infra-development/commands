// Adding driver to the spark.properties
// vi spark.properties
// spark.driver.extraJavaOptions=-Dcom.amazonaws.sdk.disableCertChecking\=true

// command to open spark-shell
// ** /opt/spark/bin/spark-shell --properties-file ./spark.properties --jars /opt/spark/work-dir/jars/agg-reports.jar

import org.apache.hadoop.fs.{FileSystem, Path}
import org.apache.spark.sql.SparkSession
import java.io.{BufferedInputStream, File}
import java.net.URI

val warehouseLocation = new File("spark-warehouse").getAbsolutePath
val hive_metastore_uris = "thrift://hms-hive-metastore.hms.svc.kubernetes.local:9083"
val spark = SparkSession.builder().master("local").appName("Aggregation Reports").config("hive.metastore.uris", hive_metastore_uris).config("spark.sql.warehouse.dir", warehouseLocation).enableHiveSupport().getOrCreate()

import spark.implicits._
spark.sparkContext.hadoopConfiguration.set("fs.s3a.impl", "org.apache.hadoop.fs.s3a.S3AFileSystem")
spark.sparkContext.hadoopConfiguration.set("fs.s3a.endpoint", "https://mural02.cloud.in.guavus.com:32000")
spark.sparkContext.hadoopConfiguration.set("fs.s3a.access.key", "AZKTNJAHPGEWJNTCIRZIC")
spark.sparkContext.hadoopConfiguration.set("fs.s3a.secret.key", "Hpj98KYEre3or0Fa1qGni9cS3e0bf7vm6AcxB5EDh")
spark.sparkContext.hadoopConfiguration.set("fs.s3a.path.style.access", "true")

val output_location = "s3a://mural02/"
var getFS = FileSystem.get(new URI(output_location), spark.sparkContext.hadoopConfiguration)

//val conf = sc.hadoopConfiguration ------ or ---------
val conf = spark.sparkContext.hadoopConfiguration
val daily_table = output_location + "/7s_cemus_18aug/"
val fromFolder = new Path(daily_table)
val logfiles = fromFolder.getFileSystem(conf).listFiles(fromFolder, true)

var files = Seq[String]()
while (logfiles.hasNext) {
  // one can filter here some specific files
  files = files :+ logfiles.next().getPath().toString
}
val df = spark.read.orc(files: _*)
df.createOrReplaceTempView("siq_daily")

val monthly_table = output_location + "/siq_cemus18aug.db/siq_monthly/"
val fromFolder2 = new Path(monthly_table)
val logfiles2 = fromFolder2.getFileSystem(conf).listFiles(fromFolder2, true)

var files2 = Seq[String]()
while (logfiles2.hasNext) {
  // one can filter here some specific files
  files2 = files2 :+ logfiles2.next().getPath().toString
}
val df2 = spark.read.orc(files2: _*)
df2.createOrReplaceTempView("siq_monthly")

spark.sql("""select distinct timecol from siq_daily;""".stripMargin).show