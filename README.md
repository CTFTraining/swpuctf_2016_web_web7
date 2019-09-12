# SWPUCTF 2016 Web Web7

## 题目详情

- SWPU 2016 Web7

## 考点
- Python2 Urllib2头部注入(CVE-2016-5699)
- Redis SSRF

## 启动
- docker-compose up -d
- open http://127.0.0.1:8409/

## 题目说明
- Flag位于files/src/flag中，Docker中位于/app/src/flag中。
- 最新版的Python已经修复该漏洞，因此我选择老版本的Python2(Python 2.7.5)，Docker镜像build时进行编译。
- Redis自3.2.7版加入对请求包中`POST`与`Host:`的检测，因此我选择老版本的Redis(Redis 2.6.14)，Docker镜像build时进行编译。
- Alpine Linux没法编译Python与Redis。只能用Ubuntu了。
- 原题有个/web7/的URL前缀，我去掉了。
- 默认暴露8080端口，非80端口。
- 部署时需要给出[index.py](https://github.com/Tiaonmmn/swpuctf_2016_web_web7/blob/master/files/src/index.py)。

## Writeup
- https://blog.csdn.net/niexinming/article/details/53024755

## 版权
该题目复现环境尚未取得主办方及出题人相关授权，如果侵权，请联系本人删除（tiaonmmn@live.cn）
本题原Repo为https://github.com/wonderkun/CTF_web/tree/master/web200-4，我给Docker化，省略了环境配置。
原Repo中的poc.py是错的。。。
本题最初Author是niexinming。
