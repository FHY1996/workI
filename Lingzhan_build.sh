#! /bin/bash

# 旧方法 使用pm2 启动项目
# 将构建完成的项目移动位置
#\cp -rf /opt/Jenkins/.jenkins/workspace/systemv8_web/* /opt/Jenkins/lingzhan_web/
#cd /opt/Jenkins/lingzhan_web/
## 判断凌展项目是否正常启动 
#if pm2 list | grep -oE "lingzhan"
#then
#  echo "包含lingzhan"
#  pm2 restart lingzhan
#else
#  echo "不包含lingzhan"
#  pm2 start --name lingzhan npm -- start
#fi

# 2019/5/19 使用nginx反向代理进行部署
rm -rf /opt/nginx_test/dist
\cp -rf /opt/Jenkins/.jenkins/workspace/systemv8_web/dist /opt/nginx_test/


