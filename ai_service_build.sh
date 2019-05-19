#!/bin/bash
# 2019/05/17 构建ai_service项目
#设置 gradle 环境变量
export GRADLE_HOME=/usr/software/gradle-4.5.1
export PATH=${GRADLE_HOME}/bin:${PATH}
export GRADLE_USER_HOME=/usr/software/gradle-4.5.1

export JAVA_HOME=/usr/java/jdk1.8.0_171
export PATH=$JAVA_HOME/bin:$PATH
export BUILD_ID=dontkillme 
#移动至Jenkins工作目录
cd /opt/Jenkins/workspace/ai_service

# 构建项目
gradle build

#关闭tomcat 服务   重启tomcat
bash /root/service/aiknowledge/tomcat-8.5.23/bin/shutdown.sh
#创建备份文件夹
time=$(date '+%Y%m%d%M' )
mkdir /root/service/aiknowledge/data/$time
#备份文件
mv  /root/service/aiknowledge/tomcat-8.5.23/webapps/{api,api.war} /root/service/aiknowledge/data/$time
# 移动api.war
mkdir /root/service/aiknowledge/tomcat-8.5.23/webapps/api
\cp  -rf /opt/Jenkins/workspace/ai_service/build/libs/api.war /root/service/aiknowledge/tomcat-8.5.23/webapps
unzip api.war -d /root/service/aiknowledge/tomcat-8.5.23/webapps/api
# 重启tomcat
bash /root/service/aiknowledge/tomcat-8.5.23/bin/startup.sh
