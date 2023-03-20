#start zookeeper
bin/zookeeper-server-start.sh config/zookeeper.properties

#start kafka server
bin/kafka-server-start.sh config/server.properties

#list kafka topics
bin/kafka-topics.sh --list --bootstrap-server localhost:9092

#kafka producer
bin/kafka-console-producer.sh --topic quickstart-events --bootstrap-server localhost:9092

#kafka consumer
bin/kafka-console-consumer.sh --topic quickstart-events --from-beginning --bootstrap-server localhost:9092