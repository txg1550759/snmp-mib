FROM centos:centos7
MAINTAINER idea77@qq.com

RUN cd /root && yum install git install gcc gcc-g++ make net-snmp net-snmp-utils net-snmp-libs net-snmp-devel  go net-snmp-utils -y \
    &&  go get github.com/prometheus/snmp_exporter/generator \
    &&  cd /root/go/src/github.com/prometheus/snmp_exporter/generator \
    && go build \
    &&  make mibs \
    &&  MIBDIRS=mibs \
    && ./generator generate
    