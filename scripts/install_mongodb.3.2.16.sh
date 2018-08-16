#!/bin/bash
# Intall Mongodb 3.2.16 Single
# 2018-07-04 
SRC_URI="http://zy-res.oss-cn-hangzhou.aliyuncs.com/mongodb/mongodb-linux-x86_64-rhel70-3.2.16.tgz"
PKG_NAME=`basename $SRC_URI`
DIR=`pwd`
DATE=`date +%Y%m%d%H%M%S`
port=27017
\mv /alidata/mongodb /alidata/mongodb.bak.$DATE &> /dev/null
mkdir /alidata/{mongodb,install} -p
mkdir /alidata/mongodb/{data,log,conf}
mkdir /alidata/mongodb/data/$port
cd /alidata/install
if [ ! -s $PKG_NAME ]; then
  wget -c $SRC_URI
fi
tar -xf mongodb-linux-x86_64-rhel70-3.2.16.tgz 
mv mongodb-linux-x86_64-rhel70-3.2.16/* /alidata/mongodb
rm -rf mongodb-linux-x86_64-rhel70-3.2.16
if ! cat /etc/profile | grep 'export PATH=$PATH:/alidata/mongodb/bin' &> /dev/null;then
	echo 'export PATH=$PATH:/alidata/mongodb/bin' >> /etc/profile
fi
# �����ں˲��� 
#1. �ں˲���/sys/kernel/mm/transparent_hugepage/enabled
#2. �ں˲���/sys/kernel/mm/transparent_hugepage/defrag
echo never > /sys/kernel/mm/transparent_hugepage/enabled
echo never > /sys/kernel/mm/transparent_hugepage/defrag

# ������ʵ�������ļ�
mem=`cat /proc/meminfo | grep MemTotal|sed 's/MemTotal:\s\{1,\}\([0-9]\{1,\}\) kB/\1/'`
cache=`echo $mem | awk '{printf "%d",$1*6/10485760-1}'`

cat > /alidata/mongodb/conf/mongodb${port}.conf << EOT
systemLog:
 destination: file
 path: /alidata/mongodb/log/mongod${port}.log
 logAppend: true
storage:
 journal:
  enabled: true
 dbPath: /alidata/mongodb/data/${port}
 directoryPerDB: true
 engine: wiredTiger
 wiredTiger:
  engineConfig:
   cacheSizeGB: ${cache}
   directoryForIndexes: true
  collectionConfig:
   blockCompressor: zlib
  indexConfig:
   prefixCompression: true
net:
 port: ${port}
 #bindIp: 0.0.0.0
#security:
 #authorization: enabled  
EOT
# ���������ű�
cat > /alidata/mongodb/mongodb.server << ENDF
#!/bin/bash
start(){
/alidata/mongodb/bin/mongod --config /alidata/mongodb/conf/mongodb${port}.conf &
}
stop(){
/alidata/mongodb/bin/mongod --config /alidata/mongodb/conf/mongodb${port}.conf --shutdown
}
case \$1 in
start)
start
;;
stop)
stop
;;
restart)
stop
start
;;
*)
echo "Usage:\$0{start|stop|restart}"
exit 1
esac
ENDF

cd $DIR
source /etc/profile
bash