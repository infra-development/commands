## Spark with Scala in Windows

For Installation refer to [spark-pyspark-installation-windows.md](spark-pyspark-installation-win.md) file.

### IntelliJ

1. Create new project
    1. Give name `demo-scala-spark`
    2. Select Language `Java`
    3. Select Build System `Maven`
    4. Select `JDK 11`
    5. Give `groupId` and `ArtefactId` inside Advanced Settings

2. Modify pom.xml
    1. Add following line of code in `<properties>` section
   ```java{style=colorful}
    <properties>
        <maven.compiler.source>11</maven.compiler.source>
        <maven.compiler.target>11</maven.compiler.target>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
        <scala.version>2.12.15</scala.version>
        <spark.version>3.3.0</spark.version>
    </properties>
   ```
   2. Add Scala Dependency in `<dependencies>` section
   ```java{style=colorful}
    <dependency>
        <groupId>org.scala-lang</groupId>
        <artifactId>scala-compiler</artifactId>
        <version>${scala.version}</version>
    </dependency>
   ```
   3. Add `<plugins>` in the `<build>` section
   ```java{style=colorful}
   <build>
        <plugins>
            <plugin>
                <groupId>net.alchim31.maven</groupId>
                <artifactId>scala-maven-plugin</artifactId>
                <version>4.8.1</version>
                <executions>
                    <execution>
                        <goals>
                            <goal>compile</goal>
                            <goal>testCompile</goal>
                        </goals>
                    </execution>
                </executions>
                <configuration>
                    <scalaVersion>${scala.version}</scalaVersion>
                </configuration>
            </plugin>

            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>3.8.1</version>
                <configuration>
                    <source>${maven.compiler.source}</source>
                    <target>${maven.compiler.target}</target>
                </configuration>
            </plugin>
        </plugins>
   </build>
   ```
   
    In the context of a Scala project, the `maven-compiler-plugin` is often used alongside the `scala-maven-plugin` to ensure proper compilation of both Java and Scala sources.
    
    `scala-maven-plugin` is responsible for Scala code: Compiles Scala source code in your project. Allows you to specify the Scala version, customize compiler options, and perform other Scala-specific configurations.
    
    `maven-compiler-plugin` is responsible for Java code. Compiles Java source code in your project. Allows you to set the Java source and target versions, customize compiler options, and perform other related configurations.
    
    By configuring both plugins, you can ensure that Maven appropriately handles both Java and Scala sources in your project. It provides a way to explicitly declare the versions, settings, and behaviors for each language, allowing for a more controlled and consistent build process.


3. Build `maven`
   1. Go to `Lifecycle` folder of `Maven` tool.
   2. Click `clean`
   3. Click `install`


4. Create necessary `scala` files
   1. Create folder `scala` in `main` folder.
   2. Right click on `scala` directory and inside `Mark direcotry as` select `Sources Root`
   2. Create package `com.guavus` in `scala` directory.
   3. Create new scala class/object in `com.guavus` package. Implement `main` method inside and run that class.

Till this stage we are ready with Scala and Java in one project with maven build tools.

### Adding Spark Code
1. Add spark dependencies in `pom.xml` as shown below
    ```java{style=colorful}
    <dependency>
        <groupId>org.apache.spark</groupId>
        <artifactId>spark-core_2.12</artifactId>
        <version>${spark.version}</version>
    </dependency>

    <dependency>
        <groupId>org.apache.spark</groupId>
        <artifactId>spark-sql_2.12</artifactId>
        <version>${spark.version}</version>
    </dependency>
    ```
2. Add spark code snippets and run the code.
   ```java{style=colorful}
    package com.guavus

    import org.apache.spark.sql.SparkSession
    import org.apache.log4j.{Level, Logger}
    
    object SampleScala extends App {
    
       Logger.getRootLogger.setLevel(Level.WARN)
    
       val spark = SparkSession.builder()
          .appName("SampleScalaApp")
          .master("local[*]")
          .getOrCreate()
    
       val df = spark.read.csv("D:/files/business-employment-data.csv")
       df.show()
    }
   ```
    
