# oss-copy

### 特性用途

- 同步文件目录或文件到OSS，可用于本地的同步盘
- 静态资源发布脚本，可单独使用，或者把命令部署在jenkins等
- 图床工具，写作markdown配套的工具


### 步骤
**1、依赖工具ossutil**

代码依赖ossutil命令，安装参考：<https://help.aliyun.com/document_detail/120075.html>

以mac为例
```
#下载mac安装包，其他客户端命令不一样
wget https://gosspublic.alicdn.com/ossutil/1.7.10/ossutilmac64
#创建命令软链接
ln -n ossutilmac64 /usr/local/bin/ossutil
```

**2、阿里云OSS配置**
- 创建 Bucket，Bucket名称就是下面的配置项bucketName
- 阿里云管理后台配置 Access Key和权限
- Bucket文件管理设置好 Access Key的读写授权


**3、克隆代码**
```
git clone git@github.com:lifeibest/oss-copy.git
```

**4、修改oss-copy.sh文件里的配置部分**
```
vi oss-copy.sh
```
> ps，没有将配置文件单独领出来，尽可能用1个文件代替所有功能，比如自动发布的时候只需要命令，引入其他文件会更麻烦，建议有特殊需求的可自行根据ossutil完成代码修改

**设置选项参数**
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
#localDir 本地需要同步的文件目录，确保本地文件目录存在
localDir="xxx"
#d stDir 如果目录没有，会自动创建，测试的时候尽量新建一个目录，避免同步的时候文件被覆盖
dstDir="xxx"
# ossutilCmd ossutil命令行位置，比如"/usr/local/bin/ossutil"
ossutilCmd="/usr/local/bin/ossutil"
# ---配置结束
```

**5、运行**
```
#添加文件执行权限
chmod +x oss-copy.sh
./oss-copy.sh
```
