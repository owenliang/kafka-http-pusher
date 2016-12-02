PROJECT_PATH=$(cd `dirname $0`;pwd)
DEPENDS_PATH=$PROJECT_PATH/depends
LIB_PATH=$PROJECT_PATH/lib

# curl
CURL_SETUP_FLAG=$LIB_PATH/libcurl/setup_flag
if [ ! -f "$CURL_SETUP_FLAG" ];then
    cd $DEPENDS_PATH/curl-7.51.0
    ./configure --prefix=$LIB_PATH/libcurl --disable-shared
    make clean && make -j8 && make install
    echo `date` > $CURL_SETUP_FLAG
    cd -
fi

# libevent
LIBEVENT_SETUP_FLAG=$LIB_PATH/libevent/setup_flag
if [ ! -f "$LIBEVENT_SETUP_FLAG" ];then
    cd $DEPENDS_PATH/libevent-2.0.22-stable
    ./configure --prefix=$LIB_PATH/libevent --disable-shared
    make clean && make -j8 && make install
    echo `date` > $LIBEVENT_SETUP_FLAG
    cd -
fi

# librdkafka
LIBRDKAFKA_SETUP_FLAG=$LIB_PATH/librdkafka/setup_flag
if [ ! -f "$LIBRDKAFKA_SETUP_FLAG" ];then
    cd $DEPENDS_PATH/librdkafka-0.9.2
    ./configure --prefix=$LIB_PATH/librdkafka
    make clean && make -j8 && make install
    echo `date` > $LIBRDKAFKA_SETUP_FLAG
    cd -
fi

# glog
LIBGLOG_SETUP_FLAG=$LIB_PATH/libglog/setup_flag
if [ ! -f "$LIBGLOG_SETUP_FLAG" ];then
    cd $DEPENDS_PATH/glog-0.3.4
    ./configure --prefix=$LIB_PATH/libglog
    make clean && make -j8 && make install
    echo `date` > $LIBGLOG_SETUP_FLAG
    cd -
fi

make clean && make all
