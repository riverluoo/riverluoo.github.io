# 安装 git

## 查看是否已安装 git

```
git --version
```

## yum 安装 git

```
yum install -y git
```

## 卸载 git

```
yum remove git
```

# 安装 docker

## 更新 yum 包

```
sudo yum update
```

## 安装软件包

```
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
```

## 设置 yum 源

```
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
```

## 安装最新版

```
sudo yum install docker-ce
```

## 启动

```
sudo systemctl start docker
```

## 加入开机启动

```
sudo systemctl enable docker
```

## 版本(client & server)

```
docker version
```

# 安装 docker-compose

## 安装 python-pip

```
yum -y install epel-release
```

## pip 版本

```
pip -V
```

## 更新 pip

```
pip install --upgrade pip
```

## 安装 docker-compose

```
pip install docker-compose --ignore-installed requests
```

## docker-compose 版本

```
docker-compose -version
```

# 安装 nodejs

## 下载 nodejs

- 版本选择

```
https://npm.taobao.org/mirrors/node
```

- 下载

```
wget https://npm.taobao.org/mirrors/node/v8.0.0/node-v8.0.0-linux-x64.tar.xz
```

## 解压

```
tar -xvf  node-v8.0.0-linux-x64.tar.xz
```

## 软链接到全局

```
ln -s /node-v8.0.0-linux-x64/bin/node /usr/bin/node
ln -s /node-v8.0.0-linux-x64/bin/npm /usr/bin/npm
```

## 安装 pm2

```
npm install -g pm2
```

## 软链接到全局

```
ln -s /node-v8.0.0-linux-x64/bin/pm2 /usr/bin/pm2
```

# 安装 jdk

## yum 方式

```
// 选择版本
yum search java|grep jdk
// 安装
yum install java-1.8.0-openjdk.x86_64
```

```
vim /etc/profile

#java environment
export JAVA_HOME=/opt/jdk-11
export CLASSPATH=.:${JAVA_HOME}/jre/lib/rt.jar:${JAVA_HOME}/lib/dt.jar:${JAVA_HOME}/lib/tools.jar
export PATH=$PATH:${JAVA_HOME}/bin
```

# oh-my-zsh

## zsh

```
yum install zsh -y
```

## oh-my-zsh

```
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```

## theme

```
vim .zshrc

ZSH_THEME="sunrise"
```

## default shell

```
chsh -s /bin/zsh
```

# nginx

## gcc

```
yum install gcc-c++
```

## PCRE pcre-devel

```
yum install -y pcre pcre-devel
```

## zlib

```
yum install -y zlib zlib-devel
```

## OpenSSL

```
yum install -y openssl openssl-devel
```

## download

```
wget -c https://nginx.org/download/nginx-1.14.0.tar.gz
```

## unzip

```
tar -zxvf nginx-1.14.0.tar.gz
```

## https

```
./configure --with-http_ssl_module
```

## install

```
make
make install
```

