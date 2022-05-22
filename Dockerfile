FROM geerlingguy/docker-centos7-ansible:python3

CMD chmod +x /data/tomcat_test.sh && /data/tomcat_test.sh $ENVIRONMENT