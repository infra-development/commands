## Running with PyCharm

For Installation refer to [spark-pyspark-installation-windows.md](spark-pyspark-installation-win) file.

### PyCharm

Create Simple python project `pyspark-azure`
Create using new virtual environment from PyCharm

Now create new `Sample.py` file

```python{style=colorful}
from pyspark.sql import SparkSession

spark = SparkSession.builder.master("local[*]").appName("pyspark-azure").getOrCreate()

df = spark.read.csv("D:/files/business-employment-data.csv")
df.show(20)
```
In pycharm set interpreter which is python installed at location of current virtual environment.

Now Create/Edit Run configuration

1. give it name `pyspark-azure`
2. Select the script `Sample.py`

Save and run