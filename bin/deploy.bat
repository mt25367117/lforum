@echo off
echo [INFO] ʹ��maven������Ŀ������Ŀ¼��ʽ����tomcat��.
echo [INFO] ��ȷ��Tomcat 6������������conf/tomcat-users.xml������admin�û�.
echo [INFO] ��� http://wiki.springside.org.cn/display/calvin/maven

cd ..
call mvn tomcat:undeploy
call mvn test war:exploded tomcat:exploded
cd bin
pause