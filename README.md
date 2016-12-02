kafka-http-pusher
===
基于librdkafka实现，读取kafka中的消息，以http POST方式将消息推送到目标服务器，支持重试策略和并发控制。


自带依赖
--
* curl 发送http请求
* libevent 与curl配合实现异步http请求
* librdkafka 访问kafka
* glog 谷歌日志
* jsoncpp 解析json（用于kafka消息以及配置文件）

需系统依赖（请安装在系统默认路径）
--
* linux系统
* gcc支持c++11
* zlib 用于curl的gzip
* openssl&crypto 用于curl的SSL/TSL加密

编译方法
--
sh build.sh



