### 1. 检查系统要求

```
lsb_release -a //查看系统信息

No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 20.04 LTS
Release:        20.04
Codename:       focal
```
### 2.安装Docker(以Ubuntu为例)
2.1 更新系统包索引
```
sudo apt update
sudo apt upgrade -y
```
2.2 安装必要的依赖
```
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
```
2.3 添加Docker官方的GPG密钥
```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```
2.4 添加Docker的APT软件包源
```
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

```
2.5 更新包索引并安装Docker
```
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

```
2.6 验证Docker是否成功安装
```
docker --version

Docker version 24.0.7, build 24.0.7-0ubuntu2~20.04.1
```

### 3.0 不支持 systemd 情况下启动docker
因为我是在Windows 11 安装的子系统Ubuntu 24.0，它不支持systemd。所以我手动启动
3.1 手动启动docker守护线程dockerd
```
sudo dockerd //输出以下启动信息

moka_linux@DESKTOP-N0PHB29:~$ sudo dockerd
INFO[2024-12-03T22:25:20.461830500+08:00] Starting up
INFO[2024-12-03T22:25:20.467698000+08:00] containerd not running, starting managed containerd
INFO[2024-12-03T22:25:20.475892900+08:00] started new containerd process                address=/var/run/docker/containerd/containerd.sock module=libcontainerd pid=44
......
```
3.2 查看docker信息
```
docker info 
Client:
 Version:    24.0.7
 Context:    default
 Debug Mode: false

Server:
ERROR: permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get "http://%2Fvar%2Frun%2Fdocker.sock/v1.24/info": dial unix /var/run/docker.sock: connect: permission denied
提示没有权限

添加权限

groups $user //查看当前用户群组
moka_linux adm dialout cdrom floppy sudo audio dip video plugdev netdev

sudo usermod -aG docker $USER //将当前用户添加进docker群组
newgrp docker
groups $user 
docker adm dialout cdrom floppy sudo audio dip video plugdev netdev moka_linux

docker info
Client:
 Version:    24.0.7
 Context:    default
 Debug Mode: false

Server:
 Containers: 0
  Running: 0
  Paused: 0
  Stopped: 0
 Images: 0
 Server Version: 24.0.7
 Storage Driver: overlay2
  Backing Filesystem: extfs
  Supports d_type: true
  Using metacopy: false
  Native Overlay Diff: true
  userxattr: false
 Logging Driver: json-file
 Cgroup Driver: cgroupfs
 Cgroup Version: 1
 Plugins:
  Volume: local
  Network: bridge host ipvlan macvlan null overlay
  Log: awslogs fluentd gcplogs gelf journald json-file local logentries splunk syslog
 Swarm: inactive
 Runtimes: io.containerd.runc.v2 runc
 Default Runtime: runc
 Init Binary: docker-init
 containerd version:
 runc version:
 init version:
 Security Options:
  seccomp
   Profile: builtin
 Kernel Version: 5.10.16.3-microsoft-standard-WSL2
 Operating System: Ubuntu 20.04.6 LTS
 OSType: linux
 Architecture: x86_64
 CPUs: 8
 Total Memory: 3.7

 成功查看到docker 信息

```
3.3 查看docker 是否运行
```
ps aux | grep dockerd

root        32  0.0  0.1  11032  4536 pts/0    S+   22:25   0:00 sudo dockerd
root        33  0.1  2.0 2272972 80052 pts/0   Sl+  22:25   0:00 dockerd
moka_li+   204  0.0  0.0   8164   712 pts/1    S+   22:29   0:00 grep --color=auto dockerd


```
### 4.Docker安装Mysql 



