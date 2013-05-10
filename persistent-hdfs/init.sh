#!/bin/bash
HADOOP_MAJOR_VERSION=`cat /root/persistent-hdfs/hadoop.version`
pushd /root
case "$HADOOP_MAJOR_VERSION" in
  1)
    wget http://archive.apache.org/dist/hadoop/common/hadoop-1.0.4/hadoop-1.0.4.tar.gz
    tar -xvzf hadoop-1.0.4.tar.gz
    rm hadoop-*.tar.gz
    cp -r -n hadoop-1.0.4/* persistent-hdfs
    rm -rf hadoop-1.0.4
    ;;
  2)
    wget http://archive.cloudera.com/cdh4/cdh/4/hadoop-2.0.0-cdh4.2.0.tar.gz
    tar -xvzf hadoop-*.tar.gz
    rm hadoop-*.tar.gz
    cp -r -n hadoop-2.0.0-cdh4.2.0/* persistent-hdfs/
    rm -rf hadoop-2.0.0-cdh4.2.0
    # Have single conf dir
    rm -rf /root/persistent-hdfs/etc/hadoop/
    ln -s /root/persistent-hdfs/conf /root/persistent-hdfs/etc/hadoop/
    ;;

  *)
     echo "ERROR: Unknown Hadoop version"
     exit -1
esac
popd