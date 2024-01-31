# PySpark on Windows with PyCharm

## Install Spark on Windows
Install Java, Python and Spark on Windows
### Install Java on Windows
Download Java installer on windows and install it.

### Install Python on Windows
1. To install the Python package manager, navigate to https://www.python.org/ in your web browser.
2. Mouse over the Download menu option and click Python 3.11.
3. Once the download finishes, run the file.
4. Near the bottom of the first setup dialog box, check off Add Python 3.11 to PATH. Leave the other box checked.
5. Next, click Customize Installation.
6. You can leave all boxes checked at this step, or you can uncheck the options you do not want.
7. Select the box Install for all users and leave other boxes as they are.
8. Under Customize install location, click Browse and navigate to the C drive. Add a new folder and name it Python.
9. Select that folder and click OK.
10. When the installation completes, click the Disable path length limit option at the bottom and then click Close.
11. If you have a command prompt open, restart it. Verify the installation by checking the version of Python:

### Download and Install Spark binary
1. Open a browser and navigate to https://spark.apache.org/downloads.html.
2. Under the Download Apache Spark heading, there are two drop-down menus. Use the current non-preview version.
   - Choose a Spark release -> 3.5.0
   - Choose a package type -> Pre-built for Apache Hadoop 3.
3. Click the spark-3.5.0-bin-hadoop3.tgz link
4. A page with a list of mirrors loads where you can see different servers to download from. Pick any from the list and save the file to your Downloads folder.

Installing Apache Spark involves extracting the downloaded file to the desired location.
1. Create a new folder named Spark in the root of your C: drive. From a command line, enter the following:
2. In Explorer, locate the Spark file you downloaded.
3. Right-click the file and extract it to C:\Spark using the tool you have on your system (e.g., 7-Zip).
4. Now, your C:\Spark folder has a new folder spark-3.5.0-bin-hadoop3 with the necessary files inside.

### Add winutils.exe File
Download the winutils.exe file for the underlying Hadoop version for the Spark installation you downloaded.
1. Navigate to this URL https://github.com/cdarlint/winutils and inside the bin folder, locate winutils.exe, and click it.
2. Find the Download button on the right side to download the file.
3. Now, create new folders Hadoop and bin on C: using Windows Explorer or the Command Prompt.
4. Copy the winutils.exe file from the Downloads folder to C:\Hadoop\bin

### Configure Environment Variables
Configuring environment variables in Windows adds the Spark and Hadoop locations to your system PATH. It allows you to run the Spark shell directly from a command prompt window.
1. Click Start and type environment.
2. Select the result labelled Edit the system environment variables.
3. A System Properties dialog box appears. In the lower-right corner, click Environment Variables and then click New in the next window.
4. For Variable Name type SPARK_HOME.
5. For Variable Value type C:\Spark\spark-3.5.0-bin-hadoop3 and click OK. If you changed the folder path, use that one instead.
6. In the top box, click the Path entry, then click Edit. Be careful with editing the system path. Avoid deleting any entries already on the list.
7. You should see a box with entries on the left. On the right, click New.
8. The system highlights a new line. Enter the path to the Spark folder C:\Spark\spark-3.5.0-bin-hadoop3\bin. We recommend using %SPARK_HOME%\bin to avoid possible issues with the path.
9. Repeat this process for Hadoop and Java.
   - For Hadoop, the variable name is HADOOP_HOME and for the value use the path of the folder you created earlier: C:\Hadoop. Add C:\Hadoop\bin to the Path variable field, but we recommend using %HADOOP_HOME%\bin. 
   - For Java, the variable name is JAVA_HOME and for the value use the path to your Java JDK directory (example, C:\Program Files\Java\<jdk_version>).
10. Click OK to close all open windows.

### Launch Spark
1. Open a new command prompt Window using the right-click and Run as administrator:
2. To start Spark, enter:

   ```C:\Spark\spark-3.5.0-bin-hadoop3\bin\spark-shell```

    If you set the environment path correctly, you can type spark-shell to launch Spark.
3. The system should display several lines indicating the status of the application. You may get a Java pop-up. Select Allow access to continue.
   Finally, the Spark logo appears, and the prompt displays the Scala shell.
   4., Open a web browser and navigate to http://localhost:4040/.
5. You can replace localhost with the name of your system.
6. You should see an Apache Spark shell Web UI. The example below shows the _Executors_ page.
7. To exit Spark and close the Scala shell, press ctrl-d in the command-prompt window or Exit using **quit()**
   Open a command prompt Window using the right-click and Run as administrator, If you installed Python, you can run Spark using Python with this command:

   `C:\Spark\spark-3.5.0-bin-hadoop3\bin\pyspark`
   
To test Pyspark, enter the below commands:

Run script
```python{style=colorful}
>>> data = ['John','Morrison', 'Jacky','Arnold','Vicky','Dobian']
>>> data
>>> rdd = sc.parallelize(data)
>>> rdd.collect()

Output : ['John', 'Morrison', 'Jacky', 'Arnold', 'Vicky', 'Dobian']
```

```python{style=colorful}
>>> test = "C:\Spark\spark-3.5.0-bin-hadoop3/test.py"
>>> test2 = "C:\Spark\spark-3.5.0-bin-hadoop3/test2.py"
>>> import test
>>> import test2
>>> pipeRDD =  rdd.pipe(test)
>>> pipeRDD.collect()
>>> rdd.collect()
>>> rdd2 = rdd.map(lambda x : test2.fun2(x))
>>> rdd2.collect()
```

## Running with PyCharm

Create Simple python project `pyspark-azure`
Create using new virtual environment from PyCharm

Now create new `Sample.py` file

```python{style=colorful}
from pyspark.sql import SparkSession

spark = SparkSession.builder.master("local[*]").appName("pyspark-azure").getOrCreate()

df = spark.read.csv("D:/files/business-employment-data.csv")
df.show(20)
```
Now Create/Edit Run configuration

1. give it name `pyspark-azure`
2. Select the script `Sample.py`
3. Add the environment variable `PYTHONPATH = C:\Spark\spark-3.5.0-bin-hadoop3\python`

Save and run
