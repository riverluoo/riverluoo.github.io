# 安装git 
## 查看是否已安装git
~~~
git --version
~~~
## yum 安装git
~~~
yum install -y git
~~~
## 卸载git
~~~
yum remove git
~~~

# 安装docker
## 更新yum包
~~~
sudo yum update
~~~
## 安装软件包
~~~
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
~~~
## 设置yum源
~~~
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
~~~
## 安装最新版
~~~
sudo yum install docker-ce
~~~
## 启动
~~~
sudo systemctl start docker
~~~
## 加入开机启动
~~~
sudo systemctl enable docker
~~~
## 版本(client & server)
~~~
docker version
~~~

# 安装 docker-compose
## 安装 python-pip
~~~
yum -y install epel-release
~~~
## pip 版本
~~~
pip -V
~~~
## 更新pip
~~~
pip install --upgrade pip
~~~
## 安装 docker-compose
~~~
pip install docker-compose --ignore-installed requests 
~~~
## docker-compose 版本
~~~
docker-compose -version
~~~
