# install-kafka-zookeeper


# Edit /opt/kafka/config/server.properties
### Setting Internal / External for bind ip
``
listeners=INTERNAL://0.0.0.0:9092,EXTERNAL://0.0.0.0:29092
listener.security.protocol.map=INTERNAL:PLAINTEXT,EXTERNAL:PLAINTEXT
advertised.listeners=INTERNAL://private_id:9092,EXTERNAL://public_ip:29092
inter.broker.listener.name=INTERNAL
``
### Directory logs for kafka
``
log.dirs=/opt/kafka/logs
``

### Cluster
#### zookeeper
`` zoo.cfg
server.0=172.31.1.110:2888:3888
server.1=172.31.1.34:2888:3888
``

#### kafka
https://medium.com/workindia-in/running-kafka-on-production-e47d071aa474
