@echo off
echo [INFO] ʹ��Maven���е�Ԫ���Լ����ɲ�������.
echo [INFO] ��ȷ��Derby���ݿ�����.

cd ..
call mvn integration-test
cd bin
pause