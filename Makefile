# 编译器
CPP = g++
CPPFLAGS = -g -Wall -O2 -I./include -I./lib/libcurl/include \
                        -I./lib/libevent/include \
                        -I./lib/librdkafka/include \
                        -I./lib/libglog/include \
                        -I./include/json
LDFLAGS = -lssl -lz -lcrypto
LIBS = ./lib/libcurl/lib/libcurl.a \
       ./lib/libevent/lib/libevent.a \
       ./lib/librdkafka/lib/librdkafka.a \
       ./lib/libglog/lib/libglog.a

# 编译产出目录
OUTPUT_BIN = kafka-http-pusher

# 目标文件
SRC = src/main.cpp src/json/jsoncpp.cpp

# 目标文件
OBJECTS = $(SRC:.cpp=.o)

# 编译生成静态库和头文件
all:$(OBJECTS)
	$(CPP) -o $(OUTPUT_BIN) $^ $(LIBS) $(LDFLAGS)

# 令隐式推导检查源代码
%.o:%.cpp 
	$(CPP) -o $@ -c $< $(CPPFLAGS)

# 清理编译产物
clean:
	rm -f $(OUTPUT_BIN)
	rm -f $(OBJECTS)
