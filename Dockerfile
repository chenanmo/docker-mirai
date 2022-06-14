FROM openjdk:18-jdk-alpine3.14
ENV LANG=zh_CN.UTF-8 \
    SHELL=/bin/bash \
    PS1="\u@\h:\w \$ " \
    MIRAI_DIR=/mirai \
    MCL_VERSION=2.1.0 \
    MCL_URL=https://github.com/iTXTech/mirai-console-loader/releases/download/v2.1.0/mcl-2.1.0.zip 

    
COPY ./init /usr/bin

WORKDIR ${MIRAI_DIR}

RUN set -x \
    && sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update -f \
    && apk upgrade \
    && apk --no-cache add -f bash \
                             coreutils \
                             moreutils \
                             git \
                             curl \
                             wget \
                             unzip \
                             tzdata \
    && rm -rf /var/cache/apk/* \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && wget -P "/tmp"  ${MCL_URL}
    
ENTRYPOINT ["bash", "/usr/bin/init"]

 
