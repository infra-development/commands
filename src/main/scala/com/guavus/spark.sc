import org.apache.spark.sql.SparkSession

val spark = SparkSession.builder().master("local").getOrCreate()