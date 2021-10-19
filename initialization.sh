#!/bin/sh
#初始化容器脚本
#mkdir /mirai 
#wget -P /mirai https://github.com/iTXTech/mirai-console-loader/releases/download/v1.2.2/mcl-1.2.2.zip && \
#unzip /mirai/mcl-1.2.2.zip -d /mirai && \
#chmod a+x /mirai/mcl

if [ -z $mirai_DIR ]; then
  mirai_DIR=/mirai
fi

if [ -z $MCL_URL ]; then
  MCL_URL=https://github.com/iTXTech/mirai-console-loader/releases/download/v1.2.2/mcl-1.2.2.zip
fi

if ! type git  >/dev/null 2>&1; then
  echo "正在安装git..."
  apk add git
else 
  echo "git已安装"
fi


if [ ! -d $mirai_DIR/mcl ]; then
  echo "mirai目录为空, 开始下载代码..."
  wget -P $mirai_DIR  $MCL_URL
  echo "开始解压"
  unzip $mirai_DIR/mcl-1.2.2.zip -d $mirai_DIR
  chmod a+x "/mirai/mcl"
else 
  echo "mcl已存在"

fi
  echo "启动..."
  cd $mirai_DIR&&./mcl