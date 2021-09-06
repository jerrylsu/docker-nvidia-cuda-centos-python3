FROM nvidia/cuda:10.0-cudnn7-runtime-centos7

LABEL maintainer="jerry"

COPY tools /tools

RUN mv /tools/.vimrc ~/.vimrc \
    # 1.yum换源, wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
    && mv /etc/yum.repos.d /etc/yum.repos.d.bk && mkdir /etc/yum.repos.d && mv /tools/CentOS-Base.repo /etc/yum.repos.d/ \
    # 支持中文
    && yum -y install kde-l10n-Chinese && yum install glibc-common -y \
    && localedef -c -f UTF-8 -i zh_CN zh_CN.utf8 \
    && export LANG=zh_CN.UTF-8 \
    && echo "export LANG=zh_CN.UTF-8" >> /etc/locale.conf \
    # 2.安装python3编译工具
    && yum -y install openssl-devel bzip2-devel expat-devel gdbm-devel readline-devel sqlite-devel \
    && yum -y install gcc automake autoconf libtool make wget vim \
    && cd /usr/bin && mv python python.bk \
    # 3.下载python3源码
    && mkdir -p /usr/local/python/python3 && cd /usr/local \
    # wget https://www.python.org/ftp/python/3.6.8/Python-3.6.8.tgz
    && mv /tools/Python-3.6.8.tgz /usr/local/ \
    && tar -xzvf Python-3.6.8.tgz && rm Python-3.6.8.tgz \
    # 4.编译源码
    && cd /usr/local/Python-3.6.8 && ./configure --prefix=/usr/local/python/python3 \
    # 解决直接make && make install会报错：zipimport.ZipImportError: can't decompress data; zlib not available问题
    && sed -i s/#zlib/zlib/g /usr/local/Python-3.6.8/Modules/Setup \
    && cd /usr/local/Python-3.6.8/Modules/zlib && ./configure && make install \
    && cd /usr/local/Python-3.6.8 && make -j8 && make install \
    # 5.设置python3软链
    && ln -s /usr/local/python/python3/bin/python3 /usr/bin/python \
    # 修改yum，yum是基于python2
    && sed -i s/python/python2.7/g /usr/bin/yum \
    # 6.安装pip, wget http://bootstrap.pypa.io/get-pip.py
    && cd /usr/local && mv /tools/get-pip.py /usr/local/ && python get-pip.py \
    && ln -s /usr/local/python/python3/bin/pip3 /usr/bin/pip \
    # 7.支持中文
    # && echo "export LC_ALL=en_US.UTF-8" >> /etc/profile && source  /etc/profile \
    # && echo "export LC_ALL=en_US.UTF-8" >> ~/.bashrc && source ~/.bashrc \
    # 8.清理安装文件
    && yum clean all && rm -rf ~/.cache && rm -rf /var/cache/* && rm -rf /tools

ENV LANG zh_CN.UTF-8
ENV LC_ALL zh_CN.UTF-8
