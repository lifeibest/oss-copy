# oss-copy
oss文件自动同步脚本，可作为发布部署静态网站的脚本，可当作图床

项目依赖阿里云oss ossutil命令行工具 <https://help.aliyun.com/document_detail/50451.html>

### 步骤
#### 安装 ossutil 
参考链接 <https://help.aliyun.com/document_detail/120075.html>

### 阿里云配置oss
阿里云管理后台配置 Access Key和权限

### 设置项目参数
```
# ---配置开始
# 修改下面各配置变量
# oss配置，accessKeyID在OSS管理后台设置好读写权限
endpoint="xxx.aliyuncs.com"
accessKeyID="xxx"
accessKeySecret="xxx"
bucketName="xxx"

# ossutilconfigFile存储配置的文件
ossutilconfigFile="/tmp/.ossutilconfig"
#localDir 本地需要同步的文件目录
localDir="xxx"
#d stDir 如果目录没有，会自动创建，测试的时候尽量新建一个目录，避免同步的时候文件被覆盖
dstDir="xxx"
# ossutilCmd ossutil命令行位置，比如"/usr/bin/ossutil"
ossutilCmd="/usr/bin/ossutil"
# ---配置结束
```

### 运行
```
./oss-copy.sh
```

