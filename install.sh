sudo apt install -y openjdk-18-jdk && java -version && sudo apt update

# Add user kafka & zookeeper
sudo useradd -r -d /opt/kafka -s /usr/sbin/nologin kafka

sudo useradd zookeeper -m 
usermod --shell /bin/bash zookeeper
passwd zookeeper
usermod -aG sudo zookeeper

# create a data directory for zookeeper and change the ownership of this directory: 
mkdir zookeeper
chown -R zookeeper:zookeeper zookeeper

# Load kafka & zookeeper
cd /opt 
wget -c https://dlcdn.apache.org/kafka/3.5.1/kafka_2.13-3.5.1.tgz -O kafka.tgz && tar -xzf kafka.tgz
wget -c https://mirrors.estointernet.in/apache/zookeeper/zookeeper-3.8.0/apache-zookeeper-3.8.0-bin.tar.gz -O zookeeper.tar.gz && tar -xvzf zookeeper.tar.gz
sudo mv apache-zookeeper-3.8.0-bin zookeeper && sudo mv kafka_2.13-3.5.1 kafka

# Change ownership
sudo chown -R kafka:kafka /opt/kafka
sudo chown -R zookeeper:zookeeper /opt/zookeeper
sudo chown -R zookeeper:zookeeper zookeeper
sudo -u kafka mkdir -p /opt/kafka/logs

# Copy config & service
cd
sudo cp zoo.cfg /opt/zookeeper/conf/zoo.cfg
sudo cp zookeeper.service /etc/systemd/system/zookeeper.service
sudo cp kafka.service /etc/systemd/system/kafka.service

sudo systemctl daemon-reload

sudo systemctl start zookeeper && sudo systemctl enable zookeeper
sudo systemctl enable kafka && sudo systemctl start kafka


## Manual
# sudo -u kafka nano /opt/kafka/config/server.properties
## logs configuration for apache kafka
#log.dirs=/opt/kafka/logs
