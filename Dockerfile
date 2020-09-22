FROM centos:centos7
MAINTAINER idea77@qq.com

RUN cd /root && yum install epel-release -y && yum makecache  && yum install less zip vim unzip bzip2  p7zip p7zip-plugins git make automake cmake  gcc gcc-g++  net-snmp net-snmp-utils net-snmp-libs net-snmp-devel  golang net-snmp-utils -y \
    &&  git clone https://github.com/prometheus/snmp_exporter \
    &&  cd snmp_exporter/generator \
    && /usr/bin/go build \
    &&  make mibs \
    &&  MIBDIRS=mibs \
    && ./generator generate
    
